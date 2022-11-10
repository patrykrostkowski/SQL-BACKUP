USE [DataMagnifier]
GO
/****** Object:  Table [Finance].[PolicyFinancialTransaction]    Script Date: 10.11.2022 14:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Finance].[PolicyFinancialTransaction]') AND type in (N'U'))
BEGIN
CREATE TABLE [Finance].[PolicyFinancialTransaction](
	[PolicyFinancialTransactionSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PolicySK] [int] NOT NULL,
	[WritingCompanySK] [int] NOT NULL,
	[FinancialReportingPeriodSK] [int] NOT NULL,
	[EntryDate] [date] NOT NULL,
	[TransactionDate] [date] NOT NULL,
	[SettlementDate] [date] NOT NULL,
	[LastAllocationDate] [date] NULL,
	[EffectiveDate] [date] NOT NULL,
	[ExpirationDate] [date] NULL,
	[ProductSK] [int] NULL,
	[PostedAmt] [decimal](19, 4) NOT NULL,
	[TransactionTypeSK] [int] NOT NULL,
	[EarnStartDate] [date] NULL,
	[EarnEndDate] [date] NULL,
	[CurrencySK] [int] NOT NULL,
	[RevenueCodeSK] [int] NOT NULL,
	[PolicyCoverageSK] [int] NULL,
	[PolicySubCoverageSK] [int] NULL,
	[TransactionAmt] [decimal](19, 4) NOT NULL,
	[ShareofWholePct] [decimal](8, 4) NULL,
	[ProfitAnalysisSK] [int] NULL,
	[DepartmentSK] [int] NULL,
	[IndustryGroupSK] [int] NULL,
 CONSTRAINT [PK_PolicyFinancialTransaction] PRIMARY KEY CLUSTERED 
(
	[PolicyFinancialTransactionSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_CurrencySK_PolicyFinancialTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyFinancialTransaction]'))
ALTER TABLE [Finance].[PolicyFinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_CurrencySK_PolicyFinancialTransaction] FOREIGN KEY([CurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_CurrencySK_PolicyFinancialTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyFinancialTransaction]'))
ALTER TABLE [Finance].[PolicyFinancialTransaction] CHECK CONSTRAINT [FK_CurrencySK_PolicyFinancialTransaction]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PolicyCoverageSK_PolicyFinancialTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyFinancialTransaction]'))
ALTER TABLE [Finance].[PolicyFinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_PolicyCoverageSK_PolicyFinancialTransaction] FOREIGN KEY([PolicyCoverageSK])
REFERENCES [Policy].[PolicyCoverage] ([PolicyCoverageSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PolicyCoverageSK_PolicyFinancialTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyFinancialTransaction]'))
ALTER TABLE [Finance].[PolicyFinancialTransaction] CHECK CONSTRAINT [FK_PolicyCoverageSK_PolicyFinancialTransaction]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PolicySK_PolicyFinancialTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyFinancialTransaction]'))
ALTER TABLE [Finance].[PolicyFinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_PolicySK_PolicyFinancialTransaction] FOREIGN KEY([PolicySK])
REFERENCES [Policy].[Policy] ([PolicySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PolicySK_PolicyFinancialTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyFinancialTransaction]'))
ALTER TABLE [Finance].[PolicyFinancialTransaction] CHECK CONSTRAINT [FK_PolicySK_PolicyFinancialTransaction]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ProductSK_PolicyFinancialTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyFinancialTransaction]'))
ALTER TABLE [Finance].[PolicyFinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_ProductSK_PolicyFinancialTransaction] FOREIGN KEY([ProductSK])
REFERENCES [TypeList].[Product] ([ProductSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ProductSK_PolicyFinancialTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyFinancialTransaction]'))
ALTER TABLE [Finance].[PolicyFinancialTransaction] CHECK CONSTRAINT [FK_ProductSK_PolicyFinancialTransaction]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ProfitAnalysisSK_PolicyFinancialTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyFinancialTransaction]'))
ALTER TABLE [Finance].[PolicyFinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_ProfitAnalysisSK_PolicyFinancialTransaction] FOREIGN KEY([ProfitAnalysisSK])
REFERENCES [TypeList].[ProfitAnalysis] ([ProfitAnalysisSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ProfitAnalysisSK_PolicyFinancialTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyFinancialTransaction]'))
ALTER TABLE [Finance].[PolicyFinancialTransaction] CHECK CONSTRAINT [FK_ProfitAnalysisSK_PolicyFinancialTransaction]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_RevenueCodeSK_PolicyFinancialTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyFinancialTransaction]'))
ALTER TABLE [Finance].[PolicyFinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_RevenueCodeSK_PolicyFinancialTransaction] FOREIGN KEY([RevenueCodeSK])
REFERENCES [TypeList].[RevenueCode] ([RevenueCodeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_RevenueCodeSK_PolicyFinancialTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyFinancialTransaction]'))
ALTER TABLE [Finance].[PolicyFinancialTransaction] CHECK CONSTRAINT [FK_RevenueCodeSK_PolicyFinancialTransaction]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_SourceSystemSK_PolicyFinancialTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyFinancialTransaction]'))
ALTER TABLE [Finance].[PolicyFinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyFinancialTransaction] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_SourceSystemSK_PolicyFinancialTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyFinancialTransaction]'))
ALTER TABLE [Finance].[PolicyFinancialTransaction] CHECK CONSTRAINT [FK_SourceSystemSK_PolicyFinancialTransaction]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_WritingCompanySK_PolicyFinancialTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyFinancialTransaction]'))
ALTER TABLE [Finance].[PolicyFinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_WritingCompanySK_PolicyFinancialTransaction] FOREIGN KEY([WritingCompanySK])
REFERENCES [Party].[WritingCompany] ([WritingCompanySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_WritingCompanySK_PolicyFinancialTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyFinancialTransaction]'))
ALTER TABLE [Finance].[PolicyFinancialTransaction] CHECK CONSTRAINT [FK_WritingCompanySK_PolicyFinancialTransaction]
GO
