USE [sqldb-ods-dev]
GO
/****** Object:  Table [Policy].[PolicyTrans]    Script Date: 28.10.2022 13:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[PolicyTrans](
	[PolicyTransSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[IsCurrentInd] [tinyint] NOT NULL,
	[PolicySK] [int] NOT NULL,
	[PolicyNum] [varchar](100) NOT NULL,
	[TermNum] [varchar](10) NOT NULL,
	[PolicyTransNum] [varchar](60) NOT NULL,
	[PolicyTransVersionNum] [int] NULL,
	[PolicyTransTypeSK] [int] NOT NULL,
	[TransStartDatetime] [datetime] NOT NULL,
	[TransEndDatetime] [datetime] NULL,
	[PolicyTransStatusSK] [int] NOT NULL,
	[UnderwritingStatusSK] [int] NULL,
	[RegistrationDate] [date] NULL,
	[PolicyIssuanceDate] [date] NULL,
	[PolicyCancellationDate] [date] NULL,
	[NextRenewalCheckDate] [date] NULL,
	[RetroActiveDate] [date] NULL,
	[BusinessUnitSK] [int] NOT NULL,
	[PolicyEffectiveDate] [date] NULL,
	[LegacyPolicyNum] [varchar](20) NULL,
	[PolicyExpirationDate] [date] NULL,
	[IsTransportationPolicyInd] [tinyint] NULL,
	[StandardIndustryCodeSK] [int] NULL,
	[NorthAmericanIndustryClassificationSK] [int] NULL,
	[IsPremiumWaivedInd] [tinyint] NULL,
	[BaseCurrencySK] [int] NULL,
	[OriginalCurrencySK] [int] NULL,
	[ReportingCurrencySK] [int] NULL,
	[EstWrittenPremiumBaseAmt] [decimal](19, 4) NULL,
	[EstWrittenPremiumOriginalAmt] [decimal](19, 4) NULL,
	[EstWrittenPremiumReportingAmt] [decimal](19, 4) NULL,
	[TermPremiumBaseAmt] [decimal](19, 4) NULL,
	[TermPremiumOriginalAmt] [decimal](19, 4) NULL,
	[TermPremiumReportingAmt] [decimal](19, 4) NULL,
	[AddlRetPremiumBaseAmt] [decimal](19, 4) NULL,
	[AddlRetPremiumOriginalAmt] [decimal](19, 4) NULL,
	[AddlRetPremiumReportingAmt] [decimal](19, 4) NULL,
	[OOSOffsetPremiumBaseAmt] [decimal](19, 4) NULL,
	[OOSOffsetPremiumOriginalAmt] [decimal](19, 4) NULL,
	[OOSOffsetPremiumReportingAmt] [decimal](19, 4) NULL,
	[OOSFuturePremiumBaseAmt] [decimal](19, 4) NULL,
	[OOSFuturePremiumOriginalAmt] [decimal](19, 4) NULL,
	[OOSFuturePremiumReportingAmt] [decimal](19, 4) NULL,
	[OOSTypeCode] [varchar](10) NULL,
	[OOSTypeDesc] [varchar](100) NULL,
	[UltimateLossRatioPct] [decimal](8, 2) NULL,
	[RevisedUltimateLossRatioPct] [decimal](8, 2) NULL,
	[PercentOfTechnicalPricePct] [decimal](8, 2) NULL,
	[PremiumChangePct] [decimal](8, 2) NULL,
	[DeductionsAttachmentsChangePct] [decimal](8, 2) NULL,
	[CoverageChangePct] [decimal](8, 2) NULL,
	[ExposureChangePct] [decimal](8, 2) NULL,
	[IsRenewalPriceIndexDataInd] [tinyint] NULL,
	[RenewalPriceIndexPct] [decimal](8, 2) NULL,
	[IsPolicyEffectiveDateProposedInd] [tinyint] NULL,
	[IsPolicyExpirationDateProposedInd] [tinyint] NULL,
	[IsProjectPolicyInd] [tinyint] NULL,
	[IsFacReinsurancePurchasedInd] [tinyint] NULL,
	[ProjectName] [varchar](255) NULL,
	[ProjectTypeSK] [int] NULL,
	[ISOClassCode] [varchar](20) NULL,
	[IsNYFreeTradeZoneInd] [tinyint] NULL,
	[NYFreeTradeZoneClassCode] [varchar](255) NULL,
	[IsPolicyTrackAsNonRecurringPremiumInd] [tinyint] NULL,
	[IsMiddleMarketPolicyInd] [tinyint] NULL,
	[BusinessTypeSK] [int] NOT NULL,
	[WritingCompanySK] [int] NOT NULL,
	[IsRunoffERPInd] [tinyint] NULL,
	[RunoffERPDate] [date] NULL,
	[IsFirmOrderNotedInd] [tinyint] NULL,
	[WrittenLinePct] [decimal](8, 2) NULL,
	[SignedLinePct] [decimal](8, 2) NULL,
	[PremiumAllocationPct] [decimal](8, 2) NULL,
	[CoverageTriggerSK] [int] NULL,
	[ProfessionSK] [int] NULL,
	[DomicileCountrySK] [int] NULL,
	[DomicileStateSK] [int] NULL,
	[MinimumEarnedPremiumPct] [decimal](8, 2) NULL,
	[TreatyOrReferralAppliesDesc] [varchar](64) NULL,
	[DaysNoticeOfCancellationNum] [int] NULL,
	[IsFacultativeEquipmentBreakdownInd] [tinyint] NULL,
	[IsEquipmentBreakdownPremiumIncludedInd] [tinyint] NULL,
	[IsComboPolicyInd] [tinyint] NULL,
	[IsAdmittedDeregInd] [tinyint] NULL,
	[QuotaShareAppliesInd] [tinyint] NULL,
	[IsSharedLimitInd] [tinyint] NULL,
	[PendingAndPriorLitigationDate] [date] NULL,
	[IsPremiumAuditableInd] [tinyint] NULL,
	[IsTRIAOfferedInd] [tinyint] NULL,
	[IsFortune500CompanyInd] [tinyint] NULL,
	[ClassofBusinessCode] [varchar](20) NULL,
	[IsBureauInd] [tinyint] NULL,
	[IsDeclarationPremBearingInd] [tinyint] NULL,
	[IsRiskBordereauProvidedInd] [tinyint] NULL,
	[IsClaimBordereauProvidedInd] [tinyint] NULL,
	[IsPaidPremiumBordereauProvidedInd] [tinyint] NULL,
	[IsFrontedInd] [tinyint] NULL,
	[IsCombinedPackageInd] [tinyint] NULL,
 CONSTRAINT [PK_PolicyTrans] PRIMARY KEY CLUSTERED 
(
	[PolicyTransSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_PolicyTrans]    Script Date: 28.10.2022 13:37:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_PolicyTrans] ON [Policy].[PolicyTrans]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Policy].[PolicyTrans]  WITH NOCHECK ADD  CONSTRAINT [FK_BaseCurrencySK_PolicyTrans] FOREIGN KEY([BaseCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[PolicyTrans] NOCHECK CONSTRAINT [FK_BaseCurrencySK_PolicyTrans]
GO
ALTER TABLE [Policy].[PolicyTrans]  WITH NOCHECK ADD  CONSTRAINT [FK_BusinessTypeSK_PolicyTrans] FOREIGN KEY([BusinessTypeSK])
REFERENCES [Typelist].[BusinessType] ([BusinessTypeSK])
GO
ALTER TABLE [Policy].[PolicyTrans] NOCHECK CONSTRAINT [FK_BusinessTypeSK_PolicyTrans]
GO
ALTER TABLE [Policy].[PolicyTrans]  WITH NOCHECK ADD  CONSTRAINT [FK_BusinessUnitSK_PolicyTrans] FOREIGN KEY([BusinessUnitSK])
REFERENCES [Typelist].[BusinessUnit] ([BusinessUnitSK])
GO
ALTER TABLE [Policy].[PolicyTrans] NOCHECK CONSTRAINT [FK_BusinessUnitSK_PolicyTrans]
GO
ALTER TABLE [Policy].[PolicyTrans]  WITH NOCHECK ADD  CONSTRAINT [FK_CoverageTriggerSK_PolicyTrans] FOREIGN KEY([CoverageTriggerSK])
REFERENCES [Typelist].[CoverageTrigger] ([CoverageTriggerSK])
GO
ALTER TABLE [Policy].[PolicyTrans] NOCHECK CONSTRAINT [FK_CoverageTriggerSK_PolicyTrans]
GO
ALTER TABLE [Policy].[PolicyTrans]  WITH NOCHECK ADD  CONSTRAINT [FK_DomicileCountrySK_PolicyTrans] FOREIGN KEY([DomicileCountrySK])
REFERENCES [Typelist].[Country] ([CountrySK])
GO
ALTER TABLE [Policy].[PolicyTrans] NOCHECK CONSTRAINT [FK_DomicileCountrySK_PolicyTrans]
GO
ALTER TABLE [Policy].[PolicyTrans]  WITH NOCHECK ADD  CONSTRAINT [FK_DomicileStateSK_PolicyTrans] FOREIGN KEY([DomicileStateSK])
REFERENCES [Typelist].[State] ([StateSK])
GO
ALTER TABLE [Policy].[PolicyTrans] NOCHECK CONSTRAINT [FK_DomicileStateSK_PolicyTrans]
GO
ALTER TABLE [Policy].[PolicyTrans]  WITH NOCHECK ADD  CONSTRAINT [FK_NorthAmericanIndustryClassificationSK_PolicyTrans] FOREIGN KEY([NorthAmericanIndustryClassificationSK])
REFERENCES [Typelist].[NorthAmericanIndustryClassification] ([NorthAmericanIndustryClassificationSK])
GO
ALTER TABLE [Policy].[PolicyTrans] NOCHECK CONSTRAINT [FK_NorthAmericanIndustryClassificationSK_PolicyTrans]
GO
ALTER TABLE [Policy].[PolicyTrans]  WITH NOCHECK ADD  CONSTRAINT [FK_OriginalCurrencySK_PolicyTrans] FOREIGN KEY([OriginalCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[PolicyTrans] NOCHECK CONSTRAINT [FK_OriginalCurrencySK_PolicyTrans]
GO
ALTER TABLE [Policy].[PolicyTrans]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicySK_PolicyTrans] FOREIGN KEY([PolicySK])
REFERENCES [Policy].[Policy] ([PolicySK])
GO
ALTER TABLE [Policy].[PolicyTrans] NOCHECK CONSTRAINT [FK_PolicySK_PolicyTrans]
GO
ALTER TABLE [Policy].[PolicyTrans]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyTransStatusSK_PolicyTrans] FOREIGN KEY([PolicyTransStatusSK])
REFERENCES [Typelist].[PolicyStatus] ([PolicyStatusSK])
GO
ALTER TABLE [Policy].[PolicyTrans] NOCHECK CONSTRAINT [FK_PolicyTransStatusSK_PolicyTrans]
GO
ALTER TABLE [Policy].[PolicyTrans]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyTransTypeSK_PolicyTrans] FOREIGN KEY([PolicyTransTypeSK])
REFERENCES [Typelist].[PolicyTransType] ([PolicyTransTypeSK])
GO
ALTER TABLE [Policy].[PolicyTrans] NOCHECK CONSTRAINT [FK_PolicyTransTypeSK_PolicyTrans]
GO
ALTER TABLE [Policy].[PolicyTrans]  WITH NOCHECK ADD  CONSTRAINT [FK_ProfessionSK_PolicyTrans] FOREIGN KEY([ProfessionSK])
REFERENCES [Typelist].[Profession] ([ProfessionSK])
GO
ALTER TABLE [Policy].[PolicyTrans] NOCHECK CONSTRAINT [FK_ProfessionSK_PolicyTrans]
GO
ALTER TABLE [Policy].[PolicyTrans]  WITH NOCHECK ADD  CONSTRAINT [FK_ProjectTypeSK_PolicyTrans] FOREIGN KEY([ProjectTypeSK])
REFERENCES [Typelist].[ProjectType] ([ProjectTypeSK])
GO
ALTER TABLE [Policy].[PolicyTrans] NOCHECK CONSTRAINT [FK_ProjectTypeSK_PolicyTrans]
GO
ALTER TABLE [Policy].[PolicyTrans]  WITH NOCHECK ADD  CONSTRAINT [FK_ReportingCurrencySK_PolicyTrans] FOREIGN KEY([ReportingCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[PolicyTrans] NOCHECK CONSTRAINT [FK_ReportingCurrencySK_PolicyTrans]
GO
ALTER TABLE [Policy].[PolicyTrans]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyTrans] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[PolicyTrans] NOCHECK CONSTRAINT [FK_SourceSystemSK_PolicyTrans]
GO
ALTER TABLE [Policy].[PolicyTrans]  WITH NOCHECK ADD  CONSTRAINT [FK_StandardIndustryCodeSK_PolicyTrans] FOREIGN KEY([StandardIndustryCodeSK])
REFERENCES [Typelist].[StandardIndustryCode] ([StandardIndustryCodeSK])
GO
ALTER TABLE [Policy].[PolicyTrans] NOCHECK CONSTRAINT [FK_StandardIndustryCodeSK_PolicyTrans]
GO
ALTER TABLE [Policy].[PolicyTrans]  WITH NOCHECK ADD  CONSTRAINT [FK_UnderwritingStatusSK_PolicyTrans] FOREIGN KEY([UnderwritingStatusSK])
REFERENCES [Typelist].[UnderwritingStatus] ([UnderwritingStatusSK])
GO
ALTER TABLE [Policy].[PolicyTrans] NOCHECK CONSTRAINT [FK_UnderwritingStatusSK_PolicyTrans]
GO
ALTER TABLE [Policy].[PolicyTrans]  WITH NOCHECK ADD  CONSTRAINT [FK_WritingCompanySK_PolicyTrans] FOREIGN KEY([WritingCompanySK])
REFERENCES [Party].[WritingCompany] ([WritingCompanySK])
GO
ALTER TABLE [Policy].[PolicyTrans] NOCHECK CONSTRAINT [FK_WritingCompanySK_PolicyTrans]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The suite of post bind transactions in the placement process (e.g. quote, new business, etc.)  for insurance and any related supplements.    Eac h transaction provides the detail grain including  status and respective  underwriter workflow' , @level0type=N'SCHEMA',@level0name=N'Policy', @level1type=N'TABLE',@level1name=N'PolicyTrans'
GO
