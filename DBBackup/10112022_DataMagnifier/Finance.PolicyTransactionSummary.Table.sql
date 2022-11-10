USE [DataMagnifier]
GO
/****** Object:  Table [Finance].[PolicyTransactionSummary]    Script Date: 10.11.2022 14:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Finance].[PolicyTransactionSummary]') AND type in (N'U'))
BEGIN
CREATE TABLE [Finance].[PolicyTransactionSummary](
	[PolicyTransactionSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PolicyTransSK] [int] NOT NULL,
	[PolicySK] [int] NOT NULL,
	[PolicyLineofBusinessSK] [int] NOT NULL,
	[WritingCompanySK] [int] NOT NULL,
	[AccountSK] [int] NOT NULL,
	[AgencySK] [int] NOT NULL,
	[ProfitAnalysisSK] [int] NULL,
	[PolicyGeographySK] [int] NOT NULL,
	[PolicyCoverageSK] [int] NOT NULL,
	[CurrencySK] [int] NOT NULL,
	[ProductSK] [int] NULL,
	[RevenueCodeSK] [int] NOT NULL,
	[TransactionAmt] [decimal](19, 4) NOT NULL,
	[EffectiveDate] [date] NULL,
	[ExpirationDate] [date] NULL,
	[ReportingPeriod] [varchar](20) NULL,
	[WrittenDate] [date] NULL,
 CONSTRAINT [PK_PolicyTransactionSummary] PRIMARY KEY CLUSTERED 
(
	[PolicyTransactionSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AccountSK_PolicyTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionSummary]'))
ALTER TABLE [Finance].[PolicyTransactionSummary]  WITH CHECK ADD  CONSTRAINT [FK_AccountSK_PolicyTransactionSummary] FOREIGN KEY([AccountSK])
REFERENCES [Party].[Account] ([AccountSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AccountSK_PolicyTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionSummary]'))
ALTER TABLE [Finance].[PolicyTransactionSummary] CHECK CONSTRAINT [FK_AccountSK_PolicyTransactionSummary]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AgencySK_PolicyTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionSummary]'))
ALTER TABLE [Finance].[PolicyTransactionSummary]  WITH CHECK ADD  CONSTRAINT [FK_AgencySK_PolicyTransactionSummary] FOREIGN KEY([AgencySK])
REFERENCES [Party].[Agency] ([AgencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AgencySK_PolicyTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionSummary]'))
ALTER TABLE [Finance].[PolicyTransactionSummary] CHECK CONSTRAINT [FK_AgencySK_PolicyTransactionSummary]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_CurrencySK_PolicyTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionSummary]'))
ALTER TABLE [Finance].[PolicyTransactionSummary]  WITH CHECK ADD  CONSTRAINT [FK_CurrencySK_PolicyTransactionSummary] FOREIGN KEY([CurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_CurrencySK_PolicyTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionSummary]'))
ALTER TABLE [Finance].[PolicyTransactionSummary] CHECK CONSTRAINT [FK_CurrencySK_PolicyTransactionSummary]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PolicyCoverageSK_PolicyTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionSummary]'))
ALTER TABLE [Finance].[PolicyTransactionSummary]  WITH CHECK ADD  CONSTRAINT [FK_PolicyCoverageSK_PolicyTransactionSummary] FOREIGN KEY([PolicyCoverageSK])
REFERENCES [Policy].[PolicyCoverage] ([PolicyCoverageSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PolicyCoverageSK_PolicyTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionSummary]'))
ALTER TABLE [Finance].[PolicyTransactionSummary] CHECK CONSTRAINT [FK_PolicyCoverageSK_PolicyTransactionSummary]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PolicyGeographySK_PolicyTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionSummary]'))
ALTER TABLE [Finance].[PolicyTransactionSummary]  WITH CHECK ADD  CONSTRAINT [FK_PolicyGeographySK_PolicyTransactionSummary] FOREIGN KEY([PolicyGeographySK])
REFERENCES [Policy].[PolicyGeography] ([PolicyGeographySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PolicyGeographySK_PolicyTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionSummary]'))
ALTER TABLE [Finance].[PolicyTransactionSummary] CHECK CONSTRAINT [FK_PolicyGeographySK_PolicyTransactionSummary]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PolicyLineofBusinessSK_PolicyTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionSummary]'))
ALTER TABLE [Finance].[PolicyTransactionSummary]  WITH CHECK ADD  CONSTRAINT [FK_PolicyLineofBusinessSK_PolicyTransactionSummary] FOREIGN KEY([PolicyLineofBusinessSK])
REFERENCES [Policy].[PolicyLineofBusiness] ([PolicyLineofBusinessSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PolicyLineofBusinessSK_PolicyTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionSummary]'))
ALTER TABLE [Finance].[PolicyTransactionSummary] CHECK CONSTRAINT [FK_PolicyLineofBusinessSK_PolicyTransactionSummary]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PolicySK_PolicyTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionSummary]'))
ALTER TABLE [Finance].[PolicyTransactionSummary]  WITH CHECK ADD  CONSTRAINT [FK_PolicySK_PolicyTransactionSummary] FOREIGN KEY([PolicySK])
REFERENCES [Policy].[Policy] ([PolicySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PolicySK_PolicyTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionSummary]'))
ALTER TABLE [Finance].[PolicyTransactionSummary] CHECK CONSTRAINT [FK_PolicySK_PolicyTransactionSummary]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PolicyTransSK_PolicyTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionSummary]'))
ALTER TABLE [Finance].[PolicyTransactionSummary]  WITH CHECK ADD  CONSTRAINT [FK_PolicyTransSK_PolicyTransactionSummary] FOREIGN KEY([PolicyTransSK])
REFERENCES [Policy].[PolicyTrans] ([PolicyTransSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PolicyTransSK_PolicyTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionSummary]'))
ALTER TABLE [Finance].[PolicyTransactionSummary] CHECK CONSTRAINT [FK_PolicyTransSK_PolicyTransactionSummary]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ProductSK_PolicyTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionSummary]'))
ALTER TABLE [Finance].[PolicyTransactionSummary]  WITH CHECK ADD  CONSTRAINT [FK_ProductSK_PolicyTransactionSummary] FOREIGN KEY([ProductSK])
REFERENCES [TypeList].[Product] ([ProductSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ProductSK_PolicyTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionSummary]'))
ALTER TABLE [Finance].[PolicyTransactionSummary] CHECK CONSTRAINT [FK_ProductSK_PolicyTransactionSummary]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ProfitAnalysisSK_PolicyTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionSummary]'))
ALTER TABLE [Finance].[PolicyTransactionSummary]  WITH CHECK ADD  CONSTRAINT [FK_ProfitAnalysisSK_PolicyTransactionSummary] FOREIGN KEY([ProfitAnalysisSK])
REFERENCES [TypeList].[ProfitAnalysis] ([ProfitAnalysisSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ProfitAnalysisSK_PolicyTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionSummary]'))
ALTER TABLE [Finance].[PolicyTransactionSummary] CHECK CONSTRAINT [FK_ProfitAnalysisSK_PolicyTransactionSummary]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_RevenueCodeSK_PolicyTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionSummary]'))
ALTER TABLE [Finance].[PolicyTransactionSummary]  WITH CHECK ADD  CONSTRAINT [FK_RevenueCodeSK_PolicyTransactionSummary] FOREIGN KEY([RevenueCodeSK])
REFERENCES [TypeList].[RevenueCode] ([RevenueCodeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_RevenueCodeSK_PolicyTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionSummary]'))
ALTER TABLE [Finance].[PolicyTransactionSummary] CHECK CONSTRAINT [FK_RevenueCodeSK_PolicyTransactionSummary]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_SourceSystemSK_PolicyTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionSummary]'))
ALTER TABLE [Finance].[PolicyTransactionSummary]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyTransactionSummary] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_SourceSystemSK_PolicyTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionSummary]'))
ALTER TABLE [Finance].[PolicyTransactionSummary] CHECK CONSTRAINT [FK_SourceSystemSK_PolicyTransactionSummary]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_WritingCompanySK_PolicyTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionSummary]'))
ALTER TABLE [Finance].[PolicyTransactionSummary]  WITH CHECK ADD  CONSTRAINT [FK_WritingCompanySK_PolicyTransactionSummary] FOREIGN KEY([WritingCompanySK])
REFERENCES [Party].[WritingCompany] ([WritingCompanySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_WritingCompanySK_PolicyTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionSummary]'))
ALTER TABLE [Finance].[PolicyTransactionSummary] CHECK CONSTRAINT [FK_WritingCompanySK_PolicyTransactionSummary]
GO
