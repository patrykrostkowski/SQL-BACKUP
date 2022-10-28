USE [sqldb-ods-dev]
GO
/****** Object:  Table [Finance].[QuoteFinancialTransactionSummary]    Script Date: 28.10.2022 11:09:44 ******/
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
	[FinancialSourceTransactionTypeSK] [int] NOT NULL,
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
	[FinancialSourceTransactionTypeSK] ASC,
	[TransactionLevelSK] ASC,
	[EffectiveDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_QuoteFinancialTransactionSummary]    Script Date: 28.10.2022 11:11:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_QuoteFinancialTransactionSummary] ON [Finance].[QuoteFinancialTransactionSummary]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_BaseCurrencySK_QuoteFinancialTransactionSummary] FOREIGN KEY([BaseCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary] NOCHECK CONSTRAINT [FK_BaseCurrencySK_QuoteFinancialTransactionSummary]
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteCoverageSK_QuoteFinancialTransactionSummary] FOREIGN KEY([QuoteCoverageSK])
REFERENCES [PreBind].[QuoteCoverage] ([QuoteCoverageSK])
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary] NOCHECK CONSTRAINT [FK_QuoteCoverageSK_QuoteFinancialTransactionSummary]
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteGeographySK_QuoteFinancialTransactionSummary] FOREIGN KEY([QuoteGeographySK])
REFERENCES [PreBind].[QuoteGeography] ([QuoteGeographySK])
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary] NOCHECK CONSTRAINT [FK_QuoteGeographySK_QuoteFinancialTransactionSummary]
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteLifecycleTypeSK_QuoteFinancialTransactionSummary] FOREIGN KEY([QuoteLifecycleTypeSK])
REFERENCES [Typelist].[QuoteLifecycleType] ([QuoteLifecycleTypeSK])
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary] NOCHECK CONSTRAINT [FK_QuoteLifecycleTypeSK_QuoteFinancialTransactionSummary]
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteLineofBusinessSK_QuoteFinancialTransactionSummary] FOREIGN KEY([QuoteLineofBusinessSK])
REFERENCES [PreBind].[QuoteLineofBusiness] ([QuoteLineofBusinessSK])
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary] NOCHECK CONSTRAINT [FK_QuoteLineofBusinessSK_QuoteFinancialTransactionSummary]
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteSK_QuoteFinancialTransactionSummary] FOREIGN KEY([QuoteSK])
REFERENCES [PreBind].[Quote] ([QuoteSK])
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary] NOCHECK CONSTRAINT [FK_QuoteSK_QuoteFinancialTransactionSummary]
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteTransSK_QuoteFinancialTransactionSummary] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary] NOCHECK CONSTRAINT [FK_QuoteTransSK_QuoteFinancialTransactionSummary]
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteFinancialTransactionSummary] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary] NOCHECK CONSTRAINT [FK_SourceSystemSK_QuoteFinancialTransactionSummary]
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_TransactionTypeSK_QuoteFinancialTransactionSummary] FOREIGN KEY([FinancialSourceTransactionTypeSK])
REFERENCES [Typelist].[FinancialSourceTransactionType] ([FinancialSourceTransactionTypeSK])
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary] NOCHECK CONSTRAINT [FK_TransactionTypeSK_QuoteFinancialTransactionSummary]
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_UnderwritingStatusSK_QuoteFinancialTransactionSummary] FOREIGN KEY([UnderwritingStatusSK])
REFERENCES [Typelist].[UnderwritingStatus] ([UnderwritingStatusSK])
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary] NOCHECK CONSTRAINT [FK_UnderwritingStatusSK_QuoteFinancialTransactionSummary]
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_WritingCompanySK_QuoteFinancialTransactionSummary] FOREIGN KEY([WritingCompanySK])
REFERENCES [Party].[WritingCompany] ([WritingCompanySK])
GO
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary] NOCHECK CONSTRAINT [FK_WritingCompanySK_QuoteFinancialTransactionSummary]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quote Financial Transaction.  This may be derived based on the quote domain' , @level0type=N'SCHEMA',@level0name=N'Finance', @level1type=N'TABLE',@level1name=N'QuoteFinancialTransactionSummary'
GO
