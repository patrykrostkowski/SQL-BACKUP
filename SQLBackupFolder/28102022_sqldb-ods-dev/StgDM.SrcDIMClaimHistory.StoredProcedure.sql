USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgDM].[SrcDIMClaimHistory]    Script Date: 28.10.2022 12:27:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [StgDM].[SrcDIMClaimHistory] @CutOffDateFrom VARCHAR(100)
AS
DECLARE @DateFrom DATETIME = CAST('1-1-1900' AS DATETIME)

;
WITH state_attribute AS (
		SELECT sta.StateSK
			,sta.StateCode
			,sta.StateName
			,clm.claimSK
		FROM claim.Claim clm
		JOIN claim.ClaimLocation clc ON clm.ClaimSK = clc.ClaimSK
		JOIN Typelist.STATE sta ON clc.StateSK = sta.StateSK
		)
	,agency AS (
		SELECT agn.AgencyNum
			,clm.ClaimSK
			,agn.SourceCode

		FROM claim.Claim clm
		JOIN claim.ClaimPolicyAssociation cpa ON clm.ClaimSK = cpa.ClaimSK
		JOIN Policy.Policy pol ON cpa.PolicySK = pol.PolicySK
		JOIN Party.Agency agn ON agn.AgencySK = pol.AgencySK
		)
	,LOB AS (
		SELECT lob.AnnualStatementLineofBusinessSK
			,cpa.ClaimSK
			,lob.AnnualStatementLineofBusinessCode
		FROM Claim.ClaimPolicyAssociation cpa
		JOIN Claim.ClaimCoverage cov ON cov.ClaimPolicySK = cpa.ClaimPolicySK
		JOIN Typelist.AnnualStatementLineOfBusiness lob ON lob.AnnualStatementLineofBusinessSK = cov.AnnualStatementLineofBusinessSK
		
		)
	,ClaimPolicy
	AS (
		SELECT 
			   clm.ClaimSK
			  ,cpy.SourceCode
			  ,pol.SourceCode as PolicySourceCode
			  ,tss.SourceSystemCode as PolicySourceSystemCode
		FROM claim.Claim clm
		JOIN Claim.ClaimPolicyAssociation cpa ON cpa.ClaimSK = clm.ClaimSK
		JOIN Claim.ClaimPolicy cpy ON cpy.ClaimPolicySK = cpa.ClaimPolicySK
		LEFT JOIN Policy.Policy pol ON pol.PolicySK = cpa.PolicySK
		LEFT JOIN Typelist.SourceSystem tss on pol.SourceSystemSK = tss.SourceSystemSK
		)
    ,CoverageAcquisitionType AS (
	                       SELECT clm.ClaimSK
		                          ,das.DirectAssumedCode
								  ,ppy.PolicySK
								  ,das.DirectAssumedSK
								  
		   
		   FRom Claim.Claim clm
		   JOIN Claim.ClaimPolicyAssociation cpa ON Clm.ClaimSK= cpa.ClaimSK
		   JOIN Policy.Policy ppy ON ppy.PolicySK = cpa.PolicySK
		   JOIN Typelist.DirectAssumed das ON ppy.DirectAssumedSK = das.DirectAssumedSK
		   )
	,MostRecentReopenDateCTE AS (

	SELECT MAX(ReOpenDate) as MostRecentReopenDate, ClaimSK
	FROM Claim.ClaimStatusHistory csh
	GROUP BY ClaimSK
	)
	,MostRecentClosedDateCTE AS (

	SELECT MAX(CloseDate) as MostRecentClosedDate, ClaimSK
	FROM Claim.ClaimStatusHistory csh
	WHERE CloseReasonDesc is not null
	GROUP BY ClaimSK
	)
  

