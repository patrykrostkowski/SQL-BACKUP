USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgADM].[SrcDIMPolicyTermChangeHistory]    Script Date: 28.10.2022 13:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [StgADM].[SrcDIMPolicyTermChangeHistory] @CutOffDateFrom VARCHAR(100)
AS
DECLARE @DateFrom DATETIME = cast(@CutOffDateFrom AS DATETIME);

WITH deductible_cte
AS (
	SELECT TOP 1 CASE 
			WHEN tlt.LevelTypeCode = 'Policy'
				THEN pde.deductiblevalue
			ELSE 0
			END AS deductibleValue
		,pde.PolicyTransSK
	FROM Policy.PolicyDeductible pde
	LEFT JOIN Typelist.LevelType tlt ON tlt.LevelTypeSK = pde.DeductibleLevelSK
	ORDER BY deductibleValue
	),
profit_center_cte AS
(
select tpl.ProfitCenterCode,tpl.PolicyTransSK, row_number() over(partition by tpl.ProfitCenterCode order by tpl.ProfitCenterCode) as rn from(
select ProfitCenterCode, ptr.PolicyTransSK from policy.PolicyTrans ptr
left join Policy.PolicyLineofBusiness lob on lob.PolicyTransSK = ptr.PolicyTransSK
left join Typelist.ProfitCenter tpc on lob.ProfitCenterSK = tpc.ProfitCenterSK
)tpl
)
SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (
			PARTITION BY SourceSystemCode
			,SourceCode ORDER BY PolicyTermEffectiveDate DESC
			) AS rn
	FROM (
		SELECT src.SourceSystemCode AS SourceSystemCode
			,pts.SourceCode AS SourceCode
			,pts.TransStartDatetime AS HistoricalSnapshotFromDtm
			,pts.TransEndDatetime AS HistoricalSnapshotToDtm
			,pts.PolicyNum AS PolicyNbr
			,NULL AS PolicyShortId
			,pts.TermNum AS PolicyTermId
			,pts.PolicyTransNum AS PolicyTermChangeId
			,tpt.PolicyTransTypeCode AS PolicyTermChangeTypeCkCode
			,pts.TransStartDatetime AS PolicyTermChangeEffectiveDate
			,pts.PolicyTransVersionNum AS PolicyTermChangeSeq
			,pts.ProcessDateTime AS PolicyTermChangeEnteredDtm
			,pid.AccountNum AS PrimaryPolicyHolderId
			,pag.SourceCode AS AgencyHistorySkCode
			,tda.DirectAssumedCode AS CoverageAcquistionTypeCkCode
			,'R' AS CoverageDispositionTypeCkCode
			,NULL AS TestPolicyTermInd
			,NULL AS InstantQuotePolicyInd
			,tct.CoverageTriggerCode AS ClaimFilingTypeCkCode
			,NULL AS PolicyTermGoverningJurisdictionSk -- required on ratingplan
			,NULL AS PolicyTermGoverningJurisdictionGoverningClassCode -- required on ratingplan
			,pwc.WritingCompanyCode AS WritingCompanyHistorySkCode
			,NULL AS NewRenewalBusinessTypeCk
			,tps.PolicyStatusCode AS PolicyLifeCycleStatusCkCode
			,pol.ProducingBranchNum AS ProducingBranchCkCode
			,plb.ProfitCenterCode AS ProfitCenterCkCode
			,pol.AuditFrequencyCode AS AuditFrequencyCode
			,cast(pts.PolicyEffectiveDate AS DATETIME) AS PolicyTermEffectiveDate
			,LEFT(pts.PolicyEffectiveDate, 4) AS PolicyTermYear
			,pts.PolicyCancellationDate AS PolicyTermCancellationDate
			,pts.PolicyExpirationDate AS PolicyTermExpirationDate
			,pde.DeductibleValue AS PolicyTermDeductibleAggregateLimitAmt
		FROM Policy.PolicyTrans pts
		JOIN Typelist.SourceSystem src ON src.SourceSystemSK = pts.SourceSystemSK
		JOIN Typelist.PolicyTransType tpt ON tpt.PolicyTransTypeSK = pts.PolicyTransTypeSK
		LEFT JOIN Policy.Policy pol ON pol.PolicySK = pts.PolicySK
		LEFT JOIN Typelist.PolicyStatus tps ON tps.PolicyStatusSK = pol.PolicyStatusSK
		LEFT JOIN Party.Insured pid ON pid.InsuredSK = pol.InsuredSK
		LEFT JOIN Party.Agency pag ON pag.AgencySK = pol.AgencySK
		LEFT JOIN Typelist.DirectAssumed tda ON tda.DirectAssumedSK = pol.DirectAssumedSK
		LEFT JOIN Typelist.CoverageTrigger tct ON tct.CoverageTriggerSK = pts.CoverageTriggerSK
		LEFT JOIN Party.WritingCompany pwc ON pwc.WritingCompanySK = pts.WritingCompanySK
		LEFT JOIN profit_center_cte plb ON plb.PolicyTransSK = pts.PolicyTransSK and rn = 1
		LEFT JOIN deductible_cte pde ON pde.PolicyTransSK = pts.PolicyTransSK
		LEFT JOIN Claim.ClaimPolicyAssociation cpa ON cpa.PolicySK = pol.PolicySK
		LEFT JOIN Claim.ClaimPolicy ccp ON ccp.ClaimPolicySK = cpa.ClaimPolicySK
		WHERE pts.ETLUpdateDateTime > @DateFrom
		) tpl
	) rn
GO
