USE [DataMagnifier]
GO
/****** Object:  Table [Finance].[QuoteFinancialTransactionSummary]    Script Date: 02.11.2022 09:12:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Finance].[QuoteFinancialTransactionSummary](
	[QuoteFinancialTransactionSummarySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteSK] [int] NOT NULL,
	[QuoteTransSK] [int] NOT NULL,
	[QuoteLifecycleTypeSK] [int] NULL,
	[QuoteLifecycleTypeCode] [varchar](20) NULL,
	[UnderwritingStatusSK] [int] NULL,
	[WritingCompanySK] [int] NOT NULL,
	[BaseCurrencySK] [int] NOT NULL,
	[QuoteLineofBusinessSK] [int] NOT NULL,
	[QuoteGeographySK] [int] NULL,
	[QuoteCoverageSK] [int] NULL,
	[TransactionLevelSK] [int] NOT NULL,
	[TransactionTypeSK] [int] NOT NULL,
	[TransactionBaseAmt] [decimal](19, 4) NOT NULL,
	[EffectiveDate] [date] NULL,
	[ExpirationDate] [date] NULL,
	[WrittenDate] [date] NULL,
 CONSTRAINT [PK_QuoteFinancialTransactionSummary] PRIMARY KEY CLUSTERED 
(
	[QuoteFinancialTransactionSummarySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[SourceCode] ASC,
	[QuoteSK] ASC,
	[QuoteTransSK] ASC,
	[TransactionTypeSK] ASC,
	[TransactionLevelSK] ASC,
	[EffectiveDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary]  WITH CHECK ADD  CONSTRAINT [FK_BaseCurrencySK_QuoteFinancialTransactionSummary] FOREIGN KEY([BaseCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary] CHECK CONSTRAINT [FK_BaseCurrencySK_QuoteFinancialTransactionSummary]
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteCoverageSK_QuoteFinancialTransactionSummary] FOREIGN KEY([QuoteCoverageSK])
REFERENCES [PreBind].[QuoteCoverage] ([QuoteCoverageSK])
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary] NOCHECK CONSTRAINT [FK_QuoteCoverageSK_QuoteFinancialTransactionSummary]
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary]  WITH CHECK ADD  CONSTRAINT [FK_QuoteGeographySK_QuoteFinancialTransactionSummary] FOREIGN KEY([QuoteGeographySK])
REFERENCES [PreBind].[QuoteGeography] ([QuoteGeographySK])
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary] CHECK CONSTRAINT [FK_QuoteGeographySK_QuoteFinancialTransactionSummary]
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary]  WITH CHECK ADD  CONSTRAINT [FK_QuoteLifecycleTypeSK_QuoteFinancialTransactionSummary] FOREIGN KEY([QuoteLifecycleTypeSK])
REFERENCES [TypeList].[QuoteLifecycleType] ([QuoteLifecycleTypeSK])
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary] CHECK CONSTRAINT [FK_QuoteLifecycleTypeSK_QuoteFinancialTransactionSummary]
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary]  WITH CHECK ADD  CONSTRAINT [FK_QuoteLineofBusinessSK_QuoteFinancialTransactionSummary] FOREIGN KEY([QuoteLineofBusinessSK])
REFERENCES [PreBind].[QuoteLineofBusiness] ([QuoteLineofBusinessSK])
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary] CHECK CONSTRAINT [FK_QuoteLineofBusinessSK_QuoteFinancialTransactionSummary]
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary]  WITH CHECK ADD  CONSTRAINT [FK_QuoteSK_QuoteFinancialTransactionSummary] FOREIGN KEY([QuoteSK])
REFERENCES [PreBind].[Quote] ([QuoteSK])
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary] CHECK CONSTRAINT [FK_QuoteSK_QuoteFinancialTransactionSummary]
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteTransSK_QuoteFinancialTransactionSummary] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary] NOCHECK CONSTRAINT [FK_QuoteTransSK_QuoteFinancialTransactionSummary]
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteFinancialTransactionSummary] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteFinancialTransactionSummary]
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary]  WITH CHECK ADD  CONSTRAINT [FK_TransactionTypeSK_QuoteFinancialTransactionSummary] FOREIGN KEY([TransactionTypeSK])
REFERENCES [TypeList].[TransactionType] ([TransactionTypeSK])
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary] CHECK CONSTRAINT [FK_TransactionTypeSK_QuoteFinancialTransactionSummary]
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary]  WITH CHECK ADD  CONSTRAINT [FK_UnderwritingStatusSK_QuoteFinancialTransactionSummary] FOREIGN KEY([UnderwritingStatusSK])
REFERENCES [TypeList].[UnderwritingStatus] ([UnderwritingStatusSK])
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary] CHECK CONSTRAINT [FK_UnderwritingStatusSK_QuoteFinancialTransactionSummary]
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary]  WITH CHECK ADD  CONSTRAINT [FK_WritingCompanySK_QuoteFinancialTransactionSummary] FOREIGN KEY([WritingCompanySK])
REFERENCES [Party].[WritingCompany] ([WritingCompanySK])
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary] CHECK CONSTRAINT [FK_WritingCompanySK_QuoteFinancialTransactionSummary]
GO
