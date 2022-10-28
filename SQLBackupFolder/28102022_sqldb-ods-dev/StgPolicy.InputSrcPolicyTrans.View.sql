USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[InputSrcPolicyTrans]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE   VIEW [StgPolicy].[InputSrcPolicyTrans]
AS
SELECT hdr.SourceSystemCode
	,ptr.PolicyTransSourceCode AS SourceCode
	,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,0 AS IsCurrentInd
	,pol.PolicySourceCode
	,ptr.PolicyNum
	,ptr.TermNum
	,ptr.PolicyTransNum
	,ptr.PolicyTransVersionNum
	,ptr.PolicyTransTypeCode
	,ptr.PolicyTransTypeDesc
	,try_convert(DATETIME, ptr.TransStartDatetime, 127) AS TransStartDatetime
	,try_convert(DATETIME, ptr.TransEndDatetime, 127) AS TransEndDatetime
	,ptr.PolicyTransStatusCode
	,ptr.PolicyTransStatusDesc
	,ptr.UnderwritingStatusCode
	,ptr.UnderwritingStatusDesc
	,try_convert(DATETIME, ptr.RegistrationDate, 127) AS RegistrationDate
	,try_convert(DATETIME, ptr.PolicyIssuanceDate, 127) AS PolicyIssuanceDate
	,try_convert(DATETIME, ptr.PolicyCancellationDate, 127) AS PolicyCancellationDate
	,try_convert(DATETIME, ptr.NextRenewalCheckDate, 127) AS NextRenewalCheckDate
	,try_convert(DATETIME, ptr.RetroActiveDate, 127) AS RetroActiveDate
	,ptr.BusinessUnitCode
	,ptr.BusinessUnitDesc
	,try_convert(DATETIME, ptr.PolicyEffectiveDate, 127) AS PolicyEffectiveDate
	,ptr.LegacyPolicyNum
	,try_convert(DATETIME, ptr.PolicyExpirationDate, 127) AS PolicyExpirationDate
	,ptr.IsTransportationPolicyInd
	,ptr.StandardIndustryCode
	,ptr.StandardIndustryCodeDesc
	,ptr.NorthAmericanIndustryClassificationCode
	,ptr.NorthAmericanIndustryClassificationDesc
	,ptr.IsPremWaivedInd
	,ptr.BaseCurrencyCode
	,ptr.BaseCurrencyDesc
	,ptr.OriginalCurrencyCode
	,ptr.OriginalCurrencyDesc
	,ptr.ReportingCurrencyCode
	,ptr.ReportingCurrencyDesc
	,ptc.EstWrittenPremiumBaseAmt
	,ptc.EstWrittenPremiumOriginalAmt
	,ptc.EstWrittenPremiumReportingAmt
	,ptc.TermPremiumBaseAmt
	,ptc.TermPremiumOriginalAmt
	,ptc.TermPremiumReportingAmt
	,ptc.AddlRetPremiumBaseAmt
	,ptc.AddlRetPremiumOriginalAmt
	,ptc.AddlRetPremiumReportingAmt
	,ptc.OOSOffsetPremiumBaseAmt
	,ptc.OOSOffsetPremiumOriginalAmt
	,ptc.OOSOffsetPremiumReportingAmt
	,ptc.OOSFuturePremiumBaseAmt
	,ptc.OOSFuturePremiumOriginalAmt
	,ptc.OOSFuturePremiumReportingAmt
	,ptc.OOSTypeCode
	,ptc.OOSTypeDesc
	,ptr.UltimateLossRatioPct
	,ptr.RevisedUltimateLossRatioPct
	,ptr.PercentOfTechnicalPricePct
	,ptr.PremiumChangePct
	,ptr.DeductionsAttachmentsChangePct
	,ptr.CoverageChangePct
	,ptr.ExposureChangePct
	,ptr.IsRenewalPriceIndexDataInd
	,ptr.RenewalPriceIndexPct
	,ptr.IsPolicyEffectiveDateProposedInd
	,ptr.IsPolicyExpirationDateProposedInd
	,ptr.IsProjectPolicyInd
	,ptr.IsFacReinsurancePurchasedInd
	,ptr.ProjectName
	,ptr.ProjectTypeCode
	,ptr.ProjectTypeDesc
	,ptr.ISOClassCode
	,ptr.IsNYFreeTradeZoneInd
	,ptr.NYFreeTradeZoneClassCode
	,ptr.IsPolicyTrackAsNonRecurringPremiumInd
	,ptr.IsMiddleMarketPolicyInd
	,ptr.BusinessTypeCode
	,ptr.BusinessTypeDesc
	,isnull(twc.WritingCompanySourceCode,twc2.WritingCompanySourceCode) as WritingCompanySourceCode
	,ptr.IsRunoffERPInd
	,try_convert(DATETIME, ptr.RunoffERPDate, 127) AS RunoffERPDate
	,ptr.IsFirmOrderNotedInd
	,ptr.WrittenLinePct
	,ptr.SignedLinePct
	,ptr.PremiumAllocationPct
	,ptr.CoverageTriggerCode
	,ptr.CoverageTriggerDesc
	,ptr.ProfessionCode
	,ptr.ProfessionDesc
	,ptr.DomicileCountryCode
	,ptr.DomicileCountryDesc
	,ptr.DomicileStateCode
	,ptr.DomicileStateDesc
	,ptr.MinimumEarnedPremiumPct
	,ptr.TreatyOrReferralAppliesDesc
	,ptr.DaysNoticeOfCancellationNum
	,ptr.IsFacultativeEquipmentBreakdownInd
	,ptr.IsEquipmentBreakdownPremiumIncludedInd
	,ptr.IsComboPolicyInd
	,ptr.IsAdmittedDeregInd
	,ptr.QuotaShareAppliesInd
	,ptr.IsSharedLimitInd
	,try_convert(DATETIME, ptr.PendingAndPriorLitigationDate, 127) AS PendingAndPriorLitigationDate
	,ptr.IsPremiumAuditableInd
	,ptr.IsTRIAOfferedInd
	,ptr.IsFortune500CompanyInd
	,ptr.ClassofBusinessCode
	,ptr.IsBureauInd
	,ptr.IsDeclarationPremBearingInd
	,ptr.IsRiskBordereauProvidedInd
	,ptr.IsClaimBordereauProvidedInd
	,ptr.IsPaidPremiumBordereauProvidedInd
	,ptr.IsFrontedInd
	,ptr.IsCombinedPackageInd
	,ptr.IsPremiumWaivedInd
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
		,PolicyTrans NVARCHAR(MAX) AS JSON
		,WritingCompany NVARCHAR(MAX) AS JSON
		) pol
CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (
		PolicyTransSourceCode NVARCHAR(255)
		,PolicyNum NVARCHAR(255)
		,TermNum NVARCHAR(255)
		,PolicyTransNum NVARCHAR(255)
		,PolicyTransVersionNum INT
		,PolicyTransTypeCode NVARCHAR(255)
		,PolicyTransTypeDesc NVARCHAR(255)
		,TransStartDatetime NVARCHAR(255)
		,TransEndDatetime NVARCHAR(255)
		,PolicyTransStatusCode NVARCHAR(255)
		,PolicyTransStatusDesc NVARCHAR(255)
		,UnderwritingStatusCode NVARCHAR(255)
		,UnderwritingStatusDesc NVARCHAR(255)
		,RegistrationDate NVARCHAR(255)
		,PolicyIssuanceDate NVARCHAR(255)
		,PolicyCancellationDate NVARCHAR(255)
		,NextRenewalCheckDate NVARCHAR(255)
		,RetroActiveDate NVARCHAR(255)
		,BusinessUnitCode NVARCHAR(255)
		,BusinessUnitDesc NVARCHAR(255)
		,PolicyEffectiveDate NVARCHAR(255)
		,LegacyPolicyNum NVARCHAR(255)
		,PolicyExpirationDate NVARCHAR(255)
		,IsTransportationPolicyInd INT
		,StandardIndustryCode NVARCHAR(255)
		,StandardIndustryCodeDesc NVARCHAR(255)
		,NorthAmericanIndustryClassificationCode NVARCHAR(255)
		,NorthAmericanIndustryClassificationDesc NVARCHAR(255)
		,IsPremWaivedInd INT
		,BaseCurrencyCode NVARCHAR(255)
		,BaseCurrencyDesc NVARCHAR(255)
		,OriginalCurrencyCode NVARCHAR(255)
		,OriginalCurrencyDesc NVARCHAR(255)
		,ReportingCurrencyCode NVARCHAR(255)
		,ReportingCurrencyDesc NVARCHAR(255)
		,UltimateLossRatioPct DECIMAL(20, 6)
		,RevisedUltimateLossRatioPct DECIMAL(20, 6)
		,PercentOfTechnicalPricePct DECIMAL(20, 6)
		,PremiumChangePct DECIMAL(20, 6)
		,DeductionsAttachmentsChangePct DECIMAL(20, 6)
		,CoverageChangePct DECIMAL(20, 6)
		,ExposureChangePct DECIMAL(20, 6)
		,IsRenewalPriceIndexDataInd INT
		,RenewalPriceIndexPct DECIMAL(20, 6)
		,IsPolicyEffectiveDateProposedInd INT
		,IsPolicyExpirationDateProposedInd INT
		,IsProjectPolicyInd INT
		,IsFacReinsurancePurchasedInd INT
		,ProjectName NVARCHAR(255)
		,ProjectTypeCode NVARCHAR(255)
		,ProjectTypeDesc NVARCHAR(255)
		,ISOClassCode NVARCHAR(255)
		,IsNYFreeTradeZoneInd INT
		,NYFreeTradeZoneClassCode NVARCHAR(255)
		,IsPolicyTrackAsNonRecurringPremiumInd INT
		,IsMiddleMarketPolicyInd INT
		,BusinessTypeCode NVARCHAR(255)
		,BusinessTypeDesc NVARCHAR(255)
		,IsMGAInd INT
		,FrontingCompanyName NVARCHAR(255)
		,IsRunoffERPInd INT
		,RunoffERPDate NVARCHAR(255)
		,IsFirmOrderNotedInd INT
		,WrittenLinePct DECIMAL(20, 6)
		,SignedLinePct DECIMAL(20, 6)
		,PremiumAllocationPct DECIMAL(20, 6)
		,CoverageTriggerCode NVARCHAR(255)
		,CoverageTriggerDesc NVARCHAR(255)
		,ProfessionCode NVARCHAR(255)
		,ProfessionDesc NVARCHAR(255)
		,DomicileCountryCode NVARCHAR(255)
		,DomicileCountryDesc NVARCHAR(255)
		,DomicileStateCode NVARCHAR(255)
		,DomicileStateDesc NVARCHAR(255)
		,MinimumEarnedPremiumPct DECIMAL(20, 6)
		,TreatyOrReferralAppliesDesc NVARCHAR(255)
		,DaysNoticeOfCancellationNum INT
		,IsFacultativeEquipmentBreakdownInd INT
		,IsEquipmentBreakdownPremiumIncludedInd INT
		,IsComboPolicyInd INT
		,IsAdmittedDeregInd INT
		,QuotaShareAppliesInd INT
		,IsSharedLimitInd INT
		,PendingAndPriorLitigationDate NVARCHAR(255)
		,IsPremiumAuditableInd INT
		,IsTRIAOfferedInd INT
		,IsFortune500CompanyInd INT
		,ClassOfBusinessCode NVARCHAR(255)
		,IsBureauInd INT
		,IsDeclarationPremBearingInd INT
		,IsRiskBordereauProvidedInd INT
		,IsClaimBordereauProvidedInd INT
		,IsPaidPremiumBordereauProvidedInd INT
		,IsFrontedInd INT
		,IsCombinedPackageInd INT
		,IsTradeAssocInd INT
		,IndustryClassCode NVARCHAR(255)
		,IsMultilineDiscountInd INT
		,IsDriverMonitoringInfoInd INT
		,IsManualAuditInd INT
		,MarketSegmentCode NVARCHAR(255)
		,IsTPAUsedInd INT
		,NumEmployee INT
		,IsBrokerageInd INT
		,IsUnionInd INT
		,IsQuoteEZPayInd INT
		,IsPremiumWaivedInd INT
		,WritingCompany NVARCHAR(MAX) AS JSON
		,TransactionCost NVARCHAR(MAX) AS JSON
		) ptr
