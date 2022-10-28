USE [sqldb-ods-dev]
GO
/****** Object:  Table [Finance].[PolicyFinancialTransactionSummary]    Script Date: 28.10.2022 13:36:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Finance].[PolicyFinancialTransactionSummary](
	[PolicyFinancialTransactionSummarySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[FinancialReportingPeriodSK] [int] NOT NULL,
	[FinancialSourceTransactionTypeSK] [int] NOT NULL,
	[EntryDate] [date] NOT NULL,
	[TransactionDate] [date] NOT NULL,
	[SettlementDate] [date] NULL,
	[LastAllocationDate] [date] NULL,
	[PolicySK] [int] NOT NULL,
	[WritingCompanySK] [int] NOT NULL,
	[AgencySK] [int] NOT NULL,
	[ProductSK] [int] NULL,
	[LineofBusinessSK] [int] NOT NULL,
	[SublineSK] [int] NULL,
	[StateSK] [int] NOT NULL,
	[CoverageSK] [int] NULL,
	[SubCoverageSK] [int] NULL,
	[BaseCurrencySK] [int] NOT NULL,
	[OriginalCurrencySK] [int] NULL,
	[ReportingCurrencySK] [int] NULL,
	[ProfitAnalysisSK] [int] NULL,
	[DirectWrittenPremiumBaseAmt] [decimal](19, 4) NULL,
	[DirectWrittenPremiumOriginalAmt] [decimal](19, 4) NULL,
	[DirectWrittenPremiumReportingAmt] [decimal](19, 4) NULL,
	[AssumedWrittenPremiumBaseAmt] [decimal](19, 4) NULL,
	[AssumedWrittenPremiumOriginalAmt] [decimal](19, 4) NULL,
	[AssumedWrittenPremiumReportingAmt] [decimal](19, 4) NULL,
	[ShareofWholePct] [decimal](8, 4) NULL,
	[DirectSurchargeBaseAmt] [decimal](19, 4) NULL,
	[DirectSurchargeOriginalAmt] [decimal](19, 4) NULL,
	[DirectSurchargeReportingAmt] [decimal](19, 4) NULL,
	[AssumedSurchargeBaseAmt] [decimal](19, 4) NULL,
	[AssumedSurchargeOriginalAmt] [decimal](19, 4) NULL,
	[AssumedSurchargeReportingAmt] [decimal](19, 4) NULL,
	[DirectTaxBaseAmt] [decimal](19, 4) NULL,
	[DirectTaxOriginalAmt] [decimal](19, 4) NULL,
	[DirectTaxReportingAmt] [decimal](19, 4) NULL,
	[AssumedTaxBaseAmt] [decimal](19, 4) NULL,
	[AssumedTaxOriginalAmt] [decimal](19, 4) NULL,
	[AssumedTaxReportingAmt] [decimal](19, 4) NULL,
	[DirectCommissionBaseAmt] [decimal](19, 4) NULL,
	[DirectCommissionOriginalAmt] [decimal](19, 4) NULL,
	[DirectCommissionReportingAmt] [decimal](19, 4) NULL,
	[AssumedCommissionBaseAmt] [decimal](19, 4) NULL,
	[AssumedCommissionOriginalAmt] [decimal](19, 4) NULL,
	[AssumedCommissionReportingAmt] [decimal](19, 4) NULL,
 CONSTRAINT [PK_PolicyTransactionHeader] PRIMARY KEY CLUSTERED 
(
	[PolicyFinancialTransactionSummarySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_PolicyTransactionHeader]    Script Date: 28.10.2022 13:37:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_PolicyTransactionHeader] ON [Finance].[PolicyFinancialTransactionSummary]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Finance].[PolicyFinancialTransactionSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_AgencySK_PolicyFinancialTransaction] FOREIGN KEY([AgencySK])
REFERENCES [Party].[Agency] ([AgencySK])
GO
ALTER TABLE [Finance].[PolicyFinancialTransactionSummary] NOCHECK CONSTRAINT [FK_AgencySK_PolicyFinancialTransaction]
GO
ALTER TABLE [Finance].[PolicyFinancialTransactionSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_CoverageSK_PolicyFinancialTransaction] FOREIGN KEY([CoverageSK])
REFERENCES [Typelist].[Coverage] ([CoverageSK])
GO
ALTER TABLE [Finance].[PolicyFinancialTransactionSummary] NOCHECK CONSTRAINT [FK_CoverageSK_PolicyFinancialTransaction]
GO
ALTER TABLE [Finance].[PolicyFinancialTransactionSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_CurrencySK_PolicyFinancialTransaction] FOREIGN KEY([BaseCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[PolicyFinancialTransactionSummary] NOCHECK CONSTRAINT [FK_CurrencySK_PolicyFinancialTransaction]
GO
ALTER TABLE [Finance].[PolicyFinancialTransactionSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_FinancialReportingPeriodSK_PolicyFinancialTransaction] FOREIGN KEY([FinancialReportingPeriodSK])
REFERENCES [Typelist].[FinancialReportingPeriod] ([FinancialReportingPeriodSK])
GO
ALTER TABLE [Finance].[PolicyFinancialTransactionSummary] NOCHECK CONSTRAINT [FK_FinancialReportingPeriodSK_PolicyFinancialTransaction]
GO
ALTER TABLE [Finance].[PolicyFinancialTransactionSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_LineofBusinessSK_PolicyFinancialTransaction] FOREIGN KEY([LineofBusinessSK])
REFERENCES [Typelist].[LineofBusiness] ([LineofBusinessSK])
GO
ALTER TABLE [Finance].[PolicyFinancialTransactionSummary] NOCHECK CONSTRAINT [FK_LineofBusinessSK_PolicyFinancialTransaction]
GO
ALTER TABLE [Finance].[PolicyFinancialTransactionSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_OriginalCurrencySK_PolicyFinancialTransaction] FOREIGN KEY([OriginalCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[PolicyFinancialTransactionSummary] NOCHECK CONSTRAINT [FK_OriginalCurrencySK_PolicyFinancialTransaction]
GO
ALTER TABLE [Finance].[PolicyFinancialTransactionSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicySK_PolicyFinancialTransaction] FOREIGN KEY([PolicySK])
REFERENCES [Policy].[Policy] ([PolicySK])
GO
ALTER TABLE [Finance].[PolicyFinancialTransactionSummary] NOCHECK CONSTRAINT [FK_PolicySK_PolicyFinancialTransaction]
GO
ALTER TABLE [Finance].[PolicyFinancialTransactionSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_ProductSK_PolicyFinancialTransaction] FOREIGN KEY([ProductSK])
REFERENCES [Typelist].[Product] ([ProductSK])
GO
ALTER TABLE [Finance].[PolicyFinancialTransactionSummary] NOCHECK CONSTRAINT [FK_ProductSK_PolicyFinancialTransaction]
GO
ALTER TABLE [Finance].[PolicyFinancialTransactionSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_ProfitAnalysisSK_PolicyFinancialTransaction] FOREIGN KEY([ProfitAnalysisSK])
REFERENCES [Typelist].[ProfitAnalysis] ([ProfitAnalysisSK])
GO
ALTER TABLE [Finance].[PolicyFinancialTransactionSummary] NOCHECK CONSTRAINT [FK_ProfitAnalysisSK_PolicyFinancialTransaction]
GO
ALTER TABLE [Finance].[PolicyFinancialTransactionSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_ReportingCurrencySK_PolicyFinancialTransaction] FOREIGN KEY([ReportingCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[PolicyFinancialTransactionSummary] NOCHECK CONSTRAINT [FK_ReportingCurrencySK_PolicyFinancialTransaction]
GO
ALTER TABLE [Finance].[PolicyFinancialTransactionSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyFinancialTransaction] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Finance].[PolicyFinancialTransactionSummary] NOCHECK CONSTRAINT [FK_SourceSystemSK_PolicyFinancialTransaction]
GO
ALTER TABLE [Finance].[PolicyFinancialTransactionSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_StateSK_PolicyFinancialTransaction] FOREIGN KEY([StateSK])
REFERENCES [Typelist].[State] ([StateSK])
GO
ALTER TABLE [Finance].[PolicyFinancialTransactionSummary] NOCHECK CONSTRAINT [FK_StateSK_PolicyFinancialTransaction]
GO
ALTER TABLE [Finance].[PolicyFinancialTransactionSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_SubCoverageSK_PolicyFinancialTransaction] FOREIGN KEY([SubCoverageSK])
REFERENCES [Typelist].[SubCoverage] ([SubCoverageSK])
GO
ALTER TABLE [Finance].[PolicyFinancialTransactionSummary] NOCHECK CONSTRAINT [FK_SubCoverageSK_PolicyFinancialTransaction]
GO
ALTER TABLE [Finance].[PolicyFinancialTransactionSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_SublineSK_PolicyFinancialTransaction] FOREIGN KEY([SublineSK])
REFERENCES [Typelist].[Subline] ([SublineSK])
GO
ALTER TABLE [Finance].[PolicyFinancialTransactionSummary] NOCHECK CONSTRAINT [FK_SublineSK_PolicyFinancialTransaction]
GO
ALTER TABLE [Finance].[PolicyFinancialTransactionSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_TransactionTypeSK_PolicyFinancialTransaction] FOREIGN KEY([FinancialSourceTransactionTypeSK])
REFERENCES [Typelist].[FinancialSourceTransactionType] ([FinancialSourceTransactionTypeSK])
GO
ALTER TABLE [Finance].[PolicyFinancialTransactionSummary] NOCHECK CONSTRAINT [FK_TransactionTypeSK_PolicyFinancialTransaction]
GO
ALTER TABLE [Finance].[PolicyFinancialTransactionSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_WritingCompanySK_PolicyFinancialTransaction] FOREIGN KEY([WritingCompanySK])
REFERENCES [Party].[WritingCompany] ([WritingCompanySK])
GO
ALTER TABLE [Finance].[PolicyFinancialTransactionSummary] NOCHECK CONSTRAINT [FK_WritingCompanySK_PolicyFinancialTransaction]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Based on period ending accounting period and the transaction types of verified and non-verified 
  Non-verified will source from one or many policy administration applications.  Non-verified financials may be less accurate than audited ones.
  Verified will source from the insurers General Ledger A verified financial transaction has been audited for accuracy by an independent accountant, attesting that the financial statement and its transactions are correct.                                                                              The premium, tax, surcharges and commissions  for coverage, benefit, and the like described in the policy agreement  associated with a specific period of time.For example, an insurance policy premium is the price for coverage of a particular risk or set of risks described in the agreement, during a specific period of time.' , @level0type=N'SCHEMA',@level0name=N'Finance', @level1type=N'TABLE',@level1name=N'PolicyFinancialTransactionSummary'
GO
