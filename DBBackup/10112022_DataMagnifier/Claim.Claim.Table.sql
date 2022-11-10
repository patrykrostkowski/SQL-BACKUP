USE [DataMagnifier]
GO
/****** Object:  Table [Claim].[Claim]    Script Date: 10.11.2022 14:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Claim].[Claim]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_AreaofPracticeSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim]  WITH CHECK ADD  CONSTRAINT [FK_AreaofPracticeSK_Claim] FOREIGN KEY([AreaofPracticeSK])
REFERENCES [TypeList].[AreaofPractice] ([AreaofPracticeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_AreaofPracticeSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim] CHECK CONSTRAINT [FK_AreaofPracticeSK_Claim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_CatastropheSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim]  WITH CHECK ADD  CONSTRAINT [FK_CatastropheSK_Claim] FOREIGN KEY([CatastropheSK])
REFERENCES [Claim].[Catastrophe] ([CatastropheSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_CatastropheSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim] CHECK CONSTRAINT [FK_CatastropheSK_Claim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_CatLossEstimateCurrencySK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim]  WITH CHECK ADD  CONSTRAINT [FK_CatLossEstimateCurrencySK_Claim] FOREIGN KEY([CatLossEstimateCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_CatLossEstimateCurrencySK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim] CHECK CONSTRAINT [FK_CatLossEstimateCurrencySK_Claim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_CauseofLossSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim]  WITH CHECK ADD  CONSTRAINT [FK_CauseofLossSK_Claim] FOREIGN KEY([CauseofLossSK])
REFERENCES [TypeList].[CauseofLoss] ([CauseofLossSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_CauseofLossSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim] CHECK CONSTRAINT [FK_CauseofLossSK_Claim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimantOutcomeSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim]  WITH CHECK ADD  CONSTRAINT [FK_ClaimantOutcomeSK_Claim] FOREIGN KEY([ClaimantOutcomeSK])
REFERENCES [TypeList].[ClaimantOutcome] ([ClaimantOutcomeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimantOutcomeSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim] CHECK CONSTRAINT [FK_ClaimantOutcomeSK_Claim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimCurrencySK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim]  WITH CHECK ADD  CONSTRAINT [FK_ClaimCurrencySK_Claim] FOREIGN KEY([ClaimCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimCurrencySK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim] CHECK CONSTRAINT [FK_ClaimCurrencySK_Claim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimProgressSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim]  WITH CHECK ADD  CONSTRAINT [FK_ClaimProgressSK_Claim] FOREIGN KEY([ClaimProgressSK])
REFERENCES [TypeList].[ClaimProgress] ([ClaimProgressSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimProgressSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim] CHECK CONSTRAINT [FK_ClaimProgressSK_Claim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimStatusSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim]  WITH CHECK ADD  CONSTRAINT [FK_ClaimStatusSK_Claim] FOREIGN KEY([ClaimStatusSK])
REFERENCES [TypeList].[ClaimStatus] ([ClaimStatusSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimStatusSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim] CHECK CONSTRAINT [FK_ClaimStatusSK_Claim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimTierSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim]  WITH CHECK ADD  CONSTRAINT [FK_ClaimTierSK_Claim] FOREIGN KEY([ClaimTierSK])
REFERENCES [TypeList].[ClaimTier] ([ClaimTierSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimTierSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim] CHECK CONSTRAINT [FK_ClaimTierSK_Claim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClosedOutcomeSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim]  WITH CHECK ADD  CONSTRAINT [FK_ClosedOutcomeSK_Claim] FOREIGN KEY([ClosedOutcomeSK])
REFERENCES [TypeList].[ClosedOutcome] ([ClosedOutcomeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClosedOutcomeSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim] CHECK CONSTRAINT [FK_ClosedOutcomeSK_Claim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_CoverageTriggerSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim]  WITH CHECK ADD  CONSTRAINT [FK_CoverageTriggerSK_Claim] FOREIGN KEY([CoverageTriggerSK])
REFERENCES [TypeList].[CoverageTrigger] ([CoverageTriggerSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_CoverageTriggerSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim] CHECK CONSTRAINT [FK_CoverageTriggerSK_Claim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_DateofLossQualifierSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim]  WITH CHECK ADD  CONSTRAINT [FK_DateofLossQualifierSK_Claim] FOREIGN KEY([DateofLossQualifierSK])
REFERENCES [TypeList].[DateofLossQualifier] ([DateofLossQualifierSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_DateofLossQualifierSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim] CHECK CONSTRAINT [FK_DateofLossQualifierSK_Claim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_FaultRatingSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim]  WITH CHECK ADD  CONSTRAINT [FK_FaultRatingSK_Claim] FOREIGN KEY([FaultRatingSK])
REFERENCES [TypeList].[FaultRating] ([FaultRatingSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_FaultRatingSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim] CHECK CONSTRAINT [FK_FaultRatingSK_Claim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_FlaggedTypeSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim]  WITH CHECK ADD  CONSTRAINT [FK_FlaggedTypeSK_Claim] FOREIGN KEY([FlaggedTypeSK])
REFERENCES [TypeList].[FlaggedType] ([FlaggedTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_FlaggedTypeSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim] CHECK CONSTRAINT [FK_FlaggedTypeSK_Claim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_FrontingCompanySK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim]  WITH CHECK ADD  CONSTRAINT [FK_FrontingCompanySK_Claim] FOREIGN KEY([FrontingCompanySK])
REFERENCES [Party].[FrontingCompany] ([FrontingCompanySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_FrontingCompanySK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim] CHECK CONSTRAINT [FK_FrontingCompanySK_Claim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_InjurySeveritySK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim]  WITH CHECK ADD  CONSTRAINT [FK_InjurySeveritySK_Claim] FOREIGN KEY([InjurySeveritySK])
REFERENCES [TypeList].[InjurySeverity] ([InjurySeveritySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_InjurySeveritySK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim] CHECK CONSTRAINT [FK_InjurySeveritySK_Claim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_LitigationStatusSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim]  WITH CHECK ADD  CONSTRAINT [FK_LitigationStatusSK_Claim] FOREIGN KEY([LitigationStatusSK])
REFERENCES [TypeList].[LitigationStatus] ([LitigationStatusSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_LitigationStatusSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim] CHECK CONSTRAINT [FK_LitigationStatusSK_Claim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_LossAnalysisSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim]  WITH CHECK ADD  CONSTRAINT [FK_LossAnalysisSK_Claim] FOREIGN KEY([LossAnalysisSK])
REFERENCES [TypeList].[LossAnalysis] ([LossAnalysisSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_LossAnalysisSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim] CHECK CONSTRAINT [FK_LossAnalysisSK_Claim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_MajorCauseofLossSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim]  WITH CHECK ADD  CONSTRAINT [FK_MajorCauseofLossSK_Claim] FOREIGN KEY([MajorCauseofLossSK])
REFERENCES [TypeList].[MajorCauseofLoss] ([MajorCauseofLossSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_MajorCauseofLossSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim] CHECK CONSTRAINT [FK_MajorCauseofLossSK_Claim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_NorthAmericanIndustryClassificationSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim]  WITH CHECK ADD  CONSTRAINT [FK_NorthAmericanIndustryClassificationSK_Claim] FOREIGN KEY([NorthAmericanIndustryClassificationSK])
REFERENCES [TypeList].[NorthAmericanIndustryClassification] ([NorthAmericanIndustryClassificationSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_NorthAmericanIndustryClassificationSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim] CHECK CONSTRAINT [FK_NorthAmericanIndustryClassificationSK_Claim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_OpenReasonSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim]  WITH CHECK ADD  CONSTRAINT [FK_OpenReasonSK_Claim] FOREIGN KEY([OpenReasonSK])
REFERENCES [TypeList].[OpenReason] ([OpenReasonSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_OpenReasonSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim] CHECK CONSTRAINT [FK_OpenReasonSK_Claim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_OtherRecoverableStatusSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim]  WITH CHECK ADD  CONSTRAINT [FK_OtherRecoverableStatusSK_Claim] FOREIGN KEY([OtherRecoverableStatusSK])
REFERENCES [TypeList].[OtherRecoverableStatus] ([OtherRecoverableStatusSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_OtherRecoverableStatusSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim] CHECK CONSTRAINT [FK_OtherRecoverableStatusSK_Claim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ProductSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim]  WITH CHECK ADD  CONSTRAINT [FK_ProductSK_Claim] FOREIGN KEY([ProductSK])
REFERENCES [TypeList].[Product] ([ProductSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ProductSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim] CHECK CONSTRAINT [FK_ProductSK_Claim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_Reason_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim]  WITH CHECK ADD  CONSTRAINT [FK_Reason_Claim] FOREIGN KEY([ReOpenReasonSK])
REFERENCES [TypeList].[Reason] ([ReasonSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_Reason_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim] CHECK CONSTRAINT [FK_Reason_Claim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ReOpenReasonSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim]  WITH CHECK ADD  CONSTRAINT [FK_ReOpenReasonSK_Claim] FOREIGN KEY([ReOpenReasonSK])
REFERENCES [TypeList].[OpenReason] ([OpenReasonSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ReOpenReasonSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim] CHECK CONSTRAINT [FK_ReOpenReasonSK_Claim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SalvageStatusSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim]  WITH CHECK ADD  CONSTRAINT [FK_SalvageStatusSK_Claim] FOREIGN KEY([SalvageStatusSK])
REFERENCES [TypeList].[SalvageStatus] ([SalvageStatusSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SalvageStatusSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim] CHECK CONSTRAINT [FK_SalvageStatusSK_Claim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SourceSystemSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_Claim] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SourceSystemSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim] CHECK CONSTRAINT [FK_SourceSystemSK_Claim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_StandardIndustryCodeSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim]  WITH CHECK ADD  CONSTRAINT [FK_StandardIndustryCodeSK_Claim] FOREIGN KEY([StandardIndustryCodeSK])
REFERENCES [TypeList].[StandardIndustryCode] ([StandardIndustryCodeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_StandardIndustryCodeSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim] CHECK CONSTRAINT [FK_StandardIndustryCodeSK_Claim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SubrogationStatusSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim]  WITH CHECK ADD  CONSTRAINT [FK_SubrogationStatusSK_Claim] FOREIGN KEY([SubrogationStatusSK])
REFERENCES [TypeList].[SubrogationStatus] ([SubrogationStatusSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SubrogationStatusSK_Claim]') AND parent_object_id = OBJECT_ID(N'[Claim].[Claim]'))
ALTER TABLE [Claim].[Claim] CHECK CONSTRAINT [FK_SubrogationStatusSK_Claim]
GO
