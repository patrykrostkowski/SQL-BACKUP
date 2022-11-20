USE [Test]
GO
/****** Object:  View [dbo].[v_test_policydata]    Script Date: 20.11.2022 14:54:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[v_test_policydata]
as
select 
hdr.SourceSystemCode
,convert(datetime, hdr.ProcessedDateTime, 127) as ProcessedDateTime
,pol.PolicySourceCode as SourceCode
,pol.EffectiveJobNum
,pol.PremiumWaivedInd
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
,pol.RunoffERPDate
,pol.IsPremiumAuditableInd
,pol.DaysNoticeOfCancellationNum
,pol.PolicyNum
,pol.LegacyPolicyNum
,pol.TermNum
,pol.QuoteNum
,pol.QuoteVersionNum
,pol.EffectiveDate
,pol.OriginalEffectiveDate
,pol.ExpirationDate
,pol.TailDate
,pol.UnderwritingYear
,convert(datetime,pol.IssuanceDateTime,127) as IssuanceDateTime
,pol.CancellationDate
,pol.CancellationTypeCode
,pol.CancellationTypeDesc
,pol.CancellationRateCode
,pol.CancellationRateDesc
,ins.InsuredSourceCode
,agn.AgencySourceCode
,acc.AccountSourceCode
,wrc.WritingCompanyCode
FROM
    PolicyData line
       CROSS APPLY OPENJSON(line.JsonLine)
       WITH (SourceSystemCode nvarchar(max),ProcessedDateTime nvarchar(max), Policy nvarchar(max) AS JSON) hdr
       CROSS APPLY OPENJSON(hdr.Policy)
       WITH ( PolicySourceCode nvarchar(max),
EffectiveJobNum nvarchar(max),
TransactionCost nvarchar(max) AS JSON,
PremiumWaivedInd int,
PolicyTypeCode nvarchar(max),
PolicyTypeDesc nvarchar(max),
LeadExcessQuotaCode nvarchar(max),
LeadExcessQuotaDesc nvarchar(max),
IsMGAInd int,
FrontingCompanyName nvarchar(max),
BusinessUnitCode nvarchar(max),
BusinessUnitDesc nvarchar(max),
BusinessTypeCode nvarchar(max),
BusinessTypeDesc nvarchar(max),
UnderwritingStatusCode nvarchar(max),
UnderwritingStatusDesc nvarchar(max),
AttachmentTypeCode nvarchar(max),
AttachmentTypeDesc nvarchar(max),
ProjectTypeCode nvarchar(max),
ProjectTypeDesc nvarchar(max),
PolicyStatusCode nvarchar(max),
PolicyStatusDesc nvarchar(max),
DomicileStateCode nvarchar(max),
DomicileStateDesc nvarchar(max),
DomicileCountryCode nvarchar(max),
DomicileCountryDesc nvarchar(max),
StandardIndustryCode nvarchar(max),
StandardIndustryCodeDesc nvarchar(max),
NorthAmericanIndustryClassificationCode nvarchar(max),
NorthAmericanIndustryClassificationDesc nvarchar(max),
ProfessionCode nvarchar(max),
ProfessionDesc nvarchar(max),
DepartmentCode nvarchar(max),
DepartmentDesc nvarchar(max),
CoverageTriggerCode nvarchar(max),
CoverageTriggerDesc nvarchar(max),
AuditTransactionCode nvarchar(max),
AuditTransactionDesc nvarchar(max),
PayPlanCode nvarchar(max),
PayPlanDesc nvarchar(max),
BillTypeCode nvarchar(max),
BillTypeDesc nvarchar(max),
UniqueMarketReferenceNum nvarchar(max),
SharePct decimal(20, 6),
IsNewYorkFreeTradeZoneInd int,
NewYorkFreeTradeZoneDesc nvarchar(max),
IsFacultativeReinsurancePurchasedInd int,
IsMultiStateInd int,
ProjectName nvarchar(max),
IsRunoffERPInd int,
RunoffERPDate nvarchar(max),
IsPremiumAuditableInd int,
DaysNoticeOfCancellationNum int,
PolicyNum nvarchar(max),
LegacyPolicyNum nvarchar(max),
TermNum int,
QuoteNum nvarchar(max),
QuoteVersionNum int,
EffectiveDate nvarchar(max),
OriginalEffectiveDate nvarchar(max),
ExpirationDate nvarchar(max),
TailDate nvarchar(max),
UnderwritingYear nvarchar(max),
IssuanceDateTime nvarchar(max),
CancellationDate nvarchar(max),
CancellationTypeCode nvarchar(max),
CancellationTypeDesc nvarchar(max),
CancellationRateCode nvarchar(max),
CancellationRateDesc nvarchar(max),
WritingCompany nvarchar(max) AS JSON,
Program nvarchar(max) AS JSON,
Product nvarchar(max) AS JSON,
PolicyTrans nvarchar(max) AS JSON,
Account nvarchar(max) AS JSON,
Insured nvarchar(max) AS JSON,
Agency nvarchar(max) AS JSON,
Agent nvarchar(max) AS JSON,
Driver nvarchar(max) AS JSON,
MiscParty nvarchar(max) AS JSON
) pol
CROSS APPLY OPENJSON(pol.Insured)
WITH(InsuredSourceCode nvarchar(max)) ins
CROSS APPLY OPENJSON(pol.Agency)
WITH(AgencySourceCode nvarchar(max)) agn
CROSS APPLY OPENJSON(pol.Account)
WITH(AccountSourceCode nvarchar(max)) acc
CROSS APPLY OPENJSON(pol.WritingCompany)
WITH(WritingCompanyCode nvarchar(max)) wrc
  WHERE 1=1
       
GO
