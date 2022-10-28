USE [sqldb-ods-dev]
GO
/****** Object:  View [Finance].[SrcPolicyPremiumCoverageDetail]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE   view [Finance].[SrcPolicyPremiumCoverageDetail]
as 

SELECT cov.PolicyCoverageSK as PolicyPremiumCoverageDetailSK
      ,getdate() as ETLCreateDateTime
      ,getdate()  as ETLUpdateDateTime
      ,ptr.ETLCreateProcessNum
      ,ptr.ETLUpdateProcessNum
      ,pol.SourceSystemSK
      ,cov.SourceCode
      ,cov.ProcessDateTime
      ,ftt.FinancialSourceTransactionTypeSK
      ,cov.EffectiveDate as TransactionDate
      ,NULL as EntryDate
      ,NULL as SettlementDate
      ,NULL as LastAllocationDate
      ,isnull(ptr.WritingCompanySK, pol.WritingCompanySK) as WritingCompanySK
      ,ptr.PolicyTransSK as PolicyPremiumHeaderSK
      ,ptr.PolicyTransTypeSK
      ,ptr.TransStartDateTime
      ,ptr.TransEndDateTime
      ,ptr.PolicyTransNum
      ,lob.LineofBusinessSK--,cov.PolicyLineofBusinessSK as LineofBusinessSK
      ,sub.SublineSK --,cov.PolicySubLineSK as SublineSK
	  /*WARNING!!! temporary datafix for RiskStateSK*/
      ,isnull(geo.StateSK, (select max(g.StateSK) as RiskStateSK from Policy.PolicyGeography g where lob.PolicyLineofBusinessSK = g.PolicyLineofBusinessSK)) as RiskStateSK--,cov.PolicyGeographySK as RiskStateSK
      ,cov.PolicyInsurableObjectSK as InsurableObjectTypeSK
      ,cov.CoverageSK as CoverageSK
      ,sco.SubCoverageSK--,sco.PolicySubCoverageSK as SubCoverageSK
      ,ptr.PolicyTransSK as PolicyPremiumTransactionDetailSK
      ,lob.ProfitCenterSK
      ,NULL as PolicyPremiumlLineofBusinessDetailSK
      ,NULL as PolicyPremiumGeographyDetailSK
      ,isnull(cov.AnnualStatementLineofBusinessSK, pol.AnnualStatementLineofBusinessSK) as AnnualStatementLineofBusinessSK
      ,cov.BaseCurrencySK
      ,cov.OriginalCurrencySK
      ,cov.ReportingCurrencySK
      ,cov.WrittenPremiumBaseAmt as EstimatedWrittenPremiumBaseAmt
      ,cov.WrittenPremiumOriginalAmt as EstimatedWrittenPremiumOriginalAmt
      ,cov.WrittenPremiumReportingAmt as EstimatedWrittenPremiumReportingAmt
      ,cast(0 as decimal(19,4)) as AddlRetPremiumBaseAmt --update using post update sql?
      ,cast(0 as decimal(19,4)) as AddlRetPremiumOriginalAmt --update using post update sql?
      ,cast(0 as decimal(19,4)) as AddlRetPremiumReportingAmt --update using post update sql?
      ,cast(0 as decimal(19,4)) as PolicyDiscountBaseAmt
      ,cast(0 as decimal(19,4)) as PolicyDiscountOriginalAmt
      ,cast(0 as decimal(19,4)) as PolicyDiscountReportingAmt
      ,cov.WrittenPremiumBaseAmt as DirectWrittenPremiumBaseAmt --add case for direct?
      ,cov.WrittenPremiumOriginalAmt as DirectWrittenPremiumOriginalAmt --add case for direct?
      ,cov.WrittenPremiumReportingAmt as DirectWrittenPremiumReportingAmt --add case for direct?
      ,cast(0 as decimal(19,4)) as DirectTaxBaseAmt
      ,cast(0 as decimal(19,4)) as DirectTaxOriginalAmt
      ,cast(0 as decimal(19,4)) as DirectTaxReportingAmt
      ,cast(0 as decimal(19,4)) as DirectSurchargeBaseAmt
      ,cast(0 as decimal(19,4)) as DirectSurchargeOriginalAmt
      ,cast(0 as decimal(19,4)) as DirectSurchargeReportingAmt
      ,cast(0 as decimal(19,4)) as DirectFeeBaseAmt
      ,cast(0 as decimal(19,4)) as DirectFeeOriginalAmt
      ,cast(0 as decimal(19,4)) as DirectFeeReportingAmt
      ,cast(0 as decimal(19,4)) as AssumedWrittenPremiumBaseAmt --add case for assumed?
      ,cast(0 as decimal(19,4)) as AssumedWrittenPremiumOriginalAmt --add case for assumed?
      ,cast(0 as decimal(19,4)) as AssumedWrittenPremiumReportingAmt --add case for assumed?
      ,cast(0 as decimal(19,4)) as AssumedTaxBaseAmt
      ,cast(0 as decimal(19,4)) as AssumedTaxOriginalAmt
      ,cast(0 as decimal(19,4)) as AssumedTaxReportingAmt
      ,cast(0 as decimal(19,4)) as AssumedSurchargeBaseAmt
      ,cast(0 as decimal(19,4)) as AssumedSurchargeOriginalAmt
      ,cast(0 as decimal(19,4)) as AssumedSurchargeReportingAmt
      ,cast(0 as decimal(19,4)) as AssumedFeeBaseAmt
      ,cast(0 as decimal(19,4)) as AssumedFeeOriginalAmt
      ,cast(0 as decimal(19,4)) as AssumedFeeReportingAmt
      ,lob.CommissionBaseAmt as CommissionBaseAmt
      ,lob.CommissionOriginalAmt as CommissionOriginalAmt
      ,lob.CommissionReportingAmt as CommissionReportingAmt
      ,cast(0 as decimal(6, 4)) as CommissionPct
      ,cast(0 as decimal(19,4)) as IsPremiumWaivedInd
FROM Policy.PolicyCoverage cov
JOIN Policy.PolicyTrans ptr on ptr.PolicyTransSK = cov.PolicyTransSK
JOIN Policy.Policy pol on ptr.PolicySK = pol.PolicySK
JOIN Policy.PolicyLineofBusiness lob on lob.PolicyLineofBusinessSK = cov.PolicyLineofBusinessSK
LEFT JOIN Policy.PolicyGeography geo on geo.PolicyGeographySK = cov.PolicyGeographySK
LEFT JOIN Policy.PolicySubLine sub on sub.PolicyLineofBusinessSK = lob.PolicyLineofBusinessSK
LEFT JOIN Policy.PolicySubCoverage sco on sco.PolicyCoverageSK = cov.PolicyCoverageSK
--JOIN Finance.PolicyPremiumHeader hdr on hdr.PolicyTransSK = ptr.PolicyTransSK
--LEFT JOIN Typelist.FinancialReportingPeriod frp on ptr.TransStartDatetime between InancialReportingPeriodBeginDate and InancialReportingPeriodEndDate
LEFT JOIN Typelist.FinancialSourceTransactionType ftt on ftt.FinancialSourceTransactionTypeCode = 'Non-Verified'

GO
