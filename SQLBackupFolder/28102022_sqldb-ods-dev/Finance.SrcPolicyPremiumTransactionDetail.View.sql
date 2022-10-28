USE [sqldb-ods-dev]
GO
/****** Object:  View [Finance].[SrcPolicyPremiumTransactionDetail]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     VIEW [Finance].[SrcPolicyPremiumTransactionDetail]
AS 

WITH DirectTaxCte AS (
SELECT 
	SUM(pcf.CoverageFeeBaseAmt) AS DirectTaxBaseAmt
	,SUM(pcf.CoverageFeeOriginalAmt) AS DirectTaxOriginalAmt
	,SUM(pcf.CoverageFeeReportingAmt) AS DirectTaxReportingAmt
	,ptr.PolicyTransSK
FROM Policy.PolicyCoverageFee pcf
JOIN Policy.PolicyTrans ptr on ptr.PolicyTransSK = pcf.PolicyTransSK
JOIN Typelist.CoverageFeeType cft on  cft.CoverageFeeTypeSK = pcf.CoverageFeeTypeSK
WHERE cft.CoverageFeeTypeCode = 'Tax'--this condition need to be confirmed when we will have proper data in CoverageFeeType(no CoverageFeeTypeCode = 'Tax' in typelist CoverageFeeType)
GROUP BY 
ptr.PolicyTransSK
),

DirectSurchargeCte AS (
SELECT 
	SUM(pcf.CoverageFeeBaseAmt) AS DirectSurchargeBaseAmt
	,SUM(pcf.CoverageFeeOriginalAmt) AS DirectSurchargeOriginalAmt
	,SUM(pcf.CoverageFeeReportingAmt) AS DirectSurchargeReportingAmt
	,ptr.PolicyTransSK
FROM Policy.PolicyCoverageFee pcf
JOIN Policy.PolicyTrans ptr on ptr.PolicyTransSK = pcf.PolicyTransSK
JOIN Typelist.CoverageFeeType cft on  cft.CoverageFeeTypeSK = pcf.CoverageFeeTypeSK
WHERE cft.CoverageFeeTypeCode = 'Surcharge'--this condition need to be confirmed when we will have proper data in CoverageFeeType(no CoverageFeeTypeCode = 'Surcharge' in typelist CoverageFeeType)
GROUP BY 
ptr.PolicyTransSK
),

DirectFeeCte AS (
SELECT 
	SUM(pcf.CoverageFeeBaseAmt) AS DirectFeeBaseAmt
	,SUM(pcf.CoverageFeeOriginalAmt) AS DirectFeeOriginalAmt
	,SUM(pcf.CoverageFeeReportingAmt) AS DirectFeeReportingAmt
	,ptr.PolicyTransSK
FROM Policy.PolicyCoverageFee pcf
JOIN Policy.PolicyTrans ptr on ptr.PolicyTransSK = pcf.PolicyTransSK
JOIN Typelist.CoverageFeeType cft on  cft.CoverageFeeTypeSK = pcf.CoverageFeeTypeSK
WHERE cft.CoverageFeeTypeCode = 'Fee'--this condition need to be confirmed when we will have proper data in CoverageFeeType(no CoverageFeeTypeCode = 'Fee' in typelist CoverageFeeType) 
GROUP BY 
ptr.PolicyTransSK
),

CommisionAmtCte AS (
SELECT 
	SUM(lob.CommissionBaseAmt) AS CommissionBaseAmt
	,SUM(lob.CommissionOriginalAmt) AS CommissionOriginalAmt
	,SUM(lob.CommissionReportingAmt) AS CommissionReportingAmt
	,SUM(lob.CommissionPct) AS CommissionPct
	,ptr.PolicyTransSK
FROM Policy.PolicyLineofBusiness lob
JOIN Policy.PolicyTrans ptr on ptr.PolicyTransSK = lob.PolicyTransSK
GROUP BY 
ptr.PolicyTransSK
)



SELECT 
	   ptr.PolicyTransSK AS PolicyPremiumTransactionDetailSK
      ,ptr.ETLCreateDateTime
      ,ptr.ETLUpdateDateTime
      ,ptr.ETLCreateProcessNum
      ,ptr.ETLUpdateProcessNum
	  ,ptr.SourceSystemSK
      ,ptr.SourceCode 
      ,ptr.ProcessDateTime 
      ,fstt.FinancialSourceTransactionTypeSK 
      ,pph.PolicyPremiumHeaderSK 
      ,ptr.TransStartDatetime AS TransactionDate 
      ,ptr.ProcessDateTime AS EntryDate 
      ,null AS SettlementDate 
      ,null AS LastAllocationDate 
      ,ptr.WritingCompanySK 
      ,ptr.PolicyTransTypeSK 
      ,ptr.TransStartDatetime AS TransStartDateTime 
      ,ptr.TransEndDatetime AS TransEndDateTime 
      ,ptr.PolicyTransNum 
      ,pol.AnnualStatementLineofBusinessSK 
      ,ptr.BaseCurrencySK 
      ,ptr.OriginalCurrencySK 
      ,ptr.ReportingCurrencySK 
      ,ptr.EstWrittenPremiumBaseAmt AS EstimatedWrittenPremiumBaseAmt 
      ,ptr.EstWrittenPremiumOriginalAmt AS EstimatedWrittenPremiumOriginalAmt 
      ,ptr.EstWrittenPremiumReportingAmt AS EstimatedWrittenPremiumReportingAmt 
      ,ptr.AddlRetPremiumBaseAmt 
      ,ptr.AddlRetPremiumOriginalAmt 
      ,ptr.AddlRetPremiumReportingAmt 
      ,pod.PolicyDiscountBaseAmt 
      ,pod.PolicyDiscountOriginalAmt 
      ,pod.PolicyDiscountReportingAmt 
      ,ptr.TermPremiumBaseAmt AS DirectWrittenPremiumBaseAmt 
      ,ptr.TermPremiumOriginalAmt AS DirectWrittenPremiumOriginalAmt 
      ,ptr.TermPremiumReportingAmt AS DirectWrittenPremiumReportingAmt 
      ,dtc.DirectTaxBaseAmt -- no CoverageFeeTypeCode = 'Tax' in typelist CoverageFeeType
      ,dtc.DirectTaxOriginalAmt 
      ,dtc.DirectTaxReportingAmt 
      ,dsc.DirectSurchargeBaseAmt --no CoverageFeeTypeCode = 'Surcharge' in typelist CoverageFeeType
      ,dsc.DirectSurchargeOriginalAmt 
      ,dsc.DirectSurchargeReportingAmt 
      ,dfc.DirectFeeBaseAmt --no CoverageFeeTypeCode = 'Fee' in typelist CoverageFeeType
      ,dfc.DirectFeeOriginalAmt 
      ,dfc.DirectFeeReportingAmt 
      ,0 AS AssumedWrittenPremiumBaseAmt 
      ,0 AS AssumedWrittenPremiumOriginalAmt 
      ,0 AS AssumedWrittenPremiumReportingAmt 
      ,0 AS AssumedTaxBaseAmt 
      ,0 AS AssumedTaxOriginalAmt 
      ,0 AS AssumedTaxReportingAmt 
      ,0 AS AssumedSurchargeBaseAmt 
      ,0 AS AssumedSurchargeOriginalAmt 
      ,0 AS AssumedSurchargeReportingAmt 
      ,0 AS AssumedFeeBaseAmt 
      ,0 AS AssumedFeeOriginalAmt 
      ,0 AS AssumedFeeReportingAmt 
      ,cac.CommissionBaseAmt 
      ,cac.CommissionOriginalAmt 
      ,cac.CommissionReportingAmt 
      ,cac.CommissionPct 
      ,0 AS IsPremiumWaivedInd 
FROM Policy.PolicyTrans ptr
JOIN Typelist.SourceSystem src on ptr.SourceSystemSK = src.SourceSystemSK
LEFT JOIN Typelist.FinancialSourceTransactionType fstt on fstt.FinancialSourceTransactionTypeCode = 'Non-Verified'
JOIN Finance.SrcPolicyPremiumHeader pph on ptr.PolicyTransSK = pph.PolicyTransSK
JOIN Policy.Policy pol on pol.PolicySK = ptr.PolicySK
JOIN Policy.PolicyDiscount pod on ptr.PolicyTransSK = pod.PolicyTransSK
left JOIN DirectTaxCte dtc on dtc.PolicyTransSK = ptr.PolicyTransSK
left JOIN DirectSurchargeCte dsc on dsc.PolicyTransSK = ptr.PolicyTransSK
left JOIN DirectFeeCte dfc on dfc.PolicyTransSK = ptr.PolicyTransSK
JOIN CommisionAmtCte cac on cac.PolicyTransSK = ptr.PolicyTransSK



GO
