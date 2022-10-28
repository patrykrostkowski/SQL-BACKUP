USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[InputSrcPolicy]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [StgPolicy].[InputSrcPolicy]
AS
SELECT * FROM (
SELECT ROW_NUMBER() OVER (partition by hdr.SourceSystemCode, pol.PolicySourceCode ORDER BY convert(DATETIME, hdr.ProcessDateTime, 127) desc) as rn
	,hdr.SourceSystemCode
	,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,pol.PolicySourceCode AS SourceCode
	,pol.EffectiveJobNum
	,pol.AnnualStatementLineofBusinessCode
	,pol.IsPremiumWaivedInd
	,pol.PolicyTypeCode
	,pol.PolicyTypeDesc
	,pol.LeadExcessQuotaCode
	,pol.LeadExcessQuotaDesc
	,pol.IsMGAInd
	,pol.FrontingCompanyName
	,pol.BusinessUnitCode
	,pol.BusinessUnitDesc
	,pol.BusinessTypeCode
	,pol.BusinessTypeDesc
	,pol.UnderwritingStatusCode
	,pol.UnderwritingStatusDesc
	,pol.AttachmentTypeCode
	,pol.AttachmentTypeDesc
	,pol.ProjectTypeCode
	,pol.ProjectTypeDesc
	,pol.PolicyStatusCode
	,pol.PolicyStatusDesc
	,pol.GoverningStateCode
	,pol.GoverningStateDesc
	,pol.DomicileStateCode
	,pol.DomicileStateDesc
	,pol.DomicileCountryCode
	,pol.DomicileCountryDesc
	,pol.StandardIndustryCode
	,pol.StandardIndustryCodeDesc
	,pol.NorthAmericanIndustryClassificationCode
	,pol.NorthAmericanIndustryClassificationDesc
	,pol.ProfessionCode
	,pol.ProfessionDesc
	,pol.DepartmentCode
	,pol.DepartmentDesc
	,pol.CoverageTriggerCode
	,pol.CoverageTriggerDesc
	,pol.AuditTransactionCode
	,pol.AuditTransactionDesc
	,pol.PayPlanCode
	,pol.PayPlanDesc
	,pol.BillTypeCode
	,pol.BillTypeDesc
	,pol.UniqueMarketReferenceNum
	,pol.SharePct
	,pol.IsNewYorkFreeTradeZoneInd
	,pol.NewYorkFreeTradeZoneDesc
	,pol.IsFacultativeReinsurancePurchasedInd
	,pol.IsMultiStateInd
	,pol.ProjectName
	,pol.IsRunoffERPInd
	,try_convert(DATETIME, pol.RunoffERPDate, 127) AS RunoffERPDate
	,pol.IsPremiumAuditableInd
	,pol.DaysNoticeOfCancellationNum
	,pol.PolicyNum
	,pol.LegacyPolicyNum
	,pol.TermNum AS TermNum
	,pol.QuoteNum
	,pol.QuoteVersionNum
	,pol.AuditFrequencyCode
	,pol.AuditFrequencyDesc
	,pol.GovernClassCode
	,pol.GovernClassCodeDescription
	,pol.ProducingBranchNum
	,pol.PlanGroupCode
	,try_convert(DATETIME, pol.EffectiveDate, 127) AS EffectiveDate
	,try_convert(DATETIME, pol.OriginalEffectiveDate, 127) AS OriginalEffectiveDate
	,try_convert(DATETIME, pol.ExpirationDate, 127) AS ExpirationDate
	,try_convert(DATETIME, pol.TailDate, 127) AS TailDate
	,pol.UnderwritingYear
	,try_convert(DATETIME, pol.IssuanceDateTime, 127) AS IssuanceDateTime
	,try_convert(DATETIME, pol.CancellationDate, 127) AS CancellationDate
	,pol.CancellationTypeCode
	,pol.CancellationTypeDesc
	,pol.CancellationRateCode
	,pol.CancellationRateDesc
	,pol.DirectAssumedCode
	,ins.InsuredSourceCode
	,agn.AgencySourceCode
	,acc.AccountSourceCode
	,twc.WritingCompanySourceCode
	,pol.BaseCurrencyCode
	,pol.OriginalCurrencyCode
	,pol.ReportingCurrencyCode
	,ptc.WrittenPremiumBaseAmt
	,ptc.WrittenPremiumOriginalAmt
	,ptc.WrittenPremiumReportingAmt
	,ptc.AnnualPremiumBaseAmt
	,ptc.AnnualPremiumOriginalAmt
	,ptc.AnnualPremiumReportingAmt
	,ptc.TermPremiumBaseAmt
	,ptc.TermPremiumOriginalAmt
	,ptc.TermPremiumReportingAmt
	,ptc.ManualPremBaseAmt
	,ptc.ManualPremOriginalAmt
	,ptc.ManualPremReportingAmt
	,ptc.CommissionPct
	,ptc.CommissionBaseAmt
	,ptc.CommissionOriginalAmt
	,ptc.CommissionReportingAmt
	,ppr.ProgramSourceCode
	,tpd.ProductCode
	,pol.IsRetroPolicyInd
	,line.FileName
	,line.FilePath
	,line.IsValidInd
FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(255)
		,ProcessDateTime NVARCHAR(255)
		,Policy NVARCHAR(MAX) AS JSON
		) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (
		PolicySourceCode NVARCHAR(255)
		,EffectiveJobNum NVARCHAR(255)
		,TransactionCost NVARCHAR(MAX) AS JSON
		,IsPremiumWaivedInd INT
		,PolicyTypeCode NVARCHAR(255)
		,PolicyTypeDesc NVARCHAR(255)
		,LeadExcessQuotaCode NVARCHAR(255)
		,LeadExcessQuotaDesc NVARCHAR(255)
		,IsMGAInd INT
		,FrontingCompanyName NVARCHAR(255)
		,BusinessUnitCode NVARCHAR(255)
		,BusinessUnitDesc NVARCHAR(255)
		,BusinessTypeCode NVARCHAR(255)
		,BusinessTypeDesc NVARCHAR(255)
		,UnderwritingStatusCode NVARCHAR(255)
		,UnderwritingStatusDesc NVARCHAR(255)
		,AttachmentTypeCode NVARCHAR(255)
		,AttachmentTypeDesc NVARCHAR(255)
		,ProjectTypeCode NVARCHAR(255)
		,ProjectTypeDesc NVARCHAR(255)
		,PolicyStatusCode NVARCHAR(255)
		,PolicyStatusDesc NVARCHAR(255)
		,GoverningStateCode NVARCHAR(255)
		,GoverningStateDesc NVARCHAR(255)
		,DomicileStateCode NVARCHAR(255)
		,DomicileStateDesc NVARCHAR(255)
		,DomicileCountryCode NVARCHAR(255)
		,DomicileCountryDesc NVARCHAR(255)
		,StandardIndustryCode NVARCHAR(255)
		,StandardIndustryCodeDesc NVARCHAR(255)
		,NorthAmericanIndustryClassificationCode NVARCHAR(255)
		,NorthAmericanIndustryClassificationDesc NVARCHAR(255)
		,ProfessionCode NVARCHAR(255)
		,ProfessionDesc NVARCHAR(255)
		,DepartmentCode NVARCHAR(255)
		,DepartmentDesc NVARCHAR(255)
		,CoverageTriggerCode NVARCHAR(255)
		,CoverageTriggerDesc NVARCHAR(255)
		,AuditTransactionCode NVARCHAR(255)
		,AuditTransactionDesc NVARCHAR(255)
		,PayPlanCode NVARCHAR(255)
		,PayPlanDesc NVARCHAR(255)
		,BillTypeCode NVARCHAR(255)
		,BillTypeDesc NVARCHAR(255)
		,UniqueMarketReferenceNum NVARCHAR(255)
		,SharePct DECIMAL(20, 6)
		,IsNewYorkFreeTradeZoneInd INT
		,NewYorkFreeTradeZoneDesc NVARCHAR(255)
		,IsFacultativeReinsurancePurchasedInd INT
		,IsMultiStateInd INT
		,ProjectName NVARCHAR(255)
		,IsRunoffERPInd INT
		,RunoffERPDate NVARCHAR(255)
		,IsPremiumAuditableInd INT
		,DaysNoticeOfCancellationNum INT
		,PolicyNum NVARCHAR(255)
		,LegacyPolicyNum NVARCHAR(255)
		,TermNum NVARCHAR(255)
		,QuoteNum NVARCHAR(255)
		,QuoteVersionNum INT
		,EffectiveDate NVARCHAR(255)
		,OriginalEffectiveDate NVARCHAR(255)
		,ExpirationDate NVARCHAR(255)
		,TailDate NVARCHAR(255)
		,UnderwritingYear NVARCHAR(255)
		,IssuanceDateTime NVARCHAR(255)
		,CancellationDate NVARCHAR(255)
		,CancellationTypeCode NVARCHAR(255)
		,CancellationTypeDesc NVARCHAR(255)
		,CancellationRateCode NVARCHAR(255)
		,CancellationRateDesc NVARCHAR(255)
		,DirectAssumedCode NVARCHAR(255)
		,BaseCurrencyCode NVARCHAR(255)
		,OriginalCurrencyCode NVARCHAR(255)
		,ReportingCurrencyCode NVARCHAR(255)
		,AuditFrequencyCode NVARCHAR(255)
		,AuditFrequencyDesc NVARCHAR(255)
		,GovernClassCode NVARCHAR(255)
		,GovernClassCodeDescription NVARCHAR(255)
		,ProducingBranchNum NVARCHAR(255)
		,PlanGroupCode NVARCHAR(255)
		,AnnualStatementLineofBusinessCode NVARCHAR(255)
		,WritingCompany NVARCHAR(MAX) AS JSON
		,Program NVARCHAR(MAX) AS JSON
		,Product NVARCHAR(MAX) AS JSON
		,Account NVARCHAR(MAX) AS JSON
		,Insured NVARCHAR(MAX) AS JSON
		,Agency NVARCHAR(MAX) AS JSON
		,IsRetroPolicyInd INT
		) pol
