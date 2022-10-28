USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcPolicy_20221026]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE    VIEW [StgPolicy].[SrcPolicy_20221026]
AS
SELECT * FROM (
SELECT ROW_NUMBER() OVER (partition by hdr.SourceSystemCode, pol.PolicySourceCode ORDER BY convert(DATETIME, hdr.ProcessDateTime, 127) desc) as rn
	,hdr.SourceSystemCode
	,convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
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
	,convert(DATETIME, pol.RunoffERPDate, 127) AS RunoffERPDate
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
	,convert(DATETIME, pol.EffectiveDate, 127) AS EffectiveDate
	,convert(DATETIME, pol.OriginalEffectiveDate, 127) AS OriginalEffectiveDate
	,convert(DATETIME, pol.ExpirationDate, 127) AS ExpirationDate
	,convert(DATETIME, pol.TailDate, 127) AS TailDate
	,pol.UnderwritingYear
	,convert(DATETIME, pol.IssuanceDateTime, 127) AS IssuanceDateTime
	,convert(DATETIME, pol.CancellationDate, 127) AS CancellationDate
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
	,line.IsValidInd
FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Policy NVARCHAR(max) AS JSON
		) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (
		PolicySourceCode NVARCHAR(max)
		,EffectiveJobNum NVARCHAR(max)
		,TransactionCost NVARCHAR(max) AS JSON
		,IsPremiumWaivedInd INT
		,PolicyTypeCode NVARCHAR(max)
		,PolicyTypeDesc NVARCHAR(max)
		,LeadExcessQuotaCode NVARCHAR(max)
		,LeadExcessQuotaDesc NVARCHAR(max)
		,IsMGAInd INT
		,FrontingCompanyName NVARCHAR(max)
		,BusinessUnitCode NVARCHAR(max)
		,BusinessUnitDesc NVARCHAR(max)
		,BusinessTypeCode NVARCHAR(max)
		,BusinessTypeDesc NVARCHAR(max)
		,UnderwritingStatusCode NVARCHAR(max)
		,UnderwritingStatusDesc NVARCHAR(max)
		,AttachmentTypeCode NVARCHAR(max)
		,AttachmentTypeDesc NVARCHAR(max)
		,ProjectTypeCode NVARCHAR(max)
		,ProjectTypeDesc NVARCHAR(max)
		,PolicyStatusCode NVARCHAR(max)
		,PolicyStatusDesc NVARCHAR(max)
		,GoverningStateCode NVARCHAR(max)
		,GoverningStateDesc NVARCHAR(max)
		,DomicileStateCode NVARCHAR(max)
		,DomicileStateDesc NVARCHAR(max)
		,DomicileCountryCode NVARCHAR(max)
		,DomicileCountryDesc NVARCHAR(max)
		,StandardIndustryCode NVARCHAR(max)
		,StandardIndustryCodeDesc NVARCHAR(max)
		,NorthAmericanIndustryClassificationCode NVARCHAR(max)
		,NorthAmericanIndustryClassificationDesc NVARCHAR(max)
		,ProfessionCode NVARCHAR(max)
		,ProfessionDesc NVARCHAR(max)
		,DepartmentCode NVARCHAR(max)
		,DepartmentDesc NVARCHAR(max)
		,CoverageTriggerCode NVARCHAR(max)
		,CoverageTriggerDesc NVARCHAR(max)
		,AuditTransactionCode NVARCHAR(max)
		,AuditTransactionDesc NVARCHAR(max)
		,PayPlanCode NVARCHAR(max)
		,PayPlanDesc NVARCHAR(max)
		,BillTypeCode NVARCHAR(max)
		,BillTypeDesc NVARCHAR(max)
		,UniqueMarketReferenceNum NVARCHAR(max)
		,SharePct DECIMAL(20, 6)
		,IsNewYorkFreeTradeZoneInd INT
		,NewYorkFreeTradeZoneDesc NVARCHAR(max)
		,IsFacultativeReinsurancePurchasedInd INT
		,IsMultiStateInd INT
		,ProjectName NVARCHAR(max)
		,IsRunoffERPInd INT
		,RunoffERPDate NVARCHAR(max)
		,IsPremiumAuditableInd INT
		,DaysNoticeOfCancellationNum INT
		,PolicyNum NVARCHAR(max)
		,LegacyPolicyNum NVARCHAR(max)
		,TermNum NVARCHAR(max)
		,QuoteNum NVARCHAR(max)
		,QuoteVersionNum INT
		,EffectiveDate NVARCHAR(max)
		,OriginalEffectiveDate NVARCHAR(max)
		,ExpirationDate NVARCHAR(max)
		,TailDate NVARCHAR(max)
		,UnderwritingYear NVARCHAR(max)
		,IssuanceDateTime NVARCHAR(max)
		,CancellationDate NVARCHAR(max)
		,CancellationTypeCode NVARCHAR(max)
		,CancellationTypeDesc NVARCHAR(max)
		,CancellationRateCode NVARCHAR(max)
		,CancellationRateDesc NVARCHAR(max)
		,DirectAssumedCode NVARCHAR(max)
		,BaseCurrencyCode NVARCHAR(max)
		,OriginalCurrencyCode NVARCHAR(max)
		,ReportingCurrencyCode NVARCHAR(max)
		,AuditFrequencyCode NVARCHAR(max)
		,AuditFrequencyDesc NVARCHAR(max)
		,GovernClassCode NVARCHAR(max)
		,GovernClassCodeDescription NVARCHAR(max)
		,ProducingBranchNum NVARCHAR(max)
		,PlanGroupCode NVARCHAR(max)
		,AnnualStatementLineofBusinessCode NVARCHAR(max)
		,WritingCompany NVARCHAR(max) AS JSON
		,Program NVARCHAR(max) AS JSON
		,Product NVARCHAR(max) AS JSON
		,Account NVARCHAR(max) AS JSON
		,Insured NVARCHAR(max) AS JSON
		,Agency NVARCHAR(max) AS JSON
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
OUTER APPLY OPENJSON(pol.Insured) WITH (InsuredSourceCode NVARCHAR(max)) ins
OUTER APPLY OPENJSON(pol.Agency) WITH (AgencySourceCode NVARCHAR(max)) agn
OUTER APPLY OPENJSON(pol.Account) WITH (AccountSourceCode NVARCHAR(max)) acc
OUTER APPLY OPENJSON(pol.WritingCompany) WITH (WritingCompanySourceCode NVARCHAR(max)) twc
OUTER APPLY OPENJSON(pol.Program) WITH (ProgramSourceCode NVARCHAR(max), ProgramCode NVARCHAR(max)) ppr
OUTER APPLY OPENJSON(pol.Product) WITH (ProductCode NVARCHAR(max)) tpd
) a
WHERE rn = 1


GO
