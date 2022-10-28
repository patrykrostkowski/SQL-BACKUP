USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcPolicyTrans_RETIRED]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--/****** Object:  View [StgPolicy].[SrcPolicyTrans]    Script Date: 29.06.2022 22:15:07 ******/
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO

CREATE    VIEW [StgPolicy].[SrcPolicyTrans_RETIRED]
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
	,try_convert(DATETIME, ptr.TransStartDatetime, 127) AS TransStartDatetime
	,try_convert(DATETIME, ptr.TransEndDatetime, 127) AS TransEndDatetime
	,ptr.PolicyTransStatusCode
	,ptr.UnderwritingStatusCode
	,try_convert(DATETIME, ptr.RegistrationDate, 127) AS RegistrationDate
	,try_convert(DATETIME, ptr.PolicyIssuanceDate, 127) AS PolicyIssuanceDate
	,try_convert(DATETIME, ptr.PolicyCancellationDate, 127) AS PolicyCancellationDate
	,try_convert(DATETIME, ptr.NextRenewalCheckDate, 127) AS NextRenewalCheckDate
	,try_convert(DATETIME, ptr.RetroActiveDate, 127) AS RetroActiveDate
	,ptr.BusinessUnitCode
	,try_convert(DATETIME, ptr.PolicyEffectiveDate, 127) AS PolicyEffectiveDate
	,ptr.LegacyPolicyNum
	,try_convert(DATETIME, ptr.PolicyExpirationDate, 127) AS PolicyExpirationDate
	,ptr.IsTransportationPolicyInd
	,ptr.StandardIndustryCode
	,ptr.NorthAmericanIndustryClassificationCode
	,ptr.IsPremWaivedInd
	,ptr.BaseCurrencyCode
	,ptr.OriginalCurrencyCode
	,ptr.ReportingCurrencyCode
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
	,ptr.ISOClassCode
	,ptr.IsNYFreeTradeZoneInd
	,ptr.NYFreeTradeZoneClassCode
	,ptr.IsPolicyTrackAsNonRecurringPremiumInd
	,ptr.IsMiddleMarketPolicyInd
	,ptr.BusinessTypeCode
	,isnull(twc.WritingCompanySourceCode,twc2.WritingCompanySourceCode) as WritingCompanySourceCode
	,ptr.IsRunoffERPInd
	,try_convert(DATETIME, ptr.RunoffERPDate, 127) AS RunoffERPDate
	,ptr.IsFirmOrderNotedInd
	,ptr.WrittenLinePct
	,ptr.SignedLinePct
	,ptr.PremiumAllocationPct
	,ptr.CoverageTriggerCode
	,ptr.ProfessionCode
	,ptr.DomicileCountryCode
	,ptr.DomicileStateCode
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
	,line.IsValidInd
FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Policy NVARCHAR(max) AS JSON
		) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (
		PolicySourceCode NVARCHAR(max)
		,PolicyTrans NVARCHAR(max) AS JSON
		,WritingCompany NVARCHAR(max) AS JSON
		) pol
