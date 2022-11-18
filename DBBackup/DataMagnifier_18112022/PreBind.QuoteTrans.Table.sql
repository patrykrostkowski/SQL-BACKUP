USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteTrans]    Script Date: 18.11.2022 16:40:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteTrans](
	[QuoteTransSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteSK] [int] NOT NULL,
	[PolicyNum] [varchar](60) NULL,
	[LegacyPolicyNum] [varchar](20) NULL,
	[TermNum] [int] NULL,
	[QuoteVersionNum] [varchar](20) NOT NULL,
	[QuoteVersionName] [varchar](60) NULL,
	[OriginalQuoteNum] [varchar](256) NULL,
	[BrokerQuoteNum] [varchar](256) NULL,
	[AgencySK] [int] NULL,
	[QuoteInsuredSK] [int] NULL,
	[InsuredName] [varchar](256) NULL,
	[QuotedDate] [date] NULL,
	[UnderwritingStatusSK] [int] NOT NULL,
	[StampReferenceNum] [varchar](25) NULL,
	[UniqueMarketReferenceNum] [varchar](40) NULL,
	[SRAIDNum] [varchar](6) NULL,
	[DaysNoticeOfCancellationNum] [int] NULL,
	[QuoteLifecycleTypeSK] [int] NULL,
	[BillTypeSK] [int] NULL,
	[PricingLevelSK] [int] NULL,
	[BusinessUnitSK] [int] NULL,
	[UnderwriterSK] [int] NOT NULL,
	[ProgramSK] [int] NULL,
	[LineSlipSK] [int] NULL,
	[StandardIndustryCodeSK] [int] NULL,
	[NorthAmericanIndustryClassificationSK] [int] NULL,
	[ProjectTypeSK] [int] NULL,
	[ClassCodeSK] [int] NULL,
	[DirectAssumedSK] [int] NOT NULL,
	[WritingCompanySK] [int] NOT NULL,
	[LeadFollowCode] [varchar](25) NULL,
	[PartnerandPartnershipNum] [int] NULL,
	[DomicileStateSK] [int] NOT NULL,
	[DomicileCountrySK] [int] NULL,
	[DomicileTerritoryCode] [varchar](25) NULL,
	[AttachmentTypeSK] [int] NULL,
	[QuoteTransStartDatetime] [datetime] NOT NULL,
	[QuoteTransEndDatetime] [datetime] NULL,
	[QuoteEffectiveDate] [date] NOT NULL,
	[QuoteExpirationDate] [date] NULL,
	[QuoteEditEffectiveDate] [date] NULL,
	[CustomExpirationDate] [date] NULL,
	[QuoteRateAsofDate] [date] NULL,
	[NextRenewalCheckDate] [date] NULL,
	[SlipInDate] [date] NULL,
	[RunoffERPDate] [date] NULL,
	[QuoteClearedDate] [date] NULL,
	[QuoteReceivedDate] [date] NULL,
	[RetroActiveDate] [date] NULL,
	[PrimaryInsuredName] [varchar](255) NOT NULL,
	[ProjectName] [varchar](255) NULL,
	[LeadCarrierName] [varchar](255) NULL,
	[TreatyOrReferralAppliesDesc] [varchar](64) NULL,
	[NYFreeTradeZoneClassCode] [varchar](255) NULL,
	[UltimateLossRatioPct] [decimal](8, 2) NULL,
	[RevisedUltimateLossRatioPct] [decimal](8, 2) NULL,
	[PercentOfTechnicalPricePct] [decimal](8, 2) NULL,
	[PremiumChangePct] [decimal](8, 2) NULL,
	[DeductionsAttachmentsChangePct] [decimal](8, 2) NULL,
	[CoverageChangePct] [decimal](8, 2) NULL,
	[ExposureChangePct] [decimal](8, 2) NULL,
	[RenewalPriceIndexPct] [decimal](8, 2) NULL,
	[WrittenLinePct] [decimal](8, 2) NULL,
	[SignedLinePct] [decimal](8, 2) NULL,
	[OrderPct] [decimal](8, 2) NULL,
	[PremiumAllocationPct] [decimal](8, 2) NULL,
	[MinimumEarnedPremiumPct] [decimal](8, 2) NULL,
	[PolicyERCPct] [decimal](8, 2) NULL,
	[BaseCurrencySK] [int] NOT NULL,
	[EstWrittenPremiumBaseAmt] [decimal](19, 4) NULL,
	[TermPremiumBaseAmt] [decimal](19, 4) NULL,
	[AddressTypeSK] [int] NULL,
	[QuoteLine1Address] [varchar](255) NULL,
	[QuoteLine2Address] [varchar](255) NULL,
	[QuoteLine3Address] [varchar](255) NULL,
	[QuoteLine4Address] [varchar](255) NULL,
	[QuotePostalCode] [varchar](60) NULL,
	[QuoteStateSK] [int] NOT NULL,
	[QuoteCityName] [varchar](60) NULL,
	[QuoteCountrySK] [int] NULL,
	[IsQuotedInd] [int] NULL,
	[IsGRSQuoteInd] [tinyint] NULL,
	[IsTransportationPolicyInd] [tinyint] NULL,
	[IsRenewalPriceIndexDataInd] [tinyint] NULL,
	[IsPolicyEffectiveDateProposedInd] [tinyint] NULL,
	[IsPolicyEffectiveDateTBDInd] [tinyint] NULL,
	[IsPolicyExpirationDateProposedInd] [tinyint] NULL,
	[IsPolicyExpirationDateTBDInd] [tinyint] NULL,
	[IsProjectPolicyInd] [tinyint] NULL,
	[IsFacReinsurancePurchasedInd] [tinyint] NULL,
	[IsSlipInInd] [tinyint] NULL,
	[IsNYFreeTradeZoneInd] [tinyint] NULL,
	[IsPolicyTrackAsNonRecurringPremiumInd] [tinyint] NULL,
	[IsMiddleMarketPolicyInd] [tinyint] NULL,
	[IsRunoffERPInd] [tinyint] NULL,
	[IsFirmOrderNotedInd] [tinyint] NULL,
	[IsPremiumAuditableInd] [tinyint] NULL,
	[IsFacultativeEquipmentBreakdownInd] [tinyint] NULL,
	[IsEquipmentBreakdownPremiumIncludedInd] [tinyint] NULL,
	[IsQuoteClearedInd] [tinyint] NULL,
	[IsIndicationprovidedInd] [tinyint] NULL,
	[RegisteredDate] [date] NULL,
	[IssuedDate] [date] NULL,
	[BoundDate] [date] NULL,
	[ClosedDate] [date] NULL,
	[IsAdmittedInd] [int] NULL,
	[NewRenewalCode] [varchar](20) NULL,
	[IsComboPolicyInd] [tinyint] NULL,
	[OwnershipTypeSK] [int] NULL,
	[IsAdmittedDeregInd] [tinyint] NULL,
	[QuotaShareAppliesInd] [tinyint] NULL,
	[IsSharedLimitInd] [tinyint] NULL,
	[PendingAndPriorLitigationDate] [varchar](255) NULL,
	[IsTRIAOfferedInd] [tinyint] NULL,
	[IsFortune500CompanyInd] [tinyint] NULL,
	[SpecialInterestSK] [int] NULL,
	[IsPolicyFileCompleteInd] [tinyint] NULL,
	[BusinessChannelName] [varchar](256) NULL,
	[ClassofBusinessCode] [varchar](20) NULL,
	[IsBureauInd] [tinyint] NULL,
	[IsDeclarationPremBearingInd] [tinyint] NULL,
	[IsRiskBordereauProvidedInd] [tinyint] NULL,
	[IsClaimBordereauProvidedInd] [tinyint] NULL,
	[IsPaidPremiumBordereauProvidedInd] [tinyint] NULL,
	[IsFrontedInd] [tinyint] NULL,
	[IsCombinedPackageInd] [tinyint] NULL,
	[PlacementDesc] [varchar](256) NULL,
 CONSTRAINT [PK_QuoteTrans] PRIMARY KEY CLUSTERED 
(
	[QuoteTransSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteTrans]  WITH CHECK ADD  CONSTRAINT [FK_AddressTypeSK_QuoteTrans] FOREIGN KEY([AddressTypeSK])
REFERENCES [TypeList].[AddressType] ([AddressTypeSK])
GO
ALTER TABLE [PreBind].[QuoteTrans] CHECK CONSTRAINT [FK_AddressTypeSK_QuoteTrans]
GO
ALTER TABLE [PreBind].[QuoteTrans]  WITH CHECK ADD  CONSTRAINT [FK_AgencySK_QuoteTrans] FOREIGN KEY([AgencySK])
REFERENCES [Party].[Agency] ([AgencySK])
GO
ALTER TABLE [PreBind].[QuoteTrans] CHECK CONSTRAINT [FK_AgencySK_QuoteTrans]
GO
ALTER TABLE [PreBind].[QuoteTrans]  WITH CHECK ADD  CONSTRAINT [FK_BaseCurrencySK_QuoteTrans] FOREIGN KEY([BaseCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [PreBind].[QuoteTrans] CHECK CONSTRAINT [FK_BaseCurrencySK_QuoteTrans]
GO
ALTER TABLE [PreBind].[QuoteTrans]  WITH CHECK ADD  CONSTRAINT [FK_BillTypeSK_QuoteTrans] FOREIGN KEY([BillTypeSK])
REFERENCES [TypeList].[BillType] ([BillTypeSK])
GO
ALTER TABLE [PreBind].[QuoteTrans] CHECK CONSTRAINT [FK_BillTypeSK_QuoteTrans]
GO
ALTER TABLE [PreBind].[QuoteTrans]  WITH CHECK ADD  CONSTRAINT [FK_BusinessUnitSK_QuoteTrans] FOREIGN KEY([BusinessUnitSK])
REFERENCES [TypeList].[BusinessUnit] ([BusinessUnitSK])
GO
ALTER TABLE [PreBind].[QuoteTrans] CHECK CONSTRAINT [FK_BusinessUnitSK_QuoteTrans]
GO
ALTER TABLE [PreBind].[QuoteTrans]  WITH CHECK ADD  CONSTRAINT [FK_ClassCodeSK_QuoteTrans] FOREIGN KEY([ClassCodeSK])
REFERENCES [TypeList].[ClassCode] ([ClassCodeSK])
GO
ALTER TABLE [PreBind].[QuoteTrans] CHECK CONSTRAINT [FK_ClassCodeSK_QuoteTrans]
GO
ALTER TABLE [PreBind].[QuoteTrans]  WITH CHECK ADD  CONSTRAINT [FK_DirectAssumedSK_QuoteTrans] FOREIGN KEY([DirectAssumedSK])
REFERENCES [TypeList].[DirectAssumed] ([DirectAssumedSK])
GO
ALTER TABLE [PreBind].[QuoteTrans] CHECK CONSTRAINT [FK_DirectAssumedSK_QuoteTrans]
GO
ALTER TABLE [PreBind].[QuoteTrans]  WITH CHECK ADD  CONSTRAINT [FK_DomicileCountrySK_QuoteTrans] FOREIGN KEY([DomicileCountrySK])
REFERENCES [TypeList].[Country] ([CountrySK])
GO
ALTER TABLE [PreBind].[QuoteTrans] CHECK CONSTRAINT [FK_DomicileCountrySK_QuoteTrans]
GO
ALTER TABLE [PreBind].[QuoteTrans]  WITH CHECK ADD  CONSTRAINT [FK_DomicileStateSK_QuoteTrans] FOREIGN KEY([DomicileStateSK])
REFERENCES [TypeList].[State] ([StateSK])
GO
ALTER TABLE [PreBind].[QuoteTrans] CHECK CONSTRAINT [FK_DomicileStateSK_QuoteTrans]
GO
ALTER TABLE [PreBind].[QuoteTrans]  WITH CHECK ADD  CONSTRAINT [FK_LineSlipSK_QuoteTrans] FOREIGN KEY([LineSlipSK])
REFERENCES [TypeList].[LineSlip] ([LineSlipSK])
GO
ALTER TABLE [PreBind].[QuoteTrans] CHECK CONSTRAINT [FK_LineSlipSK_QuoteTrans]
GO
ALTER TABLE [PreBind].[QuoteTrans]  WITH CHECK ADD  CONSTRAINT [FK_NorthAmericanIndustryClassificationSK_QuoteTrans] FOREIGN KEY([NorthAmericanIndustryClassificationSK])
REFERENCES [TypeList].[NorthAmericanIndustryClassification] ([NorthAmericanIndustryClassificationSK])
GO
ALTER TABLE [PreBind].[QuoteTrans] CHECK CONSTRAINT [FK_NorthAmericanIndustryClassificationSK_QuoteTrans]
GO
ALTER TABLE [PreBind].[QuoteTrans]  WITH CHECK ADD  CONSTRAINT [FK_PricingLevelSK_QuoteTrans] FOREIGN KEY([PricingLevelSK])
REFERENCES [TypeList].[PricingLevel] ([PricingLevelSK])
GO
ALTER TABLE [PreBind].[QuoteTrans] CHECK CONSTRAINT [FK_PricingLevelSK_QuoteTrans]
GO
ALTER TABLE [PreBind].[QuoteTrans]  WITH CHECK ADD  CONSTRAINT [FK_ProgramSK_QuoteTrans] FOREIGN KEY([ProgramSK])
REFERENCES [Policy].[Program] ([ProgramSK])
GO
ALTER TABLE [PreBind].[QuoteTrans] CHECK CONSTRAINT [FK_ProgramSK_QuoteTrans]
GO
ALTER TABLE [PreBind].[QuoteTrans]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypeSK_QuoteTrans] FOREIGN KEY([ProjectTypeSK])
REFERENCES [TypeList].[ProjectType] ([ProjectTypeSK])
GO
ALTER TABLE [PreBind].[QuoteTrans] CHECK CONSTRAINT [FK_ProjectTypeSK_QuoteTrans]
GO
ALTER TABLE [PreBind].[QuoteTrans]  WITH CHECK ADD  CONSTRAINT [FK_QuoteInsuredSK_QuoteTrans] FOREIGN KEY([QuoteInsuredSK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [PreBind].[QuoteTrans] CHECK CONSTRAINT [FK_QuoteInsuredSK_QuoteTrans]
GO
ALTER TABLE [PreBind].[QuoteTrans]  WITH CHECK ADD  CONSTRAINT [FK_QuoteLifecycleTypeSK_QuoteTrans] FOREIGN KEY([QuoteLifecycleTypeSK])
REFERENCES [TypeList].[QuoteLifecycleType] ([QuoteLifecycleTypeSK])
GO
ALTER TABLE [PreBind].[QuoteTrans] CHECK CONSTRAINT [FK_QuoteLifecycleTypeSK_QuoteTrans]
GO
ALTER TABLE [PreBind].[QuoteTrans]  WITH CHECK ADD  CONSTRAINT [FK_QuoteSK_QuoteTrans] FOREIGN KEY([QuoteSK])
REFERENCES [PreBind].[Quote] ([QuoteSK])
GO
ALTER TABLE [PreBind].[QuoteTrans] CHECK CONSTRAINT [FK_QuoteSK_QuoteTrans]
GO
ALTER TABLE [PreBind].[QuoteTrans]  WITH CHECK ADD  CONSTRAINT [FK_QuoteStateSK_QuoteTrans] FOREIGN KEY([QuoteStateSK])
REFERENCES [TypeList].[State] ([StateSK])
GO
ALTER TABLE [PreBind].[QuoteTrans] CHECK CONSTRAINT [FK_QuoteStateSK_QuoteTrans]
GO
ALTER TABLE [PreBind].[QuoteTrans]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteTrans] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteTrans] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteTrans]
GO
ALTER TABLE [PreBind].[QuoteTrans]  WITH CHECK ADD  CONSTRAINT [FK_StandardIndustryCodeSK_QuoteTrans] FOREIGN KEY([StandardIndustryCodeSK])
REFERENCES [TypeList].[StandardIndustryCode] ([StandardIndustryCodeSK])
GO
ALTER TABLE [PreBind].[QuoteTrans] CHECK CONSTRAINT [FK_StandardIndustryCodeSK_QuoteTrans]
GO
ALTER TABLE [PreBind].[QuoteTrans]  WITH CHECK ADD  CONSTRAINT [FK_UnderwriterSK_QuoteTrans] FOREIGN KEY([UnderwriterSK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [PreBind].[QuoteTrans] CHECK CONSTRAINT [FK_UnderwriterSK_QuoteTrans]
GO
ALTER TABLE [PreBind].[QuoteTrans]  WITH CHECK ADD  CONSTRAINT [FK_UnderwritingStatusSK_QuoteTrans] FOREIGN KEY([UnderwritingStatusSK])
REFERENCES [TypeList].[UnderwritingStatus] ([UnderwritingStatusSK])
GO
ALTER TABLE [PreBind].[QuoteTrans] CHECK CONSTRAINT [FK_UnderwritingStatusSK_QuoteTrans]
GO
ALTER TABLE [PreBind].[QuoteTrans]  WITH CHECK ADD  CONSTRAINT [FK_WritingCompanySK_QuoteTrans] FOREIGN KEY([WritingCompanySK])
REFERENCES [Party].[WritingCompany] ([WritingCompanySK])
GO
ALTER TABLE [PreBind].[QuoteTrans] CHECK CONSTRAINT [FK_WritingCompanySK_QuoteTrans]
GO
