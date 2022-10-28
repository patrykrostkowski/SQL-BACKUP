USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcClaim]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE    View [StgClaim].[SrcClaim]
AS
SELECT SourceSystemCode
	,ProcessDateTime
	,SourceCode
	,AccountMarketYear 
	,AllegedCauseOfLossCode 
	,AreaofPracticeCode 
	,AttachmentDate 
	,BrokerAdvisedDate 
	,BureauClaimNum 
	,CatLossEstimateAmt
	,CatLossEstimateCurrencyCode
	,CauseofLossCode 
	,CedentClaimNum
	,ClaimantOutcomeCode 
	,ClaimantReportedDate
	,ClaimDesc
	,ClaimEntryDate
	,ClaimNum
	,ClaimProgressCode
	,ClaimsMadeDate 
	,ClaimStatusCode 
	,ClaimTierCode 
	,ClosedDate
	,ClosedOutcomeCode 
	,FaultRatingCode 
	,ContractLossDate 
	,CoverageTriggerCode 
	,DateofLossQualifierCode 
	,DeathDate 
	,EventDate 
	,ExcessParticipationPct 
	,FlaggedDate 
	,FlaggedReasonDesc 
	,FlaggedTypeCode 
	,InjurySeverityCode 
	,IsAllegationBadFaithInd 
	,IsAnnualAggregateDeductibleInd 
	,IsAutoClaimReviewInd 
	,IsAvoidanceInd 
	,IsBadFaithInd 
	,IsBlockClaimInd 
	,IsBondClaimInd
	,IsBureauClaimInd
	,IsClaimAttachedToTransactionInd
	,IsClassActionInd 
	,IsConflictInd 
	,IsCoverageDeniedInd 
	,IsCoverageInQuestionInd 
	,IsDisputeClaimInd 
	,IsECOInd 
	,IsExcessInd 
	,IsExGratiaInd 
	,IsFatalityClaimInd
	,IsFlagClaimInd 
	,IsFormFollowInd 
	,IsIncidentReportInd 
	,IsinjuredRegularJobInd 
	,IsInsuranceInd 
	,IsInsuredPremisesInd 
	,IsISOEnabledInd 
	,IsLargeClaimInd
	,IsLeadInd 
	,IsLitigationClaimInd 
	,IsPeriodicPaymentOrderInd 
	,IsQuotaShareInd 
	,IsQuotaShareMemoInd 
	,IsReinstatementFlaggedInd 
	,IsReinsuranceContractInd 
	,IsReinsuranceReportableInd 
	,IsReOpenedInd 
	,IsShadowPolicyInd 
	,IsShowMedicalFirstInd 
	,IsSIUClaimInd 
	,IsWatchListInd 
	,LegacyClaimNum 
	,LitigationStatusCode 
	,LossAnalysisCode 
	,LossDate 
	,MajorCauseofLossCode 
	,NorthAmericanIndustryClassificationCode 
	,OpenedDate 
	,OpenReasonCode 
	,OriginalEntryDate 
	,OtherRecoverableStatusCode 
	,ProductCode 
	,ProgramNum 
	,QuotaShareParticipationPct 
	,RecentActivityDate 
	,ReinsuranceParticipationPct 
	,ReOpenDate 
	,ReopenReasonCode 
	,ReportedtoAgentDate 
	,ReportedtoInsuredDate 
	,SalvageStatusCode 
	,SpecialInvestigationScoreNum 
	,StandardIndustryCode 
	,SubrogationStatusCode 
	,ClaimCurrencyCode
	,CatastropheSourceCode
	,FrontingCompanySourceCode
	,ClaimCategoryTypeCode
	,ClaimCategoryTypeDesc
	,IsValidInd

FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (
select hdr.SourceSystemCode
	,convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,clm.ClaimSourceCode AS SourceCode
	,clm.AccountMarketYear 
	,clm.AllegedCauseOfLossCode 
	,clm.AreaofPracticeCode 
	,clm.AttachmentDate 
	,clm.BrokerAdvisedDate 
	,clm.BureauClaimNum 
	,clm.CatLossEstimateAmt
	,clm.CatLossEstimateCurrencyCode
	,clm.CauseofLossCode 
	,clm.CedentClaimNum
	,clm.ClaimantOutcomeCode 
	,clm.ClaimantReportedDate
	,clm.ClaimDesc
	,clm.ClaimEntryDate
	,clm.ClaimNum
	,clm.ClaimProgressCode
	,clm.ClaimsMadeDate 
	,clm.ClaimStatusCode 
	,clm.ClaimTierCode 
	,clm.ClosedDate
	,clm.ClosedOutcomeCode 
	,clm.FaultRatingCode 
	,clm.ContractLossDate 
	,clm.CoverageTriggerCode 
	,clm.DateofLossQualifierCode 
	,clm.DeathDate 
	,clm.EventDate 
	,clm.ExcessParticipationPct 
	,clm.FlaggedDate 
	,clm.FlaggedReasonDesc 
	,clm.FlaggedTypeCode 
	,clm.InjurySeverityCode 
	,clm.IsAllegationBadFaithInd 
	,clm.IsAnnualAggregateDeductibleInd 
	,clm.IsAutoClaimReviewInd 
	,clm.IsAvoidanceInd 
	,clm.IsBadFaithInd 
	,clm.IsBlockClaimInd 
	,clm.IsBondClaimInd
	,clm.IsBureauClaimInd
	,clm.IsClaimAttachedToTransactionInd
	,clm.IsClassActionInd 
	,clm.IsConflictInd 
	,clm.IsCoverageDeniedInd 
	,clm.IsCoverageInQuestionInd 
	,clm.IsDisputeClaimInd 
	,clm.IsECOInd 
	,clm.IsExcessInd 
	,clm.IsExGratiaInd 
	,clm.IsFatalityClaimInd
	,clm.IsFlagClaimInd 
	,clm.IsFormFollowInd 
	,clm.IsIncidentReportInd 
	,clm.IsinjuredRegularJobInd 
	,clm.IsInsuranceInd 
	,clm.IsInsuredPremisesInd 
	,clm.IsISOEnabledInd 
	,clm.IsLargeClaimInd
	,clm.IsLeadInd 
	,clm.IsLitigationClaimInd 
	,clm.IsPeriodicPaymentOrderInd 
	,clm.IsQuotaShareInd 
	,clm.IsQuotaShareMemoInd 
	,clm.IsReinstatementFlaggedInd 
	,clm.IsReinsuranceContractInd 
	,clm.IsReinsuranceReportableInd 
	,clm.IsReOpenedInd 
	,clm.IsShadowPolicyInd 
	,clm.IsShowMedicalFirstInd 
	,clm.IsSIUClaimInd 
	,clm.IsWatchListInd 
	,clm.LegacyClaimNum 
	,clm.LitigationStatusCode 
	,clm.LossAnalysisCode 
	,clm.LossDate 
	,clm.MajorCauseofLossCode 
	,clm.NorthAmericanIndustryClassificationCode 
	,clm.OpenedDate 
	,clm.OpenReasonCode 
	,clm.OriginalEntryDate 
	,clm.OtherRecoverableStatusCode 
	,clm.ProductCode 
	,clm.ProgramNum 
	,clm.QuotaShareParticipationPct 
	,clm.RecentActivityDate 
	,clm.ReinsuranceParticipationPct 
	,clm.ReOpenDate 
	,clm.ReopenReasonCode 
	,clm.ReportedtoAgentDate 
	,clm.ReportedtoInsuredDate 
	,clm.SalvageStatusCode 
	,clm.SpecialInvestigationScoreNum 
	,clm.StandardIndustryCode 
	,clm.SubrogationStatusCode 
	,clm.ClaimCurrencyCode
	,cst.CatastropheSourceCode
	,ftc.FrontingCompanySourceCode
	,clp.ClaimPolicySourceCode
	,clm.ClaimCategoryTypeCode
	,clm.ClaimCategoryTypeDesc-------added
	,line.IsValidInd

FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Claim NVARCHAR(max) AS JSON
		) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (
		ClaimSourceCode NVARCHAR(max)
		,AccountMarketYear INT
		,AllegedCauseOfLossCode NVARCHAR(max)
		,AreaofPracticeCode NVARCHAR(max)
		,AttachmentDate NVARCHAR(max)
		,BrokerAdvisedDate NVARCHAR(max)
		,BureauClaimNum NVARCHAR(max)
		,CatLossEstimateAmt NVARCHAR(max)
		,CatLossEstimateCurrencyCode NVARCHAR(max)
		,CauseofLossCode NVARCHAR(max)
		,CedentClaimNum NVARCHAR(max)
		,ClaimantOutcomeCode NVARCHAR(max)
		,ClaimantReportedDate NVARCHAR(max)
		,ClaimDesc NVARCHAR(max)
		,ClaimCurrencyCode NVARCHAR(max)
		,ClaimEntryDate NVARCHAR(max)
		,ClaimNum NVARCHAR(max)
		,ClaimProgressCode NVARCHAR(max)
		,ClaimsMadeDate NVARCHAR(max)
		,ClaimStatusCode NVARCHAR(max)
		,ClaimTierCode NVARCHAR(max)
		,ClosedDate NVARCHAR(max)
		,ClosedOutcomeCode NVARCHAR(max)
		,FaultRatingCode NVARCHAR(max)
		,ContractLossDate NVARCHAR(max)
		,CoverageTriggerCode NVARCHAR(max)
		,DateofLossQualifierCode NVARCHAR(max)
		,DeathDate NVARCHAR(max)
		,EventDate NVARCHAR(max)
		,ExcessParticipationPct NVARCHAR(max)
		,FlaggedDate NVARCHAR(max)
		,FlaggedReasonDesc NVARCHAR(max)
		,FlaggedTypeCode NVARCHAR(max)
		,InjurySeverityCode NVARCHAR(max)
		,IsAllegationBadFaithInd INT
		,IsAnnualAggregateDeductibleInd INT
		,IsAutoClaimReviewInd INT
		,IsAvoidanceInd INT
		,IsBadFaithInd INT
		,IsBlockClaimInd INT
		,IsBondClaimInd NVARCHAR(max)
		,IsBureauClaimInd INT
		,IsClaimAttachedToTransactionInd INT
		,IsClassActionInd INT
		,IsConflictInd INT
		,IsCoverageDeniedInd INT
		,IsCoverageInQuestionInd INT
		,IsDisputeClaimInd INT
		,IsECOInd INT
		,IsExcessInd INT
		,IsExGratiaInd INT
		,IsFatalityClaimInd INT
		,IsFlagClaimInd INT
		,IsFormFollowInd INT
		,IsIncidentReportInd INT
		,IsinjuredRegularJobInd INT
		,IsInsuranceInd INT
		,IsInsuredPremisesInd INT
		,IsISOEnabledInd INT
		,IsLargeClaimInd INT
		,IsLeadInd INT
		,IsLitigationClaimInd INT
		,IsPeriodicPaymentOrderInd INT
		,IsQuotaShareInd INT
		,IsQuotaShareMemoInd INT
		,IsReinstatementFlaggedInd INT
		,IsReinsuranceContractInd INT
		,IsReinsuranceReportableInd INT
		,IsReOpenedInd INT
		,IsShadowPolicyInd INT
		,IsShowMedicalFirstInd INT
		,IsSIUClaimInd INT
		,IsWatchListInd INT
		,LegacyClaimNum NVARCHAR(max)
		,LitigationStatusCode NVARCHAR(max)
		,LossAnalysisCode NVARCHAR(max)
		,LossDate NVARCHAR(max)
		,MajorCauseofLossCode NVARCHAR(max)
		,NorthAmericanIndustryClassificationCode NVARCHAR(max)
		,OpenedDate NVARCHAR(max)
		,OpenReasonCode NVARCHAR(max)
		,OriginalEntryDate NVARCHAR(max)
		,OtherRecoverableStatusCode NVARCHAR(max)
		,ProductCode NVARCHAR(max)
		,ProgramNum NVARCHAR(max)
		,QuotaShareParticipationPct NVARCHAR(max)
		,RecentActivityDate NVARCHAR(max)
		,ReinsuranceParticipationPct NVARCHAR(max)
		,ReOpenDate NVARCHAR(max)
		,ReopenReasonCode NVARCHAR(max)
		,ReportedtoAgentDate NVARCHAR(max)
		,ReportedtoInsuredDate NVARCHAR(max)
		,SalvageStatusCode NVARCHAR(max)
		,SpecialInvestigationScoreNum INT
		,StandardIndustryCode NVARCHAR(max)
		,SubrogationStatusCode NVARCHAR(max)
		,Catastrophe NVARCHAR(max) AS JSON
		,ClaimPolicy NVARCHAR(max) AS JSON
		,ClaimCategoryTypeCode NVARCHAR(max)
		,ClaimCategoryTypeDesc  NVARCHAR(max)------added

		) clm
CROSS APPLY OPENJSON(clm.ClaimPolicy) WITH (
		FrontingCompany NVARCHAR(max) AS JSON
		,ClaimPolicySourceCode NVARCHAR(max)
		) clp
OUTER APPLY OPENJSON(clp.FrontingCompany) WITH (
		FrontingCompanySourceCode NVARCHAR(max)
		,FrontingCompanyCode NVARCHAR(max)
		) ftc
OUTER APPLY OPENJSON(clm.Catastrophe) WITH (
		CatastropheSourceCode NVARCHAR(max)
		) cst
		) AS tmp
	) AS tpl
	where tpl.rn = 1


















































GO
