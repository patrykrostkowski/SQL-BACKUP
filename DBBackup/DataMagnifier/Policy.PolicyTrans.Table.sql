USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[PolicyTrans]    Script Date: 10.11.2022 13:58:51 ******/
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
	[TermNum] [int] NOT NULL,
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
	[IsPremWaivedInd] [char](1) NULL,
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
	[PendingAndPriorLitigationDate] [varchar](255) NULL,
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
ALTER TABLE [Policy].[PolicyTrans]  WITH CHECK ADD  CONSTRAINT [FK_BaseCurrencySK_PolicyTrans] FOREIGN KEY([BaseCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[PolicyTrans] CHECK CONSTRAINT [FK_BaseCurrencySK_PolicyTrans]
GO
ALTER TABLE [Policy].[PolicyTrans]  WITH CHECK ADD  CONSTRAINT [FK_BusinessTypeSK_PolicyTrans] FOREIGN KEY([BusinessTypeSK])
REFERENCES [TypeList].[BusinessType] ([BusinessTypeSK])
GO
ALTER TABLE [Policy].[PolicyTrans] CHECK CONSTRAINT [FK_BusinessTypeSK_PolicyTrans]
GO
ALTER TABLE [Policy].[PolicyTrans]  WITH CHECK ADD  CONSTRAINT [FK_BusinessUnitSK_PolicyTrans] FOREIGN KEY([BusinessUnitSK])
REFERENCES [TypeList].[BusinessUnit] ([BusinessUnitSK])
GO
ALTER TABLE [Policy].[PolicyTrans] CHECK CONSTRAINT [FK_BusinessUnitSK_PolicyTrans]
GO
ALTER TABLE [Policy].[PolicyTrans]  WITH CHECK ADD  CONSTRAINT [FK_CoverageTriggerSK_PolicyTrans] FOREIGN KEY([CoverageTriggerSK])
REFERENCES [TypeList].[CoverageTrigger] ([CoverageTriggerSK])
GO
ALTER TABLE [Policy].[PolicyTrans] CHECK CONSTRAINT [FK_CoverageTriggerSK_PolicyTrans]
GO
ALTER TABLE [Policy].[PolicyTrans]  WITH CHECK ADD  CONSTRAINT [FK_DomicileCountrySK_PolicyTrans] FOREIGN KEY([DomicileCountrySK])
REFERENCES [TypeList].[Country] ([CountrySK])
GO
ALTER TABLE [Policy].[PolicyTrans] CHECK CONSTRAINT [FK_DomicileCountrySK_PolicyTrans]
GO
ALTER TABLE [Policy].[PolicyTrans]  WITH CHECK ADD  CONSTRAINT [FK_DomicileStateSK_PolicyTrans] FOREIGN KEY([DomicileStateSK])
REFERENCES [TypeList].[State] ([StateSK])
GO
ALTER TABLE [Policy].[PolicyTrans] CHECK CONSTRAINT [FK_DomicileStateSK_PolicyTrans]
GO
ALTER TABLE [Policy].[PolicyTrans]  WITH CHECK ADD  CONSTRAINT [FK_NorthAmericanIndustryClassificationSK_PolicyTrans] FOREIGN KEY([NorthAmericanIndustryClassificationSK])
REFERENCES [TypeList].[NorthAmericanIndustryClassification] ([NorthAmericanIndustryClassificationSK])
GO
ALTER TABLE [Policy].[PolicyTrans] CHECK CONSTRAINT [FK_NorthAmericanIndustryClassificationSK_PolicyTrans]
GO
ALTER TABLE [Policy].[PolicyTrans]  WITH CHECK ADD  CONSTRAINT [FK_OriginalCurrencySK_PolicyTrans] FOREIGN KEY([OriginalCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[PolicyTrans] CHECK CONSTRAINT [FK_OriginalCurrencySK_PolicyTrans]
GO
ALTER TABLE [Policy].[PolicyTrans]  WITH CHECK ADD  CONSTRAINT [FK_PolicySK_PolicyTrans] FOREIGN KEY([PolicySK])
REFERENCES [Policy].[Policy] ([PolicySK])
GO
ALTER TABLE [Policy].[PolicyTrans] CHECK CONSTRAINT [FK_PolicySK_PolicyTrans]
GO
ALTER TABLE [Policy].[PolicyTrans]  WITH CHECK ADD  CONSTRAINT [FK_PolicyTransStatusSK_PolicyTrans] FOREIGN KEY([PolicyTransStatusSK])
REFERENCES [TypeList].[PolicyStatus] ([PolicyStatusSK])
GO
ALTER TABLE [Policy].[PolicyTrans] CHECK CONSTRAINT [FK_PolicyTransStatusSK_PolicyTrans]
GO
ALTER TABLE [Policy].[PolicyTrans]  WITH CHECK ADD  CONSTRAINT [FK_PolicyTransTypeSK_PolicyTrans] FOREIGN KEY([PolicyTransTypeSK])
REFERENCES [TypeList].[PolicyTransType] ([PolicyTransTypeSK])
GO
ALTER TABLE [Policy].[PolicyTrans] CHECK CONSTRAINT [FK_PolicyTransTypeSK_PolicyTrans]
GO
ALTER TABLE [Policy].[PolicyTrans]  WITH CHECK ADD  CONSTRAINT [FK_ProfessionSK_PolicyTrans] FOREIGN KEY([ProfessionSK])
REFERENCES [TypeList].[Profession] ([ProfessionSK])
GO
ALTER TABLE [Policy].[PolicyTrans] CHECK CONSTRAINT [FK_ProfessionSK_PolicyTrans]
GO
ALTER TABLE [Policy].[PolicyTrans]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypeSK_PolicyTrans] FOREIGN KEY([ProjectTypeSK])
REFERENCES [TypeList].[ProjectType] ([ProjectTypeSK])
GO
ALTER TABLE [Policy].[PolicyTrans] CHECK CONSTRAINT [FK_ProjectTypeSK_PolicyTrans]
GO
ALTER TABLE [Policy].[PolicyTrans]  WITH CHECK ADD  CONSTRAINT [FK_ReportingCurrencySK_PolicyTrans] FOREIGN KEY([ReportingCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[PolicyTrans] CHECK CONSTRAINT [FK_ReportingCurrencySK_PolicyTrans]
GO
ALTER TABLE [Policy].[PolicyTrans]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyTrans] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[PolicyTrans] CHECK CONSTRAINT [FK_SourceSystemSK_PolicyTrans]
GO
ALTER TABLE [Policy].[PolicyTrans]  WITH CHECK ADD  CONSTRAINT [FK_StandardIndustryCodeSK_PolicyTrans] FOREIGN KEY([StandardIndustryCodeSK])
REFERENCES [TypeList].[StandardIndustryCode] ([StandardIndustryCodeSK])
GO
ALTER TABLE [Policy].[PolicyTrans] CHECK CONSTRAINT [FK_StandardIndustryCodeSK_PolicyTrans]
GO
ALTER TABLE [Policy].[PolicyTrans]  WITH CHECK ADD  CONSTRAINT [FK_UnderwritingStatusPolicyT272] FOREIGN KEY([UnderwritingStatusSK])
REFERENCES [TypeList].[UnderwritingStatus] ([UnderwritingStatusSK])
GO
ALTER TABLE [Policy].[PolicyTrans] CHECK CONSTRAINT [FK_UnderwritingStatusPolicyT272]
GO
ALTER TABLE [Policy].[PolicyTrans]  WITH CHECK ADD  CONSTRAINT [FK_UnderwritingStatusSK_PolicyTrans] FOREIGN KEY([UnderwritingStatusSK])
REFERENCES [TypeList].[UnderwritingStatus] ([UnderwritingStatusSK])
GO
ALTER TABLE [Policy].[PolicyTrans] CHECK CONSTRAINT [FK_UnderwritingStatusSK_PolicyTrans]
GO
ALTER TABLE [Policy].[PolicyTrans]  WITH CHECK ADD  CONSTRAINT [FK_WritingCompanySK_PolicyTrans] FOREIGN KEY([WritingCompanySK])
REFERENCES [Party].[WritingCompany] ([WritingCompanySK])
GO
ALTER TABLE [Policy].[PolicyTrans] CHECK CONSTRAINT [FK_WritingCompanySK_PolicyTrans]
GO
