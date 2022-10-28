USE [sqldb-ods-dev]
GO
/****** Object:  Table [Finance].[FaculativeTreatyFinancialTransaction]    Script Date: 28.10.2022 13:36:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Finance].[FaculativeTreatyFinancialTransaction](
	[FaculativeTreatyFinancialTransactionSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](255) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[FacultativeTreatySK] [int] NOT NULL,
	[PolicySK] [int] NOT NULL,
	[PolicyCoverageSK] [int] NULL,
	[ProfitAnalysisSK] [int] NULL,
	[BaseCurrencySK] [int] NOT NULL,
	[OriginalCurrencySK] [int] NULL,
	[ReportingCurrencySK] [int] NULL,
	[SegmentCode] [varchar](20) NOT NULL,
	[BusinessTypeCode] [varchar](20) NULL,
	[FinancialTransactionTypeSK] [int] NOT NULL,
	[TransactionBaseAmt] [decimal](19, 4) NULL,
	[TransactionOriginalAmt] [decimal](19, 4) NULL,
	[TransactionReportingAmt] [decimal](19, 4) NULL,
	[TransactionDate] [date] NOT NULL,
	[PostingDate] [date] NOT NULL,
 CONSTRAINT [PK_FaculativeTreatyFinancialTransaction] PRIMARY KEY CLUSTERED 
(
	[FaculativeTreatyFinancialTransactionSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_FaculativeTreatyFinancialTransaction]    Script Date: 28.10.2022 13:37:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_FaculativeTreatyFinancialTransaction] ON [Finance].[FaculativeTreatyFinancialTransaction]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Finance].[FaculativeTreatyFinancialTransaction]  WITH NOCHECK ADD  CONSTRAINT [FK_BaseCurrencySK_FaculativeTreatyFinancialTransaction] FOREIGN KEY([BaseCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[FaculativeTreatyFinancialTransaction] NOCHECK CONSTRAINT [FK_BaseCurrencySK_FaculativeTreatyFinancialTransaction]
GO
ALTER TABLE [Finance].[FaculativeTreatyFinancialTransaction]  WITH NOCHECK ADD  CONSTRAINT [FK_FacultativeTreatySK_FaculativeTreatyFinancialTransaction] FOREIGN KEY([FacultativeTreatySK])
REFERENCES [Reins].[FacultativeTreaty] ([FacultativeTreatySK])
GO
ALTER TABLE [Finance].[FaculativeTreatyFinancialTransaction] NOCHECK CONSTRAINT [FK_FacultativeTreatySK_FaculativeTreatyFinancialTransaction]
GO
ALTER TABLE [Finance].[FaculativeTreatyFinancialTransaction]  WITH NOCHECK ADD  CONSTRAINT [FK_OriginalCurrencySK_FaculativeTreatyFinancialTransaction] FOREIGN KEY([OriginalCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[FaculativeTreatyFinancialTransaction] NOCHECK CONSTRAINT [FK_OriginalCurrencySK_FaculativeTreatyFinancialTransaction]
GO
ALTER TABLE [Finance].[FaculativeTreatyFinancialTransaction]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyCoverageSK_FaculativeTreatyFinancialTransaction] FOREIGN KEY([PolicyCoverageSK])
REFERENCES [Policy].[PolicyCoverage] ([PolicyCoverageSK])
GO
ALTER TABLE [Finance].[FaculativeTreatyFinancialTransaction] NOCHECK CONSTRAINT [FK_PolicyCoverageSK_FaculativeTreatyFinancialTransaction]
GO
ALTER TABLE [Finance].[FaculativeTreatyFinancialTransaction]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicySK_FaculativeTreatyFinancialTransaction] FOREIGN KEY([PolicySK])
REFERENCES [Policy].[Policy] ([PolicySK])
GO
ALTER TABLE [Finance].[FaculativeTreatyFinancialTransaction] NOCHECK CONSTRAINT [FK_PolicySK_FaculativeTreatyFinancialTransaction]
GO
ALTER TABLE [Finance].[FaculativeTreatyFinancialTransaction]  WITH NOCHECK ADD  CONSTRAINT [FK_ProfitAnalysisSK_FaculativeTreatyFinancialTransaction] FOREIGN KEY([ProfitAnalysisSK])
REFERENCES [Typelist].[ProfitAnalysis] ([ProfitAnalysisSK])
GO
ALTER TABLE [Finance].[FaculativeTreatyFinancialTransaction] NOCHECK CONSTRAINT [FK_ProfitAnalysisSK_FaculativeTreatyFinancialTransaction]
GO
ALTER TABLE [Finance].[FaculativeTreatyFinancialTransaction]  WITH NOCHECK ADD  CONSTRAINT [FK_ReportingCurrencySK_FaculativeTreatyFinancialTransaction] FOREIGN KEY([ReportingCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[FaculativeTreatyFinancialTransaction] NOCHECK CONSTRAINT [FK_ReportingCurrencySK_FaculativeTreatyFinancialTransaction]
GO
ALTER TABLE [Finance].[FaculativeTreatyFinancialTransaction]  WITH NOCHECK ADD  CONSTRAINT [FK_RevenueCodeSK_FaculativeTreatyFinancialTransaction] FOREIGN KEY([FinancialTransactionTypeSK])
REFERENCES [Typelist].[FinancialTransactionType] ([FinancialTransactionTypeSK])
GO
ALTER TABLE [Finance].[FaculativeTreatyFinancialTransaction] NOCHECK CONSTRAINT [FK_RevenueCodeSK_FaculativeTreatyFinancialTransaction]
GO
ALTER TABLE [Finance].[FaculativeTreatyFinancialTransaction]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_FaculativeTreatyFinancialTransaction] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Finance].[FaculativeTreatyFinancialTransaction] NOCHECK CONSTRAINT [FK_SourceSystemSK_FaculativeTreatyFinancialTransaction]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Faculative Treaty Financial Transaction' , @level0type=N'SCHEMA',@level0name=N'Finance', @level1type=N'TABLE',@level1name=N'FaculativeTreatyFinancialTransaction'
GO
