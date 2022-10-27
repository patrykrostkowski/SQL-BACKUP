USE [sqldb-ods-dev]
GO
/****** Object:  Table [Finance].[ReinsFinancialTransaction]    Script Date: 27.10.2022 12:26:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Finance].[ReinsFinancialTransaction](
	[ReinsFinancialTransactionSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](255) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[TreatySectionSK] [int] NULL,
	[ProfitAnalysisSK] [int] NULL,
	[ClassofBusinessSK] [int] NOT NULL,
	[LineofBusinessSK] [int] NOT NULL,
	[BaseCurrencySK] [int] NOT NULL,
	[CedingCompanySK] [int] NOT NULL,
	[SegmentCode] [varchar](20) NOT NULL,
	[GLAccountCode] [varchar](20) NOT NULL,
	[BusinessTypeCode] [varchar](20) NULL,
	[FinancialTransactionTypeSK] [int] NOT NULL,
	[TransactionBaseAmt] [decimal](18, 2) NULL,
	[TransactionDate] [date] NOT NULL,
	[PostingDate] [date] NOT NULL,
 CONSTRAINT [PK_TreatyFinancialTransaction] PRIMARY KEY CLUSTERED 
(
	[ReinsFinancialTransactionSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ClassofBusinessSK] ASC,
	[TransactionDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_ReinsFinancialTransaction]    Script Date: 27.10.2022 12:28:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_ReinsFinancialTransaction] ON [Finance].[ReinsFinancialTransaction]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Finance].[ReinsFinancialTransaction]  WITH NOCHECK ADD  CONSTRAINT [FK_BaseCurrencySK_TreatyFinancialTransaction] FOREIGN KEY([BaseCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[ReinsFinancialTransaction] NOCHECK CONSTRAINT [FK_BaseCurrencySK_TreatyFinancialTransaction]
GO
ALTER TABLE [Finance].[ReinsFinancialTransaction]  WITH NOCHECK ADD  CONSTRAINT [FK_CedingCompanySK_TreatyFinancialTransaction] FOREIGN KEY([CedingCompanySK])
REFERENCES [Party].[WritingCompany] ([WritingCompanySK])
GO
ALTER TABLE [Finance].[ReinsFinancialTransaction] NOCHECK CONSTRAINT [FK_CedingCompanySK_TreatyFinancialTransaction]
GO
ALTER TABLE [Finance].[ReinsFinancialTransaction]  WITH NOCHECK ADD  CONSTRAINT [FK_ClassofBusinessSK_TreatyFinancialTransaction] FOREIGN KEY([ClassofBusinessSK])
REFERENCES [Typelist].[ClassofBusiness] ([ClassofBusinessSK])
GO
ALTER TABLE [Finance].[ReinsFinancialTransaction] NOCHECK CONSTRAINT [FK_ClassofBusinessSK_TreatyFinancialTransaction]
GO
ALTER TABLE [Finance].[ReinsFinancialTransaction]  WITH NOCHECK ADD  CONSTRAINT [FK_LineofBusinessSK_TreatyFinancialTransaction] FOREIGN KEY([LineofBusinessSK])
REFERENCES [Typelist].[LineofBusiness] ([LineofBusinessSK])
GO
ALTER TABLE [Finance].[ReinsFinancialTransaction] NOCHECK CONSTRAINT [FK_LineofBusinessSK_TreatyFinancialTransaction]
GO
ALTER TABLE [Finance].[ReinsFinancialTransaction]  WITH NOCHECK ADD  CONSTRAINT [FK_ProfitAnalysisSK_TreatyFinancialTransaction] FOREIGN KEY([ProfitAnalysisSK])
REFERENCES [Typelist].[ProfitAnalysis] ([ProfitAnalysisSK])
GO
ALTER TABLE [Finance].[ReinsFinancialTransaction] NOCHECK CONSTRAINT [FK_ProfitAnalysisSK_TreatyFinancialTransaction]
GO
ALTER TABLE [Finance].[ReinsFinancialTransaction]  WITH NOCHECK ADD  CONSTRAINT [FK_RevenueCodeSK_TreatyFinancialTransaction] FOREIGN KEY([FinancialTransactionTypeSK])
REFERENCES [Typelist].[FinancialTransactionType] ([FinancialTransactionTypeSK])
GO
ALTER TABLE [Finance].[ReinsFinancialTransaction] NOCHECK CONSTRAINT [FK_RevenueCodeSK_TreatyFinancialTransaction]
GO
ALTER TABLE [Finance].[ReinsFinancialTransaction]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_TreatyFinancialTransaction] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Finance].[ReinsFinancialTransaction] NOCHECK CONSTRAINT [FK_SourceSystemSK_TreatyFinancialTransaction]
GO
ALTER TABLE [Finance].[ReinsFinancialTransaction]  WITH NOCHECK ADD  CONSTRAINT [FK_TreatySectionSK_TreatyFinancialTransaction] FOREIGN KEY([TreatySectionSK])
REFERENCES [Reins].[TreatySection] ([TreatySectionSK])
GO
ALTER TABLE [Finance].[ReinsFinancialTransaction] NOCHECK CONSTRAINT [FK_TreatySectionSK_TreatyFinancialTransaction]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Treaty Financial Transaction.  Usually sourced from a reinsurance application' , @level0type=N'SCHEMA',@level0name=N'Finance', @level1type=N'TABLE',@level1name=N'ReinsFinancialTransaction'
GO
