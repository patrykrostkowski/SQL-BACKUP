USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgPolicy].[SrcPolicyPremiumCoverageDetail_remove]    Script Date: 28.10.2022 12:27:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [StgPolicy].[SrcPolicyPremiumCoverageDetail_remove]  --@batchId int
as 

SELECT --NULL as PolicyPremiumCoverageDetailSK
      getdate() as ETLCreateDateTime
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
      ,pol.WritingCompanySK
      ,hdr.PolicyPremiumHeaderSK
      ,ptr.PolicyTransTypeSK
      ,ptr.TransStartDateTime
      ,ptr.TransEndDateTime
      ,ptr.PolicyTransNum
      ,cov.PolicyLineofBusinessSK as LineofBusinessSK
      ,cov.PolicySubLineSK as SublineSK
      ,cov.PolicyGeographySK as RiskStateSK
      ,cov.PolicyInsurableObjectSK as InsurableObjectTypeSK
      ,cov.CoverageSK as CoverageSK
      ,sco.PolicySubCoverageSK as SubCoverageSK
      ,NULL as PolicyPremiumTransactionDetailSK
      ,lob.ProfitCenterSK
      ,NULL as PolicyPremiumlLineofBusinessDetailSK
      ,NULL as PolicyPremiumGeographyDetailSK
      ,cov.AnnualStatementLineofBusinessSK as AnnualStatementLineofBusinessSK
      ,cov.BaseCurrencySK
      ,cov.OriginalCurrencySK
      ,cov.ReportingCurrencySK
      ,0 as EstimatedWrittenPremiumBaseAmt
      ,0 as EstimatedWrittenPremiumOriginalAmt
      ,0 as EstimatedWrittenPremiumReportingAmt
      ,0 as AddlRetPremiumBaseAmt --update using post update sql?
      ,0 as AddlRetPremiumOriginalAmt --update using post update sql?
      ,0 as AddlRetPremiumReportingAmt --update using post update sql?
      ,0 as PolicyDiscountBaseAmt
      ,0 as PolicyDiscountOriginalAmt
      ,0 as PolicyDiscountReportingAmt
      ,cov.WrittenPremiumBaseAmt as DirectWrittenPremiumBaseAmt --add case for direct?
      ,cov.WrittenPremiumOriginalAmt as DirectWrittenPremiumOriginalAmt --add case for direct?
      ,cov.WrittenPremiumReportingAmt as DirectWrittenPremiumReportingAmt --add case for direct?
      ,0 as DirectTaxBaseAmt
      ,0 as DirectTaxOriginalAmt
      ,0 as DirectTaxReportingAmt
      ,0 as DirectSurchargeBaseAmt
      ,0 as DirectSurchargeOriginalAmt
      ,0 as DirectSurchargeReportingAmt
      ,0 as DirectFeeBaseAmt
      ,0 as DirectFeeOriginalAmt
      ,0 as DirectFeeReportingAmt
      ,0 as AssumedWrittenPremiumBaseAmt --add case for assumed?
      ,0 as AssumedWrittenPremiumOriginalAmt --add case for assumed?
      ,0 as AssumedWrittenPremiumReportingAmt --add case for assumed?
      ,0 as AssumedTaxBaseAmt
      ,0 as AssumedTaxOriginalAmt
      ,0 as AssumedTaxReportingAmt
      ,0 as AssumedSurchargeBaseAmt
      ,0 as AssumedSurchargeOriginalAmt
      ,0 as AssumedSurchargeReportingAmt
      ,0 as AssumedFeeBaseAmt
      ,0 as AssumedFeeOriginalAmt
      ,0 as AssumedFeeReportingAmt
      ,lob.CommissionBaseAmt as CommissionBaseAmt
      ,lob.CommissionOriginalAmt as CommissionOriginalAmt
      ,lob.CommissionReportingAmt as CommissionReportingAmt
      ,cast(0 as decimal(6, 4)) as CommissionPct
      ,0 as IsPremiumWaivedInd
 FROM Policy.Policy pol
JOIN Policy.PolicyTrans ptr on ptr.PolicySK = pol.PolicySK
JOIN Policy.PolicyCoverage cov on cov.PolicyTransSK = ptr.PolicyTransSK
JOIN Policy.PolicyLineofBusiness lob on lob.PolicyLineofBusinessSK = cov.PolicyLineofBusinessSK and lob.PolicyTransSK = ptr.PolicyTransSK
LEFT JOIN Policy.PolicySubCoverage sco on sco.PolicyCoverageSK = cov.PolicyCoverageSK
JOIN Finance.PolicyPremiumHeader hdr on hdr.PolicyTransSK = ptr.PolicyTransSK
LEFT JOIN Typelist.FinancialReportingPeriod frp on ptr.TransStartDatetime between FinancialReportingPeriodBeginDate and FinancialReportingPeriodEndDate
LEFT JOIN Typelist.FinancialSourceTransactionType ftt on ftt.FinancialSourceTransactionTypeCode = 'Non-Verified'
GO
