USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgADM].[SrcFactLossTriangleMonthly]    Script Date: 28.10.2022 12:27:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/****** Object:  StoredProcedure [StgADM].[SrcFactLossTransaction]    Script Date: 06-09-2022 16:15:53 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
CREATE   PROCEDURE [StgADM].[SrcFactLossTriangleMonthly] @CutOffDateFrom VARCHAR(100)
AS
DECLARE @DateFrom DATETIME = cast(@CutOffDateFrom AS DATETIME);

WITH cte_business
AS (
	SELECT cpa.ClaimSK
		,bty.BusinessTypeCode
	FROM claim.ClaimPolicyAssociation cpa
	LEFT JOIN Policy.Policy pol ON pol.PolicySK = cpa.PolicySK
	LEFT JOIN Typelist.BusinessType bty ON bty.BusinessTypeSK = pol.BusinessTypeSK
	)
	,cte_GovernClass
AS (
	SELECT geo.GovernClassByStateExposureCodeSK
		,geo.GovernClassByStatePremiumCodeSK
		,potr.PolicySK
		,geo.PolicyTransSK
	FROM Policy.PolicyGeography geo
	JOIN Policy.PolicyTrans potr ON potr.PolicyTransSK = geo.PolicyTransSK
	)
	,cte_NewBuisiness
AS (
	SELECT pott.PolicyTransTypeCode
		,ptr.PolicySK
	FROM Claim.ClaimPolicyAssociation cpa
	JOIN Policy.PolicyTrans ptr ON cpa.PolicySK = ptr.PolicySK
	JOIN Typelist.PolicyTransType pott ON pott.PolicyTransTypeSK = ptr.PolicyTransTypeSK
		AND pott.PolicyTransTypeCode IN (
			'NBIS'
			,'RENEW'
			)
	)
	,cte_ProducingBranch
AS (
	SELECT pol.ProducingBranchNum
		,pol.PolicySK
	FROM Policy.Policy pol
	JOIN Claim.ClaimPolicyAssociation cpa ON cpa.PolicySK = pol.PolicySK
	)
	,cte_ProfitCenter
AS (
	SELECT pctr.ProfitCenterCode
		,ptr.PolicySK
	FROM Claim.ClaimPolicyAssociation cpa
	JOIN Policy.PolicyTrans ptr ON cpa.PolicySK = ptr.PolicySK
	JOIN Typelist.PolicyTransType pott ON pott.PolicyTransTypeSK = ptr.PolicyTransTypeSK
		AND pott.PolicyTransTypeCode IN (
			'NBIS'
			,'RENEW'
			)
	JOIN Policy.PolicyLineofBusiness plob ON plob.PolicyTransSK = ptr.PolicyTransSK
	JOIN Typelist.ProfitCenter pctr ON pctr.ProfitCenterSK = plob.ProfitCenterSK
	)
	,cte_IncurredLoss
AS (
	SELECT clt.ClaimSK
		,SUM(TransactionBaseAmt) AS TransactionBaseAmt
		,clt.FinancialReportingPeriodSK
	FROM Finance.ClaimTransaction clt
	JOIN Typelist.ClaimTransactionType ctt ON ctt.ClaimTransactionTypeSK = clt.ClaimTransactionTypeSK
		AND ClaimTransactionTypeCode IN (
			'Payment'
			,'Reserve'
			)
	JOIN Typelist.CostType costy ON costy.CostTypeSK = clt.CostTypeSK
		AND CostTypeCode IN (
			'medical'
			,'vocational'
			)
	GROUP BY clt.ClaimSK
		,clt.FinancialReportingPeriodSK
	)
	,cte_PaidLoss
AS (
	SELECT clt.ClaimSK
		,SUM(TransactionBaseAmt) AS TransactionBaseAmt
		,clt.FinancialReportingPeriodSK
	FROM Finance.ClaimTransaction clt
	JOIN Typelist.ClaimTransactionType ctt ON ctt.ClaimTransactionTypeSK = clt.ClaimTransactionTypeSK
		AND ClaimTransactionTypeCode IN ('Payment')
	JOIN Typelist.CostType costy ON costy.CostTypeSK = clt.CostTypeSK
		AND CostTypeCode IN (
			'medical'
			,'vocational'
			)
	GROUP BY clt.ClaimSK
		,clt.FinancialReportingPeriodSK
	)
	,cte_RecoveredAmt
AS (
	SELECT clt.ClaimSK
		,SUM(TransactionBaseAmt) AS TransactionBaseAmt
		,clt.FinancialReportingPeriodSK
	FROM Finance.ClaimTransaction clt
	JOIN Typelist.ClaimTransactionType ctt ON ctt.ClaimTransactionTypeSK = clt.ClaimTransactionTypeSK
		AND ClaimTransactionTypeCode IN ('Payment')
	JOIN Typelist.RecoveryCategoryType rcty ON rcty.RecoveryCategoryTypeSK = clt.RecoveryCategoryTypeSK
		AND clt.RecoveryCategoryTypeSK IS NOT NULL
	GROUP BY clt.ClaimSK
		,clt.FinancialReportingPeriodSK
	)
	,cte_ReservedExpenseAmt
AS (
	SELECT clt.ClaimSK
		,SUM(TransactionBaseAmt) AS TransactionBaseAmt
		,clt.FinancialReportingPeriodSK
	FROM Finance.ClaimTransaction clt
	JOIN Typelist.ClaimTransactionType ctt ON ctt.ClaimTransactionTypeSK = clt.ClaimTransactionTypeSK
		AND ClaimTransactionTypeCode IN ('Reserve')
	JOIN Typelist.CostType costy ON costy.CostTypeSK = clt.CostTypeSK
		AND CostTypeCode IN (
			'ALAE'
			,'ULAE'
			)
	GROUP BY clt.ClaimSK
		,clt.FinancialReportingPeriodSK
	)
	,cte_ReservedLossAmt
AS (
	SELECT clt.ClaimSK
		,SUM(TransactionBaseAmt) AS TransactionBaseAmt
		,clt.FinancialReportingPeriodSK
	FROM Finance.ClaimTransaction clt
	JOIN Typelist.ClaimTransactionType ctt ON ctt.ClaimTransactionTypeSK = clt.ClaimTransactionTypeSK
		AND ClaimTransactionTypeCode IN ('Reserve')
	JOIN Typelist.CostType costy ON costy.CostTypeSK = clt.CostTypeSK
		AND CostTypeCode IN (
			'medical'
			,'vocational'
			)
	GROUP BY clt.ClaimSK
		,clt.FinancialReportingPeriodSK
	)
	,cte_Agency AS(
	select cpa.ClaimSK,bty.BusinessTypeCode from Claim.ClaimPolicyAssociation cpa 
JOIN Policy.Policy pol ON pol.PolicySK=cpa.PolicySK
JOIN Typelist.BusinessType bty ON bty.BusinessTypeSK=pol.BusinessTypeSK
)
SELECT DISTINCT
	--FactLossTransactionSk                         
	--,RowCreatedBySk                                
	--,RowCreatedDtm                                 
	--,RowLastUpdatedBySk                            
	--,RowLastUpdatedDtm                             
	tss.SourceSystemCode
	,clt.SourceSystemSK
	--,CONVERT(VARCHAR(7), frp.FinancialReportingPeriodDate, 126) AS YearMonthDate
	,FORMAT(frp.FinancialReportingPeriodDate, 'y') AS DevelopmentPeriodMonthSkCode
	--,CAST(tfp.FinancialReportingPeriodNum as INT) as AccountingMonthSkCode		-- ADM table DimCalendarMonth attribute MonthNbr
	,clt.ProcessDateTime
	,sub_cloc.StateCode AS AdjudicationJurisdictionSkCode
	,cte_Agency.BusinessTypeCode AS AgencyHistorySkCode
	,cat.CatastropheName AS CatastropheCKName
	,cov.CoverageCode AS CoverageCKCode
	,cvt.CoverageTriggerCode AS ClaimFilingTypeCKCode
	--,cvt.CoverageTriggerCode AS CoverageTriggerCKCode
	,cst.ClaimStatusCode AS ClaimStatusCKCode
	,cte_business.BusinessTypeCode AS BusinessTypeSKCode
	,NULL AS CoverageDeductibleAppliesInd
	,'Retained' AS CoverageDispositionTypeCode
	,sub_cloc.StateCode AS ExposureJurisdictionSkCode
	,NULL AS ExposurePeriodBasisTypeCK
	,FORMAT(frp.FinancialReportingPeriodDate, 'y') AS ExposurePeriodMonthSkCode ----Work on it
	,CONVERT(INT, 0) AS InstantQuotePolicyInd
	,ccd.ClassCode AS JurisdictionExposureGoverningClassCode
	,ccode.ClassCode AS JurisdictionPremiumGoverningClassCode
	,coty.CostTypeCode AS LOBClaimFinancialTransactionClassCKCode
	,cct.ClaimCategoryTypeCode AS LOBClaimTypeCKCode
	,cct.ClaimCategoryTypeCode AS LOBClaimCategoryCKCode
	,CONVERT(INT, 1) AS LOBClaimPayoutLimitRangeSK
	,CONVERT(INT, 1) AS LOBLongTermClaimantTypeCK
	,CONVERT(INT, 1) AS LOBDeductibleRangeSK
	,sub_cloc.StateCode AS LossJurisdictionSkCode
	,cte_NewBuisiness.PolicyTransTypeCode AS NewRenewalBusinessTypeCKCode
	,CASE 
		WHEN cty.ClaimTransactionTypeSK IS NULL
			THEN 0
		ELSE 1
		END AS PaymentsMadeInd
	,cst.ClaimStatusCode AS PolicyLifeCycleStatusCKCode
	,cte_ProducingBranch.ProducingBranchNum AS ProducingBranchCKNum
	,cte_ProfitCenter.ProfitCenterCode AS ProfitCenterCKCode
	,rct.RecoveryCategoryTypeCode AS RecoveryTypeCKCode
	,wcy.WritingCompanyCode AS WritingCompanySKCode
	,cte_IncurredLoss.TransactionBaseAmt AS IncurredLossAmt
	,cte_IncurredLoss.TransactionBaseAmt AS PaidExpenseAmt
	,cte_PaidLoss.TransactionBaseAmt AS PaidLossAmt
	,cte_RecoveredAmt.TransactionBaseAmt AS RecoveredAmt
	,cte_ReservedExpenseAmt.TransactionBaseAmt AS ReservedExpenseAmt
	,cte_ReservedLossAmt.TransactionBaseAmt AS ReservedLossAmt
FROM Finance.ClaimTransaction clt
JOIN Typelist.SourceSystem tss ON clt.SourceSystemSK = tss.SourceSystemSK
LEFT JOIN (
	SELECT sta.StateCode
		,cloc.ClaimSK
	FROM Claim.ClaimLocation cloc
	JOIN Typelist.STATE sta ON sta.StateSK = cloc.StateSK
		AND cloc.IsPrimaryClaimAddressInd = 1
	) sub_cloc ON clt.ClaimSK = sub_cloc.ClaimSK
	LEFT JOIN Typelist.FinancialReportingPeriod frp ON clt.FinancialReportingPeriodSK=frp.FinancialReportingPeriodSK
LEFT JOIN Claim.Claim clm ON clm.ClaimSK = clt.ClaimSK
LEFT JOIN Claim.Catastrophe cat ON cat.CatastropheSK = clm.CatastropheSK
LEFT JOIN Claim.ClaimCoverage ccov ON ccov.ClaimCoverageSK = clt.ClaimCoverageSK
LEFT JOIN Typelist.Coverage cov ON cov.CoverageSK = ccov.CoverageSK
LEFT JOIN Typelist.CoverageTrigger cvt ON cvt.CoverageTriggerSK = clm.CoverageTriggerSK
LEFT JOIN Typelist.ClaimStatus cst ON cst.ClaimStatusSK = clm.ClaimStatusSK
LEFT JOIN cte_business ON cte_business.ClaimSK = clm.ClaimSK
LEFT JOIN cte_GovernClass ON cte_GovernClass.PolicySK = clt.PolicySK
LEFT JOIN Typelist.ClassCode ccd ON ccd.ClassCodeSK = cte_GovernClass.GovernClassByStateExposureCodeSK
LEFT JOIN Typelist.ClassCode ccode ON ccode.ClassCodeSK = cte_GovernClass.GovernClassByStatePremiumCodeSK
LEFT JOIN Typelist.CostType coty ON coty.CostTypeSK = clt.CostTypeSK
LEFT JOIN Typelist.ClaimCategoryType cct ON cct.ClaimCategoryTypeSK = clm.ClaimCategoryTypeSK
LEFT JOIN cte_NewBuisiness ON cte_NewBuisiness.PolicySK = clt.PolicySK
LEFT JOIN Typelist.ClaimTransactionType cty ON cty.ClaimTransactionTypeSK = clt.ClaimTransactionTypeSK
	AND cty.ClaimTransactionTypeCode IN (
		'Payment'
		,'Reserve'
		)
LEFT JOIN cte_ProducingBranch ON cte_ProducingBranch.PolicySK = clt.PolicySK
LEFT JOIN cte_ProfitCenter ON cte_ProfitCenter.PolicySK = clt.PolicySK
LEFT JOIN Typelist.RecoveryCategoryType rct ON rct.RecoveryCategoryTypeSK = clt.RecoveryCategoryTypeSK
LEFT JOIN Party.WritingCompany wcy ON wcy.WritingCompanySK = clt.WritingCompanySK
LEFT JOIN cte_IncurredLoss ON cte_IncurredLoss.ClaimSK = clt.ClaimSK
LEFT JOIN cte_PaidLoss ON cte_PaidLoss.ClaimSK = clt.ClaimSK
LEFT JOIN cte_RecoveredAmt ON cte_RecoveredAmt.ClaimSK = clt.ClaimSK
LEFT JOIN cte_ReservedExpenseAmt ON cte_ReservedExpenseAmt.ClaimSK = clt.ClaimSK
LEFT JOIN cte_ReservedLossAmt ON cte_ReservedLossAmt.ClaimSK = clt.ClaimSK
LEFT JOIN cte_Agency ON cte_Agency.ClaimSK=clt.ClaimSK
WHERE clt.ETLUpdateDateTime > @DateFrom
GO