cross apply openjson(pol.WritingCompany) WITH(
WritingCompanySourceCode NVARCHAR(max)
		,WritingCompanyCode NVARCHAR(max)
) twc2
CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (
		PolicyTransSourceCode NVARCHAR(max)
		,PolicyNum NVARCHAR(max)
		,TermNum NVARCHAR(max)
		,PolicyTransNum NVARCHAR(max)
		,PolicyTransVersionNum INT
		,PolicyTransTypeCode NVARCHAR(max)
		,PolicyTransTypeDesc NVARCHAR(max)
		,TransStartDatetime NVARCHAR(max)
		,TransEndDatetime NVARCHAR(max)
		,PolicyTransStatusCode NVARCHAR(max)
		,PolicyTransStatusDesc NVARCHAR(max)
		,UnderwritingStatusCode NVARCHAR(max)
		,UnderwritingStatusDesc NVARCHAR(max)
		,RegistrationDate NVARCHAR(max)
		,PolicyIssuanceDate NVARCHAR(max)
		,PolicyCancellationDate NVARCHAR(max)
		,NextRenewalCheckDate NVARCHAR(max)
		,RetroActiveDate NVARCHAR(max)
		,BusinessUnitCode NVARCHAR(max)
		,BusinessUnitDesc NVARCHAR(max)
		,PolicyEffectiveDate NVARCHAR(max)
		,LegacyPolicyNum NVARCHAR(max)
		,PolicyExpirationDate NVARCHAR(max)
		,IsTransportationPolicyInd INT
		,StandardIndustryCode NVARCHAR(max)
		,StandardIndustryCodeDesc NVARCHAR(max)
		,NorthAmericanIndustryClassificationCode NVARCHAR(max)
		,NorthAmericanIndustryClassificationDesc NVARCHAR(max)
		,IsPremWaivedInd INT
		,BaseCurrencyCode NVARCHAR(max)
		,BaseCurrencyDesc NVARCHAR(max)
		,OriginalCurrencyCode NVARCHAR(max)
		,OriginalCurrencyDesc NVARCHAR(max)
		,ReportingCurrencyCode NVARCHAR(max)
		,ReportingCurrencyDesc NVARCHAR(max)
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
		,ProjectName NVARCHAR(max)
		,ProjectTypeCode NVARCHAR(max)
		,ProjectTypeDesc NVARCHAR(max)
		,ISOClassCode NVARCHAR(max)
		,IsNYFreeTradeZoneInd INT
		,NYFreeTradeZoneClassCode NVARCHAR(max)
		,IsPolicyTrackAsNonRecurringPremiumInd INT
		,IsMiddleMarketPolicyInd INT
		,BusinessTypeCode NVARCHAR(max)
		,BusinessTypeDesc NVARCHAR(max)
		,IsMGAInd INT
		,FrontingCompanyName NVARCHAR(max)
		,IsRunoffERPInd INT
		,RunoffERPDate NVARCHAR(max)
		,IsFirmOrderNotedInd INT
		,WrittenLinePct DECIMAL(20, 6)
		,SignedLinePct DECIMAL(20, 6)
		,PremiumAllocationPct DECIMAL(20, 6)
		,CoverageTriggerCode NVARCHAR(max)
		,CoverageTriggerDesc NVARCHAR(max)
		,ProfessionCode NVARCHAR(max)
		,ProfessionDesc NVARCHAR(max)
		,DomicileCountryCode NVARCHAR(max)
		,DomicileCountryDesc NVARCHAR(max)
		,DomicileStateCode NVARCHAR(max)
		,DomicileStateDesc NVARCHAR(max)
		,MinimumEarnedPremiumPct DECIMAL(20, 6)
		,TreatyOrReferralAppliesDesc NVARCHAR(max)
		,DaysNoticeOfCancellationNum INT
		,IsFacultativeEquipmentBreakdownInd INT
		,IsEquipmentBreakdownPremiumIncludedInd INT
		,IsComboPolicyInd INT
		,IsAdmittedDeregInd INT
		,QuotaShareAppliesInd INT
		,IsSharedLimitInd INT
		,PendingAndPriorLitigationDate NVARCHAR(max)
		,IsPremiumAuditableInd INT
		,IsTRIAOfferedInd INT
		,IsFortune500CompanyInd INT
		,ClassOfBusinessCode NVARCHAR(max)
		,IsBureauInd INT
		,IsDeclarationPremBearingInd INT
		,IsRiskBordereauProvidedInd INT
		,IsClaimBordereauProvidedInd INT
		,IsPaidPremiumBordereauProvidedInd INT
		,IsFrontedInd INT
		,IsCombinedPackageInd INT
		,IsTradeAssocInd INT
		,IndustryClassCode NVARCHAR(max)
		,IsMultilineDiscountInd INT
		,IsDriverMonitoringInfoInd INT
		,IsManualAuditInd INT
		,MarketSegmentCode NVARCHAR(max)
		,IsTPAUsedInd INT
		,NumEmployee INT
		,IsBrokerageInd INT
		,IsUnionInd INT
		,IsQuoteEZPayInd INT
		,WritingCompany NVARCHAR(max) AS JSON
		,TransactionCost NVARCHAR(max) AS JSON
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
		,OOSTypeCode NVARCHAR(max)
		,OOSTypeDesc NVARCHAR(max)
		) ptc
OUTER APPLY OPENJSON(ptr.WritingCompany) WITH (
		WritingCompanySourceCode NVARCHAR(max)
		,WritingCompanyCode NVARCHAR(max)) twc
GO
