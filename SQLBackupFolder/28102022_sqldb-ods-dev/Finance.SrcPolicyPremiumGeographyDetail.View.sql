USE [sqldb-ods-dev]
GO
/****** Object:  View [Finance].[SrcPolicyPremiumGeographyDetail]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE     VIEW [Finance].[SrcPolicyPremiumGeographyDetail]
AS 

WITH DirectTaxCte AS (
SELECT 
	SUM(pcf.CoverageFeeBaseAmt) AS DirectTaxBaseAmt
	,SUM(pcf.CoverageFeeOriginalAmt) AS DirectTaxOriginalAmt
	,SUM(pcf.CoverageFeeReportingAmt) AS DirectTaxReportingAmt
	,geo.PolicyGeographySK
FROM Policy.PolicyCoverageFee pcf
JOIN Policy.PolicyGeography geo on geo.PolicyGeographySK = pcf.PolicyGeographySK
JOIN Typelist.CoverageFeeType cft on  cft.CoverageFeeTypeSK = pcf.CoverageFeeTypeSK
WHERE cft.CoverageFeeTypeCode = 'Tax'--this condition need to be confirmed when we will have proper data in CoverageFeeType(no CoverageFeeTypeCode = 'Tax' in typelist CoverageFeeType)
GROUP BY 
geo.PolicyGeographySK
),

DirectSurchargeCte AS (
SELECT 
	SUM(pcf.CoverageFeeBaseAmt) AS DirectSurchargeBaseAmt
	,SUM(pcf.CoverageFeeOriginalAmt) AS DirectSurchargeOriginalAmt
	,SUM(pcf.CoverageFeeReportingAmt) AS DirectSurchargeReportingAmt
	,geo.PolicyGeographySK
FROM Policy.PolicyCoverageFee pcf
JOIN Policy.PolicyGeography geo on geo.PolicyGeographySK = pcf.PolicyGeographySK
JOIN Typelist.CoverageFeeType cft on  cft.CoverageFeeTypeSK = pcf.CoverageFeeTypeSK
WHERE cft.CoverageFeeTypeCode = 'Surcharge'--this condition need to be confirmed when we will have proper data in CoverageFeeType(no CoverageFeeTypeCode = 'Tax' in typelist CoverageFeeType)
GROUP BY 
geo.PolicyGeographySK
),

DirectFeeCte AS (
SELECT 
	SUM(pcf.CoverageFeeBaseAmt) AS DirectFeeBaseAmt
	,SUM(pcf.CoverageFeeOriginalAmt) AS DirectFeeOriginalAmt
	,SUM(pcf.CoverageFeeReportingAmt) AS DirectFeeReportingAmt
	,geo.PolicyGeographySK
FROM Policy.PolicyCoverageFee pcf
JOIN Policy.PolicyGeography geo on geo.PolicyGeographySK = pcf.PolicyGeographySK
JOIN Typelist.CoverageFeeType cft on  cft.CoverageFeeTypeSK = pcf.CoverageFeeTypeSK
WHERE cft.CoverageFeeTypeCode = 'Fee'--this condition need to be confirmed when we will have proper data in CoverageFeeType(no CoverageFeeTypeCode = 'Tax' in typelist CoverageFeeType)
GROUP BY 
geo.PolicyGeographySK
),

PolicyDiscountCte AS (
SELECT 
	 SUM(dsc.PolicyDiscountBaseAmt) AS PolicyDiscountBaseAmt
	,SUM(dsc.PolicyDiscountOriginalAmt) AS PolicyDiscountOriginalAmt
	,SUM(dsc.PolicyDiscountReportingAmt) AS PolicyDiscountReportingAmt
	,geo.PolicyGeographySK
FROM Policy.PolicyDiscount dsc
JOIN Policy.PolicyGeography geo on geo.PolicyGeographySK = dsc.PolicyGeographySK

GROUP BY 
geo.PolicyGeographySK
)




SELECT 
	   geo.PolicyGeographySK AS PolicyPremiumGeographyDetailSK 
      ,geo.ETLCreateDateTime 
      ,geo.ETLUpdateDateTime 
      ,geo.ETLCreateProcessNum 
      ,geo.ETLUpdateProcessNum 
      ,geo.SourceSystemSK 
      ,geo.SourceCode 
      ,geo.ProcessDateTime 
      ,stt.FinancialSourceTransactionTypeSK 
      ,ptr.TransStartDatetime AS TransactionDate 
      ,ptr.ProcessDateTime AS EntryDate 
      ,null AS SettlementDate 
      ,null AS  LastAllocationDate 
      ,ptr.WritingCompanySK 
      ,pph.PolicyPremiumHeaderSK 
      ,ptd.PolicyPremiumTransactionDetailSK 
      ,plob.PolicyPremiumlLineofBusinessDetailSK 
      ,ptr.PolicyTransTypeSK 
      ,ptr.TransStartDateTime 
      ,ptr.TransEndDateTime 
      ,ptr.PolicyTransNum 
      ,lob.LineofBusinessSK 
      ,sub.SublineSK 
      ,geo.StateSK AS RiskStateSK 
      ,pol.AnnualStatementLineofBusinessSK 
      ,ptr.OriginalCurrencySK 
      ,ptr.BaseCurrencySK 
      ,ptr.ReportingCurrencySK 
      ,0 AS EstimatedWrittenPremiumBaseAmt 	    -- verify by David
      ,0 AS EstimatedWrittenPremiumOriginalAmt  -- verify by David
      ,0 AS EstimatedWrittenPremiumReportingAmt -- verify by David
      ,geo.AddlRetPremBaseAmt AS AddlRetPremiumBaseAmt 
      ,geo.AddlRetPremOriginalAmt AS AddlRetPremiumOriginalAmt 
      ,geo.AddlRetPremReportingAmt AS AddlRetPremiumReportingAmt 
      ,pod.PolicyDiscountBaseAmt 
      ,pod.PolicyDiscountOriginalAmt 
      ,pod.PolicyDiscountReportingAmt 
      ,lob.TermPremiumBaseAmt AS DirectWrittenPremiumBaseAmt 
      ,lob.TermPremiumOriginalAmt AS DirectWrittenPremiumOriginalAmt 
      ,lob.TermPremiumReportingAmt AS DirectWrittenPremiumReportingAmt 
      ,tax.DirectTaxBaseAmt 
      ,tax.DirectTaxOriginalAmt 
      ,tax.DirectTaxReportingAmt 
      ,sur.DirectSurchargeBaseAmt 
      ,sur.DirectSurchargeOriginalAmt 
      ,sur.DirectSurchargeReportingAmt 
      ,fee.DirectFeeBaseAmt 
      ,fee.DirectFeeOriginalAmt 
      ,fee.DirectFeeReportingAmt 
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
      ,lob.CommissionBaseAmt 
      ,lob.CommissionOriginalAmt 
      ,lob.CommissionReportingAmt 
      ,lob.CommissionPct 
      ,0 AS IsPremiumWaivedInd 
FROM Policy.PolicyGeography geo
JOIN Policy.PolicyTrans ptr on geo.PolicyTransSK = ptr.PolicyTransSK
JOIN Finance.SrcPolicyPremiumHeader pph on pph.PolicyTransSK = ptr.PolicyTransSK
JOIN Finance.SrcPolicyPremiumTransactionDetail ptd on ptd.PolicyPremiumTransactionDetailSK = ptr.PolicyTransSK
left JOIN Finance.SrcPolicyPremiumlLineofBusinessDetail plob on plob.PolicyPremiumlLineofBusinessDetailSK = geo.PolicyLineofBusinessSK
LEFT JOIN Typelist.FinancialSourceTransactionType stt on stt.FinancialSourceTransactionTypeCode = 'Non-Verified'
JOIN Policy.PolicyLineofBusiness lob on lob.PolicyLineofBusinessSK = geo.PolicyLineofBusinessSK 
JOIN Policy.PolicySubLine sub on sub.PolicyLineofBusinessSK = geo.PolicyLineofBusinessSK
JOIN Policy.Policy pol on pol.PolicySK = ptr.PolicySK
JOIN PolicyDiscountCte pod on pod.PolicyGeographySK = geo.PolicyGeographySK 
left JOIN DirectTaxCte tax on tax.PolicyGeographySK = geo.PolicyGeographySK
left JOIN DirectSurchargeCte sur on sur.PolicyGeographySK = geo.PolicyGeographySK
left JOIN DirectFeeCte fee on fee.PolicyGeographySK = geo.PolicyGeographySK


GO