OUTER APPLY OPENJSON(pol.TransactionCost) WITH (
		WrittenPremiumBaseAmt	decimal(20, 6)
		,WrittenPremiumOriginalAmt	decimal(20, 6)
		,WrittenPremiumReportingAmt	decimal(20, 6)
		,AnnualPremiumBaseAmt	decimal(20, 6)
		,AnnualPremiumOriginalAmt	decimal(20, 6)
		,AnnualPremiumReportingAmt	decimal(20, 6)
		,TermPremiumBaseAmt	decimal(20, 6)
		,TermPremiumOriginalAmt	decimal(20, 6)
		,TermPremiumReportingAmt	decimal(20, 6)
		,ManualPremBaseAmt	decimal(20, 6)
		,ManualPremOriginalAmt	decimal(20, 6)
		,ManualPremReportingAmt	decimal(20, 6)
		,CommissionPct	decimal(20, 6)
		,CommissionBaseAmt	decimal(20, 6)
		,CommissionOriginalAmt	decimal(20, 6)
		,CommissionReportingAmt	decimal(20, 6)
		) ptc
OUTER APPLY OPENJSON(pol.Insured) WITH (InsuredSourceCode NVARCHAR(255)) ins
OUTER APPLY OPENJSON(pol.Agency) WITH (AgencySourceCode NVARCHAR(255)) agn
OUTER APPLY OPENJSON(pol.Account) WITH (AccountSourceCode NVARCHAR(255)) acc
OUTER APPLY OPENJSON(pol.WritingCompany) WITH (WritingCompanySourceCode NVARCHAR(255)) twc
OUTER APPLY OPENJSON(pol.Program) WITH (ProgramSourceCode NVARCHAR(255), ProgramCode NVARCHAR(255)) ppr
OUTER APPLY OPENJSON(pol.Product) WITH (ProductCode NVARCHAR(255)) tpd
) a
WHERE rn = 1


GO