OUTER APPLY OPENJSON(ptr.TransactionCost) WITH (
		EstWrittenPremiumBaseAmt DECIMAL(20, 6)
		,EstWrittenPremiumOriginalAmt DECIMAL(20, 6)
		,EstWrittenPremiumReportingAmt DECIMAL(20, 6)
		,TermPremiumBaseAmt DECIMAL(20, 6)
		,TermPremiumOriginalAmt DECIMAL(20, 6)
		,TermPremiumReportingAmt DECIMAL(20, 6)
		,AddlRetPremiumBaseAmt DECIMAL(20, 6)
		,AddlRetPremiumOriginalAmt DECIMAL(20, 6)
		,AddlRetPremiumReportingAmt DECIMAL(20, 6)
		,OOSOffsetPremiumBaseAmt DECIMAL(20, 6)
		,OOSOffsetPremiumOriginalAmt DECIMAL(20, 6)
		,OOSOffsetPremiumReportingAmt DECIMAL(20, 6)
		,OOSFuturePremiumBaseAmt DECIMAL(20, 6)
		,OOSFuturePremiumOriginalAmt DECIMAL(20, 6)
		,OOSFuturePremiumReportingAmt DECIMAL(20, 6)
		,OOSTypeCode NVARCHAR(255)
		,OOSTypeDesc NVARCHAR(255)
		) ptc
OUTER APPLY OPENJSON(ptr.WritingCompany) WITH (
		WritingCompanySourceCode NVARCHAR(255)
		,WritingCompanyCode NVARCHAR(255)
		) twc
outer apply openjson(pol.WritingCompany) WITH(
		WritingCompanySourceCode NVARCHAR(255)
				,WritingCompanyCode NVARCHAR(255)
		) twc2



GO
