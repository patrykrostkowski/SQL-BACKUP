USE [DataMagnifier]
GO
/****** Object:  Table [Finance].[FaculativeTreatyFinancialTransaction]    Script Date: 10.11.2022 14:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Finance].[FaculativeTreatyFinancialTransaction]') AND type in (N'U'))
BEGIN
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
	[RevenueCodeSK] [int] NOT NULL,
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_BaseCurrencySK_FaculativeTreatyFinancialTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[FaculativeTreatyFinancialTransaction]'))
ALTER TABLE [Finance].[FaculativeTreatyFinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_BaseCurrencySK_FaculativeTreatyFinancialTransaction] FOREIGN KEY([BaseCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_BaseCurrencySK_FaculativeTreatyFinancialTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[FaculativeTreatyFinancialTransaction]'))
ALTER TABLE [Finance].[FaculativeTreatyFinancialTransaction] CHECK CONSTRAINT [FK_BaseCurrencySK_FaculativeTreatyFinancialTransaction]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_FacultativeTreatySK_FaculativeTreatyFinancialTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[FaculativeTreatyFinancialTransaction]'))
ALTER TABLE [Finance].[FaculativeTreatyFinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_FacultativeTreatySK_FaculativeTreatyFinancialTransaction] FOREIGN KEY([FacultativeTreatySK])
REFERENCES [Reins].[FacultativeTreaty] ([FacultativeTreatySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_FacultativeTreatySK_FaculativeTreatyFinancialTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[FaculativeTreatyFinancialTransaction]'))
ALTER TABLE [Finance].[FaculativeTreatyFinancialTransaction] CHECK CONSTRAINT [FK_FacultativeTreatySK_FaculativeTreatyFinancialTransaction]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_OriginalCurrencySK_FaculativeTreatyFinancialTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[FaculativeTreatyFinancialTransaction]'))
ALTER TABLE [Finance].[FaculativeTreatyFinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_OriginalCurrencySK_FaculativeTreatyFinancialTransaction] FOREIGN KEY([OriginalCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_OriginalCurrencySK_FaculativeTreatyFinancialTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[FaculativeTreatyFinancialTransaction]'))
ALTER TABLE [Finance].[FaculativeTreatyFinancialTransaction] CHECK CONSTRAINT [FK_OriginalCurrencySK_FaculativeTreatyFinancialTransaction]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PolicyCoverageSK_FaculativeTreatyFinancialTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[FaculativeTreatyFinancialTransaction]'))
ALTER TABLE [Finance].[FaculativeTreatyFinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_PolicyCoverageSK_FaculativeTreatyFinancialTransaction] FOREIGN KEY([PolicyCoverageSK])
REFERENCES [Policy].[PolicyCoverage] ([PolicyCoverageSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PolicyCoverageSK_FaculativeTreatyFinancialTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[FaculativeTreatyFinancialTransaction]'))
ALTER TABLE [Finance].[FaculativeTreatyFinancialTransaction] CHECK CONSTRAINT [FK_PolicyCoverageSK_FaculativeTreatyFinancialTransaction]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PolicySK_FaculativeTreatyFinancialTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[FaculativeTreatyFinancialTransaction]'))
ALTER TABLE [Finance].[FaculativeTreatyFinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_PolicySK_FaculativeTreatyFinancialTransaction] FOREIGN KEY([PolicySK])
REFERENCES [Policy].[Policy] ([PolicySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PolicySK_FaculativeTreatyFinancialTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[FaculativeTreatyFinancialTransaction]'))
ALTER TABLE [Finance].[FaculativeTreatyFinancialTransaction] CHECK CONSTRAINT [FK_PolicySK_FaculativeTreatyFinancialTransaction]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ProfitAnalysisSK_FaculativeTreatyFinancialTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[FaculativeTreatyFinancialTransaction]'))
ALTER TABLE [Finance].[FaculativeTreatyFinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_ProfitAnalysisSK_FaculativeTreatyFinancialTransaction] FOREIGN KEY([ProfitAnalysisSK])
REFERENCES [TypeList].[ProfitAnalysis] ([ProfitAnalysisSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ProfitAnalysisSK_FaculativeTreatyFinancialTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[FaculativeTreatyFinancialTransaction]'))
ALTER TABLE [Finance].[FaculativeTreatyFinancialTransaction] CHECK CONSTRAINT [FK_ProfitAnalysisSK_FaculativeTreatyFinancialTransaction]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ReportingCurrencySK_FaculativeTreatyFinancialTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[FaculativeTreatyFinancialTransaction]'))
ALTER TABLE [Finance].[FaculativeTreatyFinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_ReportingCurrencySK_FaculativeTreatyFinancialTransaction] FOREIGN KEY([ReportingCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ReportingCurrencySK_FaculativeTreatyFinancialTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[FaculativeTreatyFinancialTransaction]'))
ALTER TABLE [Finance].[FaculativeTreatyFinancialTransaction] CHECK CONSTRAINT [FK_ReportingCurrencySK_FaculativeTreatyFinancialTransaction]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_RevenueCodeSK_FaculativeTreatyFinancialTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[FaculativeTreatyFinancialTransaction]'))
ALTER TABLE [Finance].[FaculativeTreatyFinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_RevenueCodeSK_FaculativeTreatyFinancialTransaction] FOREIGN KEY([RevenueCodeSK])
REFERENCES [TypeList].[RevenueCode] ([RevenueCodeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_RevenueCodeSK_FaculativeTreatyFinancialTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[FaculativeTreatyFinancialTransaction]'))
ALTER TABLE [Finance].[FaculativeTreatyFinancialTransaction] CHECK CONSTRAINT [FK_RevenueCodeSK_FaculativeTreatyFinancialTransaction]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_SourceSystemSK_FaculativeTreatyFinancialTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[FaculativeTreatyFinancialTransaction]'))
ALTER TABLE [Finance].[FaculativeTreatyFinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_FaculativeTreatyFinancialTransaction] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_SourceSystemSK_FaculativeTreatyFinancialTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[FaculativeTreatyFinancialTransaction]'))
ALTER TABLE [Finance].[FaculativeTreatyFinancialTransaction] CHECK CONSTRAINT [FK_SourceSystemSK_FaculativeTreatyFinancialTransaction]
GO
