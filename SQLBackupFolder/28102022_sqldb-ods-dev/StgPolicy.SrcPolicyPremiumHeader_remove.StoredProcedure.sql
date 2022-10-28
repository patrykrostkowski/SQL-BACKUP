USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgPolicy].[SrcPolicyPremiumHeader_remove]    Script Date: 28.10.2022 13:37:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [StgPolicy].[SrcPolicyPremiumHeader_remove] --@batchId int
as
SELECT --NULL as PolicyPremiumHeaderSK
      getdate() as ETLCreateDateTime
      ,getdate()  as ETLUpdateDateTime
      --,@batchId as ETLCreateProcessNum
      --,@batchId as ETLUpdateProcessNum
      ,pol.SourceSystemSK
      ,ptr.SourceCode
      ,ptr.ProcessDateTime
      ,ftt.FinancialSourceTransactionTypeSK
      ,ptr.TransStartDatetime as EntryDate
      ,NULL as SettlementDate
      ,NULL as LastAllocationDate
      ,pol.PolicySK
      ,pol.EffectiveDate as PolicyEffectiveDate
      ,pol.ExpirationDate as PolicyExpirationDate
      ,pol.WritingCompanySK
      ,pol.AgencySK
      ,pol.ProductSK
      ,pol.ProgramSK
      ,frp.FinancialReportingPeriodSK
      ,ptr.PolicyTransSK
FROM Policy.Policy pol
JOIN Policy.PolicyTrans ptr on pol.PolicySK = ptr.PolicySK
LEFT JOIN Typelist.FinancialReportingPeriod frp on ptr.TransStartDatetime between FinancialReportingPeriodBeginDate and FinancialReportingPeriodEndDate
LEFT JOIN Typelist.FinancialSourceTransactionType ftt on ftt.FinancialSourceTransactionTypeCode = 'Non-Verified'
GO
