USE [sqldb-ods-dev]
GO
/****** Object:  View [Finance].[SrcPolicyPremiumHeader]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [Finance].[SrcPolicyPremiumHeader]
as
SELECT ptr.PolicyTransSK as PolicyPremiumHeaderSK
      ,getdate() as ETLCreateDateTime
      ,getdate()  as ETLUpdateDateTime
      ,ptr.ETLCreateProcessNum
      ,ptr.ETLUpdateProcessNum
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
LEFT JOIN Typelist.FinancialReportingPeriod frp on cast( ptr.TransStartDatetime as Date) = frp.FinancialReportingPeriodDate
--LEFT JOIN Typelist.FinancialReportingPeriod frp on ptr.TransStartDatetime between InancialReportingPeriodBeginDate and InancialReportingPeriodEndDate
LEFT JOIN Typelist.FinancialSourceTransactionType ftt on ftt.FinancialSourceTransactionTypeCode = 'Non-Verified'
GO