SELECT clm.SourceCode AS SourceCode
	,mrc.MostRecentClosedDate AS MostRecentClosedDate
	,mro.MostRecentReopenDate AS MostRecentReopenedDate
	,clm.ProcessDateTime 
	,TRY_CONVERT(DATETIME, '1900-01-01') as HistoricalSnapshotEffectiveFromDtm	
	,TRY_CONVERT(DATETIME, '3000-01-01') as HistoricalSnapshotEffectiveToDtm
	,src.SourceSystemCode AS SourceSystemCode
	,clm.ClaimNum AS ClaimNbr
	,clm.ClaimDesc AS ClaimDesc
	,clm.EventDate AS AccidentDate
	,cast(NULL AS VARCHAR(400)) AS AccidentDesc
	,sta.StateCode AS AccidentJurisdictionCode
	,'STATE'  AS AccidentJurisdictionTypeCode
	---,sta.StateName AS AccidentJurisdictionName --Not present in Tgt
	,cast(NULL AS time) AS AccidentTime
	,cast(NULL AS VARCHAR(25)) AS AccidentYearMonth
	--,NULL AS ACCSRTCK---Not present in Tgt 
	,cast(NULL as int) AS LossYearRangeCK
	,agn.AgencyNum
	,agn.SourceCode AS AgencySourceCode
	--,NULL AS BIPDOtherCK---Not present in Tgt
	--,cpa.PolicySK AS BusinessUnitCode
	,cat.CatastropheNum
	,lob.AnnualStatementLineofBusinessCode AS ClaimLOBCategoryCode
	,cst.ClaimStatusCode AS ClaimLifeCycleStatusCode
	--,(
	--	CASE 
	--		WHEN csh.CloseReasonDesc IS NOT NULL
	--			THEN csh.CloseReasonDesc
	--		ELSE csh.ReopenReasonDesc
	--		END
	--	) AS ClaimLifeCycleStatusReasonDesc
	--,NULL AS ClaimPolicyHistorySK
	,phy.SourceCode AS ClaimPolicySourceCode
	,phy.PolicySourceSystemCode
	,phy.PolicySourceCode
	,clm.OpenedDate AS ClaimOpenedDate
	,SUBSTRING(CONVERT(nvarchar(6),clm.OpenedDate, 112),1,7) AS ClaimOpenedYearMonth
	,clm.ReportedtoInsuredDate AS ClaimReportedDate
	,cast(NULL as int) AS ClaimsProcessingUnitCK
	,caq.DirectAssumedCode AS CoverageAcquisitionTypeCode
	,'R' AS CoverageDispositionTypeCode
	,sta.StateCode AS ExposureJurisdictionCode
	,'STATE' AS ExposureJurisdictionTypeCode
	,cast(NULL as int) AS LifeDisabilityDeathInd
	,cast(NULL as int) AS LOBClaimEvaluationTypeCK
	,cast(NULL as int) AS LocationNbr
	,cls.CauseofLossCode AS LossCauseTypeCode
	,cls.CauseofLossCode AS LossCauseGroupCode 
	,clc.Line1Address AS LossLocationAddressLine1
	,clc.Line2Address AS LossLocationAddressLine2
	,clc.CityName AS LossLocationCityName
	,sta.StateCode AS LossLocationStateCode
	,'STATE'  AS LossLocationStateTypeCode
	,clc.PostalCode AS LossLocationPostalCode
	,tcy.CountryCode AS LossLocationCountryCode
	,los.SequenceNum AS LossOccurrenceSequenceNbr
	,cast(NULL as VARCHAR(75)) AS OrganizationName
	,cast(NULL as int) AS PrimaryClaimsExaminerSK
	,NULL AS PrimaryInjuredBodyPartCK
	,NULL AS PrimaryInjuryCauseTypeCK
	,NULL AS PrimaryInjuryTypeCK
	,cast(NULL as int) AS ProducingBranchHistorySK
	,cast(NULL as int) AS ReserveSegmentCK
	,cast(NULL as int) AS StatisticalLossCauseCK
FROM Claim.Claim clm
JOIN Typelist.SourceSystem src ON clm.SourceSystemSK = src.SourceSystemSK
LEFT JOIN state_attribute sta ON sta.ClaimSK = clm.ClaimSK
LEFT JOIN ClaimPolicy phy ON phy.claimSK = clm.ClaimSK
LEFT JOIN agency agn ON agn.ClaimSK = clm.ClaimSK
LEFT JOIN Claim.Catastrophe cat ON cat.CatastropheSK = clm.CatastropheSK
LEFT JOIN LOB lob ON lob.ClaimSK = clm.ClaimSK
LEFT JOIN Typelist.ClaimStatus cst ON cst.ClaimStatusSK = clm.ClaimStatusSK
LEFT JOIN MostRecentClosedDateCTE mrc on mrc.ClaimSK = clm.ClaimSK
LEFT JOIN MostRecentReopenDateCTE mro ON mro.ClaimSK = clm.ClaimSK
LEFT JOIN Typelist.CauseofLoss cls ON cls.CauseofLossSK = clm.CauseofLossSK
LEFT JOIN Claim.ClaimLocation clc ON clc.ClaimSK = clm.ClaimSK
LEFT JOIN Typelist.Country tcy ON clc.CountrySK = tcy.CountrySK
LEFT JOIN Claim.LossOccurrence los ON los.ClaimSK = clm.ClaimSK
LEFT JOIN CoverageAcquisitionType caq ON caq.ClaimSK = clm.ClaimSK
where
	 clm.ETLCreateDateTime > @DateFrom --and clm.ClaimNum = 'CLM0000265481'
GO
