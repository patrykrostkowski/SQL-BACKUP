USE [DataMagnifier]
GO
/****** Object:  Table [Finance].[PolicyFinancialTransaction]    Script Date: 02.11.2022 09:21:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
ALTER TABLE [Finance].[PolicyFinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_CurrencySK_PolicyFinancialTransaction] FOREIGN KEY([CurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[PolicyFinancialTransaction] CHECK CONSTRAINT [FK_CurrencySK_PolicyFinancialTransaction]
GO
ALTER TABLE [Finance].[PolicyFinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_PolicyCoverageSK_PolicyFinancialTransaction] FOREIGN KEY([PolicyCoverageSK])
REFERENCES [Policy].[PolicyCoverage] ([PolicyCoverageSK])
GO
ALTER TABLE [Finance].[PolicyFinancialTransaction] CHECK CONSTRAINT [FK_PolicyCoverageSK_PolicyFinancialTransaction]
GO
ALTER TABLE [Finance].[PolicyFinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_PolicySK_PolicyFinancialTransaction] FOREIGN KEY([PolicySK])
REFERENCES [Policy].[Policy] ([PolicySK])
GO
ALTER TABLE [Finance].[PolicyFinancialTransaction] CHECK CONSTRAINT [FK_PolicySK_PolicyFinancialTransaction]
GO
ALTER TABLE [Finance].[PolicyFinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_ProductSK_PolicyFinancialTransaction] FOREIGN KEY([ProductSK])
REFERENCES [TypeList].[Product] ([ProductSK])
GO
ALTER TABLE [Finance].[PolicyFinancialTransaction] CHECK CONSTRAINT [FK_ProductSK_PolicyFinancialTransaction]
GO
ALTER TABLE [Finance].[PolicyFinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_ProfitAnalysisSK_PolicyFinancialTransaction] FOREIGN KEY([ProfitAnalysisSK])
REFERENCES [TypeList].[ProfitAnalysis] ([ProfitAnalysisSK])
GO
ALTER TABLE [Finance].[PolicyFinancialTransaction] CHECK CONSTRAINT [FK_ProfitAnalysisSK_PolicyFinancialTransaction]
GO
ALTER TABLE [Finance].[PolicyFinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_RevenueCodeSK_PolicyFinancialTransaction] FOREIGN KEY([RevenueCodeSK])
REFERENCES [TypeList].[RevenueCode] ([RevenueCodeSK])
GO
ALTER TABLE [Finance].[PolicyFinancialTransaction] CHECK CONSTRAINT [FK_RevenueCodeSK_PolicyFinancialTransaction]
GO
ALTER TABLE [Finance].[PolicyFinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyFinancialTransaction] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Finance].[PolicyFinancialTransaction] CHECK CONSTRAINT [FK_SourceSystemSK_PolicyFinancialTransaction]
GO
ALTER TABLE [Finance].[PolicyFinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_WritingCompanySK_PolicyFinancialTransaction] FOREIGN KEY([WritingCompanySK])
REFERENCES [Party].[WritingCompany] ([WritingCompanySK])
GO
ALTER TABLE [Finance].[PolicyFinancialTransaction] CHECK CONSTRAINT [FK_WritingCompanySK_PolicyFinancialTransaction]
GO
