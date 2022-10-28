USE [sqldb-ods-dev]
GO
/****** Object:  View [Finance].[SrcPolicyPremiumlLineofBusinessDetail]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Finance].[SrcPolicyPremiumlLineofBusinessDetail]
AS 

with cte_DirectTax
as (
	SELECT 
		ISNULL(SUM(pcf.CoverageFeeBaseAmt),0) as DirectTaxBaseAmt
		,ISNULL(SUM(pcf.CoverageFeeOriginalAmt),0) as DirectTaxOriginalAmt
		,ISNULL(SUM(pcf.CoverageFeeReportingAmt),0) as DirectTaxReportingAmt
		,lob.PolicyTransSK
	FROM Policy.PolicyCoverageFee pcf
	JOIN Policy.PolicyLineofBusiness lob ON lob.PolicyLineofBusinessSK = pcf.PolicyLineofBusinessSK
	JOIN Typelist.CoverageFeeType cft ON cft.CoverageFeeTypeSK = pcf.CoverageFeeTypeSK
	WHERE cft.CoverageFeeTypeCode = 'Tax'	
	GROUP BY lob.PolicyTransSK
),

cte_DirectSurcharge
as (
	SELECT 
		ISNULL(SUM(pcf.CoverageFeeBaseAmt),0) as DirectSurchargeBaseAmt
		,ISNULL(SUM(pcf.CoverageFeeOriginalAmt),0) as DirectSurchargeOriginalAmt
		,ISNULL(SUM(pcf.CoverageFeeReportingAmt),0) as DirectSurchargeReportingAmt
		,lob.PolicyTransSK
	FROM Policy.PolicyCoverageFee pcf
	JOIN Policy.PolicyLineofBusiness lob ON lob.PolicyLineofBusinessSK = pcf.PolicyLineofBusinessSK
	JOIN Typelist.CoverageFeeType cft ON cft.CoverageFeeTypeSK = pcf.CoverageFeeTypeSK
	WHERE cft.CoverageFeeTypeCode = 'Surcharge'	
	GROUP BY lob.PolicyTransSK
),

cte_DirectFee
as (
	SELECT 
		ISNULL(SUM(pcf.CoverageFeeBaseAmt),0) as DirectFeeBaseAmt
		,ISNULL(SUM(pcf.CoverageFeeOriginalAmt),0) as DirectFeeOriginalAmt
		,ISNULL(SUM(pcf.CoverageFeeReportingAmt),0) as DirectFeeReportingAmt
		,lob.PolicyTransSK
	FROM Policy.PolicyCoverageFee pcf
	JOIN Policy.PolicyLineofBusiness lob ON lob.PolicyLineofBusinessSK = pcf.PolicyLineofBusinessSK
	JOIN Typelist.CoverageFeeType cft ON cft.CoverageFeeTypeSK = pcf.CoverageFeeTypeSK
	WHERE cft.CoverageFeeTypeCode = 'Fee'	
	GROUP BY lob.PolicyTransSK
)

SELECT 
	lob.PolicyTransSK AS PolicyPremiumlLineofBusinessDetailSK
	,lob.ETLCreateDateTime 
	,lob.ETLUpdateDateTime 
	,lob.ETLCreateProcessNum 
	,lob.ETLUpdateProcessNum 
	,lob.SourceSystemSK 
	,lob.SourceCode 
	,lob.ProcessDateTime 
	,ppt.TransStartDateTime as TransactionDate
	,ppt.ProcessDateTime as EntryDate
	,null as SettlementDate
	,null as LastAllocationDate
	,ppt.WritingCompanySK
	,pph.PolicyPremiumHeaderSK
	,ptd.PolicyPremiumTransactionDetailSK
	,ttt.FinancialSourceTransactionTypeSK
	,ppt.PolicyTransTypeSK
	,ppt.TransStartDatetime
	,ppt.TransEndDateTime
	,ppt.PolicyTransNum
	,lob.LineofBusinessSK				-- or lob.PolicyLineofBusinessSK?
	,pps.PolicySubLineSK AS SublineSK	-- or pps.SublineSK?
	,pol.AnnualStatementLineofBusinessSK
	,ppt.OriginalCurrencySK
	,ppt.BaseCurrencySK
	,ppt.ReportingCurrencySK
	,null as EstimatedWrittenPremiumBaseAmt
	,null as EstimatedWrittenPremiumOriginalAmt
	,null as EstimatedWrittenPremiumReportingAmt
	,ISNULL(lob.AddlRetPremBaseAmt,0) AS AddlRetPremiumBaseAmt
	,ISNULL(lob.AddlRetPremOriginalAmt,0) AS AddlRetPremiumOriginalAmt
	,ISNULL(lob.AddlRetPremReportingAmt,0) AS AddlRetPremiumReportingAmt
	,ISNULL(ppd.PolicyDiscountBaseAmt,0) AS PolicyDiscountBaseAmt
	,ISNULL(ppd.PolicyDiscountOriginalAmt,0) AS PolicyDiscountOriginalAmt
	,ISNULL(ppd.PolicyDiscountReportingAmt,0) AS PolicyDiscountReportingAmt
	,ISNULL(lob.TermPremiumBaseAmt,0) as DirectWrittenPremiumBaseAmt
	,ISNULL(lob.TermPremiumOriginalAmt,0) as DirectWrittenPremiumOriginalAmt
	,ISNULL(lob.TermPremiumReportingAmt,0) as DirectWrittenPremiumReportingAmt
	,cdt.DirectTaxBaseAmt
	,cdt.DirectTaxOriginalAmt
	,cdt.DirectTaxReportingAmt
	,cds.DirectSurchargeBaseAmt
	,cds.DirectSurchargeOriginalAmt
	,cds.DirectSurchargeReportingAmt
	,cdf.DirectFeeBaseAmt
	,cdf.DirectFeeOriginalAmt
	,cdf.DirectFeeReportingAmt
	,0 as AssumedWrittenPremiumBaseAmt
	,0 as AssumedWrittenPremiumOriginalAmt
	,0 as AssumedWrittenPremiumReportingAmt
	,0 as AssumedTaxBaseAmt
	,0 as AssumedTaxOriginalAmt
	,0 as AssumedTaxReportingAmt
	,0 as AssumedSurchargeBaseAmt
	,0 as AssumedSurchargeOriginalAmt
	,0 as AssumedSurchargeReportingAmt
	,0 as AssumedFeeBaseAmt
	,0 as AssumedFeeOriginalAmt
	,0 as AssumedFeeReportingAmt
	,ISNULL(lob.CommissionBaseAmt,0) AS CommissionBaseAmt
	,ISNULL(lob.CommissionOriginalAmt,0) AS CommissionOriginalAmt
	,ISNULL(lob.CommissionReportingAmt,0) AS CommissionReportingAmt
	,lob.CommissionPct
	,0 as IsPremiumWaivedInd

FROM Policy.PolicyLineofBusiness lob
JOIN Typelist.SourceSystem tss ON tss.SourceSystemSK = lob.SourceSystemSK
JOIN Policy.PolicyTrans ppt ON lob.PolicyTransSK = ppt.PolicyTransSK
JOIN Finance.SrcPolicyPremiumHeader pph ON lob.PolicyTransSK = pph.PolicyTransSK		
LEFT JOIN Finance.PolicyPremiumTransactionDetail ptd ON lob.PolicyTransSK = ptd.PolicyTransTypeSK										-- added LEFT temp
LEFT JOIN Typelist.FinancialSourceTransactionType ttt ON ttt.FinancialSourceTransactionTypeSK = pph.FinancialSourceTransactionTypeSK	-- added LEFT temp
LEFT JOIN Policy.PolicySubline pps ON pps.PolicyLineofBusinessSK = lob.PolicyLineofBusinessSK
LEFT JOIN Policy.PolicyDiscount ppd ON ppd.PolicyLineofBusinessSK = lob.PolicyLineofBusinessSK
JOIN Policy.Policy pol ON pol.PolicySK = ppt.PolicySK
LEFT JOIN cte_DirectTax cdt			ON cdt.PolicyTransSK = lob.PolicyTransSK
LEFT JOIN cte_DirectSurcharge cds	ON cds.PolicyTransSK = lob.PolicyTransSK
LEFT JOIN cte_DirectFee cdf			ON cdf.PolicyTransSK = lob.PolicyTransSK

WHERE ttt.FinancialSourceTransactionTypeCode = 'Non-Verified'
GO
