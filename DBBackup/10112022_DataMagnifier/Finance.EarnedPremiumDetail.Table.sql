USE [DataMagnifier]
GO
/****** Object:  Table [Finance].[EarnedPremiumDetail]    Script Date: 10.11.2022 14:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Finance].[EarnedPremiumDetail]') AND type in (N'U'))
BEGIN
CREATE TABLE [Finance].[EarnedPremiumDetail](
	[EarnedPremiumDetailSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[EarnedPremiumHeaderSK] [int] NOT NULL,
	[PolicySK] [int] NOT NULL,
	[PolicyGeographySK] [int] NULL,
	[PolicyCoverageSK] [int] NULL,
	[PolicySubCoverageSK] [int] NULL,
	[FinancialReportingPeriodSK] [int] NULL,
	[PremiumTypeSK] [int] NULL,
	[InsuredSK] [int] NULL,
	[AgencySK] [int] NOT NULL,
	[WritingCompanySK] [int] NULL,
	[ClaimTransactionTypeSK] [int] NULL,
	[ProfitAnalysisSK] [int] NULL,
	[EntryDateTime] [datetime] NOT NULL,
	[EarnedAmt] [decimal](18, 2) NULL,
	[CurrencySK] [int] NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AgencySK_EarnedPremiumDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[EarnedPremiumDetail]'))
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH CHECK ADD  CONSTRAINT [FK_AgencySK_EarnedPremiumDetail] FOREIGN KEY([AgencySK])
REFERENCES [Party].[Agency] ([AgencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AgencySK_EarnedPremiumDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[EarnedPremiumDetail]'))
ALTER TABLE [Finance].[EarnedPremiumDetail] CHECK CONSTRAINT [FK_AgencySK_EarnedPremiumDetail]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ClaimTransactionTypeSK_EarnedPremiumDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[EarnedPremiumDetail]'))
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH CHECK ADD  CONSTRAINT [FK_ClaimTransactionTypeSK_EarnedPremiumDetail] FOREIGN KEY([ClaimTransactionTypeSK])
REFERENCES [TypeList].[ClaimTransactionType] ([ClaimTransactionTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ClaimTransactionTypeSK_EarnedPremiumDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[EarnedPremiumDetail]'))
ALTER TABLE [Finance].[EarnedPremiumDetail] CHECK CONSTRAINT [FK_ClaimTransactionTypeSK_EarnedPremiumDetail]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_CurrencySK_EarnedPremiumDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[EarnedPremiumDetail]'))
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH CHECK ADD  CONSTRAINT [FK_CurrencySK_EarnedPremiumDetail] FOREIGN KEY([CurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_CurrencySK_EarnedPremiumDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[EarnedPremiumDetail]'))
ALTER TABLE [Finance].[EarnedPremiumDetail] CHECK CONSTRAINT [FK_CurrencySK_EarnedPremiumDetail]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_EarnedPremiumHeaderSK_EarnedPremiumDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[EarnedPremiumDetail]'))
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH CHECK ADD  CONSTRAINT [FK_EarnedPremiumHeaderSK_EarnedPremiumDetail] FOREIGN KEY([EarnedPremiumHeaderSK])
REFERENCES [Finance].[EarnedPremiumHeader] ([EarnedPremiumHeaderSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_EarnedPremiumHeaderSK_EarnedPremiumDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[EarnedPremiumDetail]'))
ALTER TABLE [Finance].[EarnedPremiumDetail] CHECK CONSTRAINT [FK_EarnedPremiumHeaderSK_EarnedPremiumDetail]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_FinancialReportingPeriodSK_EarnedPremiumDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[EarnedPremiumDetail]'))
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH CHECK ADD  CONSTRAINT [FK_FinancialReportingPeriodSK_EarnedPremiumDetail] FOREIGN KEY([FinancialReportingPeriodSK])
REFERENCES [TypeList].[FinancialReportingPeriod] ([FinancialReportingPeriodSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_FinancialReportingPeriodSK_EarnedPremiumDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[EarnedPremiumDetail]'))
ALTER TABLE [Finance].[EarnedPremiumDetail] CHECK CONSTRAINT [FK_FinancialReportingPeriodSK_EarnedPremiumDetail]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_InsuredSK_EarnedPremiumDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[EarnedPremiumDetail]'))
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH CHECK ADD  CONSTRAINT [FK_InsuredSK_EarnedPremiumDetail] FOREIGN KEY([InsuredSK])
REFERENCES [Party].[Insured] ([InsuredSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_InsuredSK_EarnedPremiumDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[EarnedPremiumDetail]'))
ALTER TABLE [Finance].[EarnedPremiumDetail] CHECK CONSTRAINT [FK_InsuredSK_EarnedPremiumDetail]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PolicyCoverageSK_EarnedPremiumDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[EarnedPremiumDetail]'))
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH CHECK ADD  CONSTRAINT [FK_PolicyCoverageSK_EarnedPremiumDetail] FOREIGN KEY([PolicyCoverageSK])
REFERENCES [Policy].[PolicyCoverage] ([PolicyCoverageSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PolicyCoverageSK_EarnedPremiumDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[EarnedPremiumDetail]'))
ALTER TABLE [Finance].[EarnedPremiumDetail] CHECK CONSTRAINT [FK_PolicyCoverageSK_EarnedPremiumDetail]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PolicyGeographySK_EarnedPremiumDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[EarnedPremiumDetail]'))
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH CHECK ADD  CONSTRAINT [FK_PolicyGeographySK_EarnedPremiumDetail] FOREIGN KEY([PolicyGeographySK])
REFERENCES [Policy].[PolicyGeography] ([PolicyGeographySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PolicyGeographySK_EarnedPremiumDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[EarnedPremiumDetail]'))
ALTER TABLE [Finance].[EarnedPremiumDetail] CHECK CONSTRAINT [FK_PolicyGeographySK_EarnedPremiumDetail]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PolicySK_EarnedPremiumDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[EarnedPremiumDetail]'))
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH CHECK ADD  CONSTRAINT [FK_PolicySK_EarnedPremiumDetail] FOREIGN KEY([PolicySK])
REFERENCES [Policy].[Policy] ([PolicySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PolicySK_EarnedPremiumDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[EarnedPremiumDetail]'))
ALTER TABLE [Finance].[EarnedPremiumDetail] CHECK CONSTRAINT [FK_PolicySK_EarnedPremiumDetail]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PolicySubCoverageSK_EarnedPremiumDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[EarnedPremiumDetail]'))
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH CHECK ADD  CONSTRAINT [FK_PolicySubCoverageSK_EarnedPremiumDetail] FOREIGN KEY([PolicySubCoverageSK])
REFERENCES [Policy].[PolicySubCoverage] ([PolicySubCoverageSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PolicySubCoverageSK_EarnedPremiumDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[EarnedPremiumDetail]'))
ALTER TABLE [Finance].[EarnedPremiumDetail] CHECK CONSTRAINT [FK_PolicySubCoverageSK_EarnedPremiumDetail]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PremiumTypeSK_EarnedPremiumDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[EarnedPremiumDetail]'))
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH CHECK ADD  CONSTRAINT [FK_PremiumTypeSK_EarnedPremiumDetail] FOREIGN KEY([PremiumTypeSK])
REFERENCES [TypeList].[PremiumType] ([PremiumTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PremiumTypeSK_EarnedPremiumDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[EarnedPremiumDetail]'))
ALTER TABLE [Finance].[EarnedPremiumDetail] CHECK CONSTRAINT [FK_PremiumTypeSK_EarnedPremiumDetail]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ProfitAnalysisSK_EarnedPremiumDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[EarnedPremiumDetail]'))
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH CHECK ADD  CONSTRAINT [FK_ProfitAnalysisSK_EarnedPremiumDetail] FOREIGN KEY([ProfitAnalysisSK])
REFERENCES [TypeList].[ProfitAnalysis] ([ProfitAnalysisSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ProfitAnalysisSK_EarnedPremiumDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[EarnedPremiumDetail]'))
ALTER TABLE [Finance].[EarnedPremiumDetail] CHECK CONSTRAINT [FK_ProfitAnalysisSK_EarnedPremiumDetail]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_SourceSystemSK_EarnedPremiumDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[EarnedPremiumDetail]'))
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_EarnedPremiumDetail] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_SourceSystemSK_EarnedPremiumDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[EarnedPremiumDetail]'))
ALTER TABLE [Finance].[EarnedPremiumDetail] CHECK CONSTRAINT [FK_SourceSystemSK_EarnedPremiumDetail]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_WritingCompanySK_EarnedPremiumDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[EarnedPremiumDetail]'))
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH CHECK ADD  CONSTRAINT [FK_WritingCompanySK_EarnedPremiumDetail] FOREIGN KEY([WritingCompanySK])
REFERENCES [Party].[WritingCompany] ([WritingCompanySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_WritingCompanySK_EarnedPremiumDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[EarnedPremiumDetail]'))
ALTER TABLE [Finance].[EarnedPremiumDetail] CHECK CONSTRAINT [FK_WritingCompanySK_EarnedPremiumDetail]
GO
