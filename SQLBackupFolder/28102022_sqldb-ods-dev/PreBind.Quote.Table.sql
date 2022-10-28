USE [sqldb-ods-dev]
GO
/****** Object:  Table [PreBind].[Quote]    Script Date: 28.10.2022 13:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[Quote](
	[QuoteSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteNum] [varchar](60) NOT NULL,
	[QuoteVersionNum] [varchar](20) NULL,
	[PolicyNum] [varchar](20) NULL,
	[CreateDateTime] [datetime] NOT NULL,
	[IssuedPolicySK] [int] NULL,
	[QuotedInsuredSK] [int] NULL,
	[QuoteAccountSK] [int] NULL,
	[WritingCompanySK] [int] NOT NULL,
	[AgencySK] [int] NULL,
	[CommissionRate] [decimal](20, 4) NULL,
	[MaxCommissionRate] [decimal](20, 4) NULL,
	[IsSubmittionInd] [tinyint] NULL,
	[ProductSK] [int] NULL,
	[RetroactiveDate] [date] NULL,
	[QuoteTotalInsuredValueAmt] [decimal](28, 6) NULL,
	[UnderwritingStatusSK] [int] NULL,
	[LastStatusUpdateDate] [date] NULL,
	[IsTerrorismIncludedInd] [tinyint] NULL,
	[TerrorismRate] [decimal](20, 4) NULL,
	[IsDefenseIncludedInd] [tinyint] NULL,
	[IsFutureProspectInd] [tinyint] NULL,
	[IsDelegatedAuthorityInd] [tinyint] NULL,
	[IsPremiumBearingInd] [tinyint] NULL,
	[IsRiskBordereaxProvidedInd] [tinyint] NULL,
	[IsPaidPremiumBordereauxProvidedInd] [tinyint] NULL,
	[IsClaimBordereauxProvidedInd] [tinyint] NULL,
	[BusinessChannelName] [varchar](256) NULL,
	[ClassOfBusinessName] [varchar](250) NULL,
	[DelegatedAuthorityName] [varchar](250) NULL,
	[DirectAssumedSK] [int] NOT NULL,
	[NorthAmericanIndustryClassificationSK] [int] NULL,
	[StandardIndustryCodeSK] [int] NULL,
	[BaseCurrencySK] [int] NOT NULL,
	[WrittenPremiumBaseAmt] [decimal](19, 4) NULL,
	[AnnualPremiumBaseAmt] [decimal](19, 4) NULL,
	[TermPremiumBaseAmt] [decimal](19, 4) NULL,
 CONSTRAINT [PK_Quote] PRIMARY KEY CLUSTERED 
(
	[QuoteSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[QuoteNum] ASC,
	[QuoteVersionNum] ASC,
	[SourceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_Quote]    Script Date: 28.10.2022 13:37:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_Quote] ON [PreBind].[Quote]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[Quote]  WITH NOCHECK ADD  CONSTRAINT [FK_AgencySK_Quote] FOREIGN KEY([AgencySK])
REFERENCES [Party].[Agency] ([AgencySK])
GO
ALTER TABLE [PreBind].[Quote] NOCHECK CONSTRAINT [FK_AgencySK_Quote]
GO
ALTER TABLE [PreBind].[Quote]  WITH NOCHECK ADD  CONSTRAINT [FK_BaseCurrencySK_Quote] FOREIGN KEY([BaseCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [PreBind].[Quote] NOCHECK CONSTRAINT [FK_BaseCurrencySK_Quote]
GO
ALTER TABLE [PreBind].[Quote]  WITH NOCHECK ADD  CONSTRAINT [FK_DirectAssumedSK_Quote] FOREIGN KEY([DirectAssumedSK])
REFERENCES [Typelist].[DirectAssumed] ([DirectAssumedSK])
GO
ALTER TABLE [PreBind].[Quote] NOCHECK CONSTRAINT [FK_DirectAssumedSK_Quote]
GO
ALTER TABLE [PreBind].[Quote]  WITH NOCHECK ADD  CONSTRAINT [FK_NorthAmericanIndustryClassificationSK_Quote] FOREIGN KEY([NorthAmericanIndustryClassificationSK])
REFERENCES [Typelist].[NorthAmericanIndustryClassification] ([NorthAmericanIndustryClassificationSK])
GO
ALTER TABLE [PreBind].[Quote] NOCHECK CONSTRAINT [FK_NorthAmericanIndustryClassificationSK_Quote]
GO
ALTER TABLE [PreBind].[Quote]  WITH NOCHECK ADD  CONSTRAINT [FK_ProductSK_Quote] FOREIGN KEY([ProductSK])
REFERENCES [Typelist].[Product] ([ProductSK])
GO
ALTER TABLE [PreBind].[Quote] NOCHECK CONSTRAINT [FK_ProductSK_Quote]
GO
ALTER TABLE [PreBind].[Quote]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteAccountSK_Quote] FOREIGN KEY([QuoteAccountSK])
REFERENCES [Party].[Account] ([AccountSK])
GO
ALTER TABLE [PreBind].[Quote] NOCHECK CONSTRAINT [FK_QuoteAccountSK_Quote]
GO
ALTER TABLE [PreBind].[Quote]  WITH NOCHECK ADD  CONSTRAINT [FK_QuotedInsuredSK_Quote] FOREIGN KEY([QuotedInsuredSK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [PreBind].[Quote] NOCHECK CONSTRAINT [FK_QuotedInsuredSK_Quote]
GO
ALTER TABLE [PreBind].[Quote]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_Quote] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[Quote] NOCHECK CONSTRAINT [FK_SourceSystemSK_Quote]
GO
ALTER TABLE [PreBind].[Quote]  WITH NOCHECK ADD  CONSTRAINT [FK_StandardIndustryCodeSK_Quote] FOREIGN KEY([StandardIndustryCodeSK])
REFERENCES [Typelist].[StandardIndustryCode] ([StandardIndustryCodeSK])
GO
ALTER TABLE [PreBind].[Quote] NOCHECK CONSTRAINT [FK_StandardIndustryCodeSK_Quote]
GO
ALTER TABLE [PreBind].[Quote]  WITH NOCHECK ADD  CONSTRAINT [FK_UnderwritingStatusSK_Quote] FOREIGN KEY([UnderwritingStatusSK])
REFERENCES [Typelist].[UnderwritingStatus] ([UnderwritingStatusSK])
GO
ALTER TABLE [PreBind].[Quote] NOCHECK CONSTRAINT [FK_UnderwritingStatusSK_Quote]
GO
ALTER TABLE [PreBind].[Quote]  WITH NOCHECK ADD  CONSTRAINT [FK_WritingCompanySK_Quote] FOREIGN KEY([WritingCompanySK])
REFERENCES [Party].[WritingCompany] ([WritingCompanySK])
GO
ALTER TABLE [PreBind].[Quote] NOCHECK CONSTRAINT [FK_WritingCompanySK_Quote]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The information of the quotation request is mainly contained in the related contract elements.Using this quotation 
request and its related elements one will get a quotation of the future insurance contract.' , @level0type=N'SCHEMA',@level0name=N'PreBind', @level1type=N'TABLE',@level1name=N'Quote'
GO
