USE [sqldb-ods-dev]
GO
/****** Object:  Table [Claim].[Claim]    Script Date: 28.10.2022 13:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Claim].[Claim](
	[ClaimSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[ClaimNum] [varchar](40) NOT NULL,
	[IsBondClaimInd] [tinyint] NOT NULL,
	[LegacyClaimNum] [varchar](40) NULL,
	[BureauClaimNum] [varchar](40) NULL,
	[CedentClaimNum] [varchar](64) NULL,
	[ClaimStatusSK] [int] NOT NULL,
	[ClaimTierSK] [int] NULL,
	[ClaimCurrencySK] [int] NOT NULL,
	[CatastropheSK] [int] NULL,
	[LitigationStatusSK] [int] NULL,
	[CoverageTriggerSK] [int] NULL,
	[ClosedOutcomeSK] [int] NULL,
	[InjurySeveritySK] [int] NULL,
	[ProductSK] [int] NULL,
	[MajorCauseofLossSK] [int] NULL,
	[LossAnalysisSK] [int] NULL,
	[FaultRatingSK] [int] NULL,
	[ClaimProgressSK] [int] NULL,
	[ClaimantOutcomeSK] [int] NULL,
	[FlaggedTypeSK] [int] NULL,
	[OpenReasonSK] [int] NULL,
	[SubrogationStatusSK] [int] NULL,
	[SalvageStatusSK] [int] NULL,
	[AreaofPracticeSK] [int] NULL,
	[StandardIndustryCodeSK] [int] NULL,
	[NorthAmericanIndustryClassificationSK] [int] NULL,
	[DateofLossQualifierSK] [int] NULL,
	[ReOpenReasonSK] [int] NULL,
	[OtherRecoverableStatusSK] [int] NULL,
	[FrontingCompanySK] [int] NULL,
	[CauseofLossSK] [int] NULL,
	[ClaimCategoryTypeSK] [int] NULL,
	[ClaimDesc] [varchar](250) NULL,
	[ProgramNum] [varchar](10) NULL,
	[SpecialInvestigationScoreNum] [int] NULL,
	[FlaggedReasonDesc] [varchar](250) NULL,
	[AccountMarketYear] [int] NULL,
	[BrokerAdvisedDate] [date] NULL,
	[AttachmentDate] [date] NULL,
	[EventDate] [date] NULL,
	[OpenedDate] [date] NULL,
	[ClosedDate] [date] NULL,
	[RecentActivityDate] [date] NULL,
	[LossDate] [date] NULL,
	[ClaimantReportedDate] [date] NULL,
	[ClaimsMadeDate] [date] NULL,
	[ClaimEntryDate] [date] NULL,
	[OriginalEntryDate] [date] NULL,
	[ContractLossDate] [date] NULL,
	[ReportedtoAgentDate] [date] NULL,
	[ReportedtoInsuredDate] [date] NULL,
	[FlaggedDate] [date] NULL,
	[DeathDate] [date] NULL,
	[ReOpenDate] [date] NULL,
	[IsShowMedicalFirstInd] [tinyint] NULL,
	[IsCoverageDeniedInd] [tinyint] NULL,
	[IsBlockClaimInd] [tinyint] NULL,
	[IsAnnualAggregateDeductibleInd] [tinyint] NULL,
	[IsAvoidanceInd] [tinyint] NULL,
	[IsBureauClaimInd] [tinyint] NULL,
	[IsConflictInd] [tinyint] NULL,
	[IsAutoClaimReviewInd] [tinyint] NULL,
	[IsECOInd] [tinyint] NULL,
	[IsExcessInd] [tinyint] NULL,
	[IsExGratiaInd] [tinyint] NULL,
	[IsinjuredRegularJobInd] [tinyint] NULL,
	[IsInsuredPremisesInd] [tinyint] NULL,
	[IsInsuranceInd] [tinyint] NULL,
	[IsISOEnabledInd] [tinyint] NULL,
	[IsIncidentReportInd] [tinyint] NULL,
	[IsCoverageInQuestionInd] [tinyint] NULL,
	[IsPeriodicPaymentOrderInd] [tinyint] NULL,
	[IsQuotaShareMemoInd] [tinyint] NULL,
	[IsReinstatementFlaggedInd] [tinyint] NULL,
	[IsReinsuranceReportableInd] [tinyint] NULL,
	[IsReOpenedInd] [tinyint] NULL,
	[IsShadowPolicyInd] [tinyint] NULL,
	[IsLitigationClaimInd] [tinyint] NULL,
	[IsFatalityClaimInd] [tinyint] NULL,
	[IsSIUClaimInd] [tinyint] NULL,
	[IsFlagClaimInd] [tinyint] NULL,
	[IsLargeClaimInd] [tinyint] NULL,
	[IsWatchListInd] [tinyint] NULL,
	[IsDisputeClaimInd] [tinyint] NULL,
	[IsClaimAttachedToTransactionInd] [tinyint] NULL,
	[CatLossEstimateAmt] [decimal](19, 4) NULL,
	[CatLossEstimateCurrencySK] [int] NULL,
	[AllegedCauseOfLossCodeSK] [int] NULL,
	[IsClassActionInd] [tinyint] NULL,
	[IsLeadInd] [tinyint] NULL,
	[IsFormFollowInd] [tinyint] NULL,
	[IsQuotaShareInd] [tinyint] NULL,
	[IsReinsuranceContractInd] [tinyint] NULL,
	[IsAllegationBadFaithInd] [tinyint] NULL,
	[IsBadFaithInd] [tinyint] NULL,
	[ExcessParticipationPct] [decimal](8, 2) NULL,
	[QuotaShareParticipationPct] [decimal](8, 2) NULL,
	[ReinsuranceParticipationPct] [decimal](8, 2) NULL,
 CONSTRAINT [PK_Claim] PRIMARY KEY CLUSTERED 
(
	[ClaimSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_Claim]    Script Date: 28.10.2022 13:37:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_Claim] ON [Claim].[Claim]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Claim].[Claim]  WITH NOCHECK ADD  CONSTRAINT [FK_AreaofPracticeSK_Claim] FOREIGN KEY([AreaofPracticeSK])
REFERENCES [Typelist].[AreaofPractice] ([AreaofPracticeSK])
GO
ALTER TABLE [Claim].[Claim] NOCHECK CONSTRAINT [FK_AreaofPracticeSK_Claim]
GO
ALTER TABLE [Claim].[Claim]  WITH NOCHECK ADD  CONSTRAINT [FK_CatastropheSK_Claim] FOREIGN KEY([CatastropheSK])
REFERENCES [Claim].[Catastrophe] ([CatastropheSK])
GO
ALTER TABLE [Claim].[Claim] NOCHECK CONSTRAINT [FK_CatastropheSK_Claim]
GO
ALTER TABLE [Claim].[Claim]  WITH NOCHECK ADD  CONSTRAINT [FK_CatLossEstimateCurrencySK_Claim] FOREIGN KEY([CatLossEstimateCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Claim].[Claim] NOCHECK CONSTRAINT [FK_CatLossEstimateCurrencySK_Claim]
GO
ALTER TABLE [Claim].[Claim]  WITH NOCHECK ADD  CONSTRAINT [FK_CauseofLossSK_Claim] FOREIGN KEY([CauseofLossSK])
REFERENCES [Typelist].[CauseofLoss] ([CauseofLossSK])
GO
ALTER TABLE [Claim].[Claim] NOCHECK CONSTRAINT [FK_CauseofLossSK_Claim]
GO
ALTER TABLE [Claim].[Claim]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimantOutcomeSK_Claim] FOREIGN KEY([ClaimantOutcomeSK])
REFERENCES [Typelist].[ClaimantOutcome] ([ClaimantOutcomeSK])
GO
ALTER TABLE [Claim].[Claim] NOCHECK CONSTRAINT [FK_ClaimantOutcomeSK_Claim]
GO
ALTER TABLE [Claim].[Claim]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimCategoryTypeSK_Claim] FOREIGN KEY([ClaimCategoryTypeSK])
REFERENCES [Typelist].[ClaimCategoryType] ([ClaimCategoryTypeSK])
GO
ALTER TABLE [Claim].[Claim] NOCHECK CONSTRAINT [FK_ClaimCategoryTypeSK_Claim]
GO
ALTER TABLE [Claim].[Claim]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimCurrencySK_Claim] FOREIGN KEY([ClaimCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Claim].[Claim] NOCHECK CONSTRAINT [FK_ClaimCurrencySK_Claim]
GO
ALTER TABLE [Claim].[Claim]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimProgressSK_Claim] FOREIGN KEY([ClaimProgressSK])
REFERENCES [Typelist].[ClaimProgress] ([ClaimProgressSK])
GO
ALTER TABLE [Claim].[Claim] NOCHECK CONSTRAINT [FK_ClaimProgressSK_Claim]
GO
ALTER TABLE [Claim].[Claim]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimStatusSK_Claim] FOREIGN KEY([ClaimStatusSK])
REFERENCES [Typelist].[ClaimStatus] ([ClaimStatusSK])
GO
ALTER TABLE [Claim].[Claim] NOCHECK CONSTRAINT [FK_ClaimStatusSK_Claim]
GO
ALTER TABLE [Claim].[Claim]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimTierSK_Claim] FOREIGN KEY([ClaimTierSK])
REFERENCES [Typelist].[ClaimTier] ([ClaimTierSK])
GO
ALTER TABLE [Claim].[Claim] NOCHECK CONSTRAINT [FK_ClaimTierSK_Claim]
GO
ALTER TABLE [Claim].[Claim]  WITH NOCHECK ADD  CONSTRAINT [FK_ClosedOutcomeSK_Claim] FOREIGN KEY([ClosedOutcomeSK])
REFERENCES [Typelist].[ClosedOutcome] ([ClosedOutcomeSK])
GO
ALTER TABLE [Claim].[Claim] NOCHECK CONSTRAINT [FK_ClosedOutcomeSK_Claim]
GO
ALTER TABLE [Claim].[Claim]  WITH NOCHECK ADD  CONSTRAINT [FK_CoverageTriggerSK_Claim] FOREIGN KEY([CoverageTriggerSK])
REFERENCES [Typelist].[CoverageTrigger] ([CoverageTriggerSK])
GO
ALTER TABLE [Claim].[Claim] NOCHECK CONSTRAINT [FK_CoverageTriggerSK_Claim]
GO
ALTER TABLE [Claim].[Claim]  WITH NOCHECK ADD  CONSTRAINT [FK_DateofLossQualifierSK_Claim] FOREIGN KEY([DateofLossQualifierSK])
REFERENCES [Typelist].[DateofLossQualifier] ([DateofLossQualifierSK])
GO
ALTER TABLE [Claim].[Claim] NOCHECK CONSTRAINT [FK_DateofLossQualifierSK_Claim]
GO
ALTER TABLE [Claim].[Claim]  WITH NOCHECK ADD  CONSTRAINT [FK_FaultRatingSK_Claim] FOREIGN KEY([FaultRatingSK])
REFERENCES [Typelist].[FaultRating] ([FaultRatingSK])
GO
ALTER TABLE [Claim].[Claim] NOCHECK CONSTRAINT [FK_FaultRatingSK_Claim]
GO
ALTER TABLE [Claim].[Claim]  WITH NOCHECK ADD  CONSTRAINT [FK_FlaggedTypeSK_Claim] FOREIGN KEY([FlaggedTypeSK])
REFERENCES [Typelist].[FlaggedType] ([FlaggedTypeSK])
GO
ALTER TABLE [Claim].[Claim] NOCHECK CONSTRAINT [FK_FlaggedTypeSK_Claim]
GO
ALTER TABLE [Claim].[Claim]  WITH NOCHECK ADD  CONSTRAINT [FK_FrontingCompanySK_Claim] FOREIGN KEY([FrontingCompanySK])
REFERENCES [Party].[FrontingCompany] ([FrontingCompanySK])
GO
ALTER TABLE [Claim].[Claim] NOCHECK CONSTRAINT [FK_FrontingCompanySK_Claim]
GO
ALTER TABLE [Claim].[Claim]  WITH NOCHECK ADD  CONSTRAINT [FK_InjurySeveritySK_Claim] FOREIGN KEY([InjurySeveritySK])
REFERENCES [Typelist].[InjurySeverity] ([InjurySeveritySK])
GO
ALTER TABLE [Claim].[Claim] NOCHECK CONSTRAINT [FK_InjurySeveritySK_Claim]
GO
ALTER TABLE [Claim].[Claim]  WITH NOCHECK ADD  CONSTRAINT [FK_LitigationStatusSK_Claim] FOREIGN KEY([LitigationStatusSK])
REFERENCES [Typelist].[LitigationStatus] ([LitigationStatusSK])
GO
ALTER TABLE [Claim].[Claim] NOCHECK CONSTRAINT [FK_LitigationStatusSK_Claim]
GO
ALTER TABLE [Claim].[Claim]  WITH NOCHECK ADD  CONSTRAINT [FK_LossAnalysisSK_Claim] FOREIGN KEY([LossAnalysisSK])
REFERENCES [Typelist].[LossAnalysis] ([LossAnalysisSK])
GO
ALTER TABLE [Claim].[Claim] NOCHECK CONSTRAINT [FK_LossAnalysisSK_Claim]
GO
ALTER TABLE [Claim].[Claim]  WITH NOCHECK ADD  CONSTRAINT [FK_MajorCauseofLossSK_Claim] FOREIGN KEY([MajorCauseofLossSK])
REFERENCES [Typelist].[MajorCauseofLoss] ([MajorCauseofLossSK])
GO
ALTER TABLE [Claim].[Claim] NOCHECK CONSTRAINT [FK_MajorCauseofLossSK_Claim]
GO
ALTER TABLE [Claim].[Claim]  WITH NOCHECK ADD  CONSTRAINT [FK_NorthAmericanIndustryClassificationSK_Claim] FOREIGN KEY([NorthAmericanIndustryClassificationSK])
REFERENCES [Typelist].[NorthAmericanIndustryClassification] ([NorthAmericanIndustryClassificationSK])
GO
ALTER TABLE [Claim].[Claim] NOCHECK CONSTRAINT [FK_NorthAmericanIndustryClassificationSK_Claim]
GO
ALTER TABLE [Claim].[Claim]  WITH NOCHECK ADD  CONSTRAINT [FK_OpenReasonSK_Reason] FOREIGN KEY([OpenReasonSK])
REFERENCES [Typelist].[Reason] ([ReasonSK])
GO
ALTER TABLE [Claim].[Claim] NOCHECK CONSTRAINT [FK_OpenReasonSK_Reason]
GO
ALTER TABLE [Claim].[Claim]  WITH NOCHECK ADD  CONSTRAINT [FK_OtherRecoverableStatusSK_Claim] FOREIGN KEY([OtherRecoverableStatusSK])
REFERENCES [Typelist].[OtherRecoverableStatus] ([OtherRecoverableStatusSK])
GO
ALTER TABLE [Claim].[Claim] NOCHECK CONSTRAINT [FK_OtherRecoverableStatusSK_Claim]
GO
ALTER TABLE [Claim].[Claim]  WITH NOCHECK ADD  CONSTRAINT [FK_ProductSK_Claim] FOREIGN KEY([ProductSK])
REFERENCES [Typelist].[Product] ([ProductSK])
GO
ALTER TABLE [Claim].[Claim] NOCHECK CONSTRAINT [FK_ProductSK_Claim]
GO
ALTER TABLE [Claim].[Claim]  WITH NOCHECK ADD  CONSTRAINT [FK_ReOpenReasonFK_Reason] FOREIGN KEY([ReOpenReasonSK])
REFERENCES [Typelist].[Reason] ([ReasonSK])
GO
ALTER TABLE [Claim].[Claim] NOCHECK CONSTRAINT [FK_ReOpenReasonFK_Reason]
GO
ALTER TABLE [Claim].[Claim]  WITH NOCHECK ADD  CONSTRAINT [FK_SalvageStatusSK_Claim] FOREIGN KEY([SalvageStatusSK])
REFERENCES [Typelist].[SalvageStatus] ([SalvageStatusSK])
GO
ALTER TABLE [Claim].[Claim] NOCHECK CONSTRAINT [FK_SalvageStatusSK_Claim]
GO
ALTER TABLE [Claim].[Claim]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_Claim] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[Claim] NOCHECK CONSTRAINT [FK_SourceSystemSK_Claim]
GO
ALTER TABLE [Claim].[Claim]  WITH NOCHECK ADD  CONSTRAINT [FK_StandardIndustryCodeSK_Claim] FOREIGN KEY([StandardIndustryCodeSK])
REFERENCES [Typelist].[StandardIndustryCode] ([StandardIndustryCodeSK])
GO
ALTER TABLE [Claim].[Claim] NOCHECK CONSTRAINT [FK_StandardIndustryCodeSK_Claim]
GO
ALTER TABLE [Claim].[Claim]  WITH NOCHECK ADD  CONSTRAINT [FK_SubrogationStatusSK_Claim] FOREIGN KEY([SubrogationStatusSK])
REFERENCES [Typelist].[SubrogationStatus] ([SubrogationStatusSK])
GO
ALTER TABLE [Claim].[Claim] NOCHECK CONSTRAINT [FK_SubrogationStatusSK_Claim]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An insurance claim describes the demand for money, services or goods from one party (Claimant) to Insurance Provider under terms and conditions which have been defined by the policy declaration agreement' , @level0type=N'SCHEMA',@level0name=N'Claim', @level1type=N'TABLE',@level1name=N'Claim'
GO
