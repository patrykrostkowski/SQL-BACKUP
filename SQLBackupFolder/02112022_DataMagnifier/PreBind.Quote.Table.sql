﻿USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[Quote]    Script Date: 02.11.2022 12:55:53 ******/
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
ALTER TABLE [PreBind].[Quote]  WITH CHECK ADD  CONSTRAINT [FK_AgencySK_Quote] FOREIGN KEY([AgencySK])
REFERENCES [Party].[Agency] ([AgencySK])
GO
ALTER TABLE [PreBind].[Quote] CHECK CONSTRAINT [FK_AgencySK_Quote]
GO
ALTER TABLE [PreBind].[Quote]  WITH CHECK ADD  CONSTRAINT [FK_BaseCurrencySK_Quote] FOREIGN KEY([BaseCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [PreBind].[Quote] CHECK CONSTRAINT [FK_BaseCurrencySK_Quote]
GO
ALTER TABLE [PreBind].[Quote]  WITH CHECK ADD  CONSTRAINT [FK_DirectAssumedSK_Quote] FOREIGN KEY([DirectAssumedSK])
REFERENCES [TypeList].[DirectAssumed] ([DirectAssumedSK])
GO
ALTER TABLE [PreBind].[Quote] CHECK CONSTRAINT [FK_DirectAssumedSK_Quote]
GO
ALTER TABLE [PreBind].[Quote]  WITH CHECK ADD  CONSTRAINT [FK_NorthAmericanIndustryClassificationSK_Quote] FOREIGN KEY([NorthAmericanIndustryClassificationSK])
REFERENCES [TypeList].[NorthAmericanIndustryClassification] ([NorthAmericanIndustryClassificationSK])
GO
ALTER TABLE [PreBind].[Quote] CHECK CONSTRAINT [FK_NorthAmericanIndustryClassificationSK_Quote]
GO
ALTER TABLE [PreBind].[Quote]  WITH CHECK ADD  CONSTRAINT [FK_ProductSK_Quote] FOREIGN KEY([ProductSK])
REFERENCES [TypeList].[Product] ([ProductSK])
GO
ALTER TABLE [PreBind].[Quote] CHECK CONSTRAINT [FK_ProductSK_Quote]
GO
ALTER TABLE [PreBind].[Quote]  WITH CHECK ADD  CONSTRAINT [FK_QuoteAccountSK_Quote] FOREIGN KEY([QuoteAccountSK])
REFERENCES [Party].[Account] ([AccountSK])
GO
ALTER TABLE [PreBind].[Quote] CHECK CONSTRAINT [FK_QuoteAccountSK_Quote]
GO
ALTER TABLE [PreBind].[Quote]  WITH CHECK ADD  CONSTRAINT [FK_QuotedInsuredSK_Quote] FOREIGN KEY([QuotedInsuredSK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [PreBind].[Quote] CHECK CONSTRAINT [FK_QuotedInsuredSK_Quote]
GO
ALTER TABLE [PreBind].[Quote]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_Quote] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[Quote] CHECK CONSTRAINT [FK_SourceSystemSK_Quote]
GO
ALTER TABLE [PreBind].[Quote]  WITH CHECK ADD  CONSTRAINT [FK_StandardIndustryCodeSK_Quote] FOREIGN KEY([StandardIndustryCodeSK])
REFERENCES [TypeList].[StandardIndustryCode] ([StandardIndustryCodeSK])
GO
ALTER TABLE [PreBind].[Quote] CHECK CONSTRAINT [FK_StandardIndustryCodeSK_Quote]
GO
ALTER TABLE [PreBind].[Quote]  WITH CHECK ADD  CONSTRAINT [FK_UnderwritingStatusSK_Quote] FOREIGN KEY([UnderwritingStatusSK])
REFERENCES [TypeList].[UnderwritingStatus] ([UnderwritingStatusSK])
GO
ALTER TABLE [PreBind].[Quote] CHECK CONSTRAINT [FK_UnderwritingStatusSK_Quote]
GO
ALTER TABLE [PreBind].[Quote]  WITH CHECK ADD  CONSTRAINT [FK_WritingCompanySK_Quote] FOREIGN KEY([WritingCompanySK])
REFERENCES [Party].[WritingCompany] ([WritingCompanySK])
GO
ALTER TABLE [PreBind].[Quote] CHECK CONSTRAINT [FK_WritingCompanySK_Quote]
GO
