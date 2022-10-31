USE [DataMagnifier]
GO
/****** Object:  Table [Finance].[EarnedPremiumDetail]    Script Date: 31.10.2022 12:01:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH CHECK ADD  CONSTRAINT [FK_AgencySK_EarnedPremiumDetail] FOREIGN KEY([AgencySK])
REFERENCES [Party].[Agency] ([AgencySK])
GO
ALTER TABLE [Finance].[EarnedPremiumDetail] CHECK CONSTRAINT [FK_AgencySK_EarnedPremiumDetail]
GO
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH CHECK ADD  CONSTRAINT [FK_ClaimTransactionTypeSK_EarnedPremiumDetail] FOREIGN KEY([ClaimTransactionTypeSK])
REFERENCES [TypeList].[ClaimTransactionType] ([ClaimTransactionTypeSK])
GO
ALTER TABLE [Finance].[EarnedPremiumDetail] CHECK CONSTRAINT [FK_ClaimTransactionTypeSK_EarnedPremiumDetail]
GO
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH CHECK ADD  CONSTRAINT [FK_CurrencySK_EarnedPremiumDetail] FOREIGN KEY([CurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[EarnedPremiumDetail] CHECK CONSTRAINT [FK_CurrencySK_EarnedPremiumDetail]
GO
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH CHECK ADD  CONSTRAINT [FK_EarnedPremiumHeaderSK_EarnedPremiumDetail] FOREIGN KEY([EarnedPremiumHeaderSK])
REFERENCES [Finance].[EarnedPremiumHeader] ([EarnedPremiumHeaderSK])
GO
ALTER TABLE [Finance].[EarnedPremiumDetail] CHECK CONSTRAINT [FK_EarnedPremiumHeaderSK_EarnedPremiumDetail]
GO
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH CHECK ADD  CONSTRAINT [FK_FinancialReportingPeriodSK_EarnedPremiumDetail] FOREIGN KEY([FinancialReportingPeriodSK])
REFERENCES [TypeList].[FinancialReportingPeriod] ([FinancialReportingPeriodSK])
GO
ALTER TABLE [Finance].[EarnedPremiumDetail] CHECK CONSTRAINT [FK_FinancialReportingPeriodSK_EarnedPremiumDetail]
GO
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH CHECK ADD  CONSTRAINT [FK_InsuredSK_EarnedPremiumDetail] FOREIGN KEY([InsuredSK])
REFERENCES [Party].[Insured] ([InsuredSK])
GO
ALTER TABLE [Finance].[EarnedPremiumDetail] CHECK CONSTRAINT [FK_InsuredSK_EarnedPremiumDetail]
GO
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH CHECK ADD  CONSTRAINT [FK_PolicyCoverageSK_EarnedPremiumDetail] FOREIGN KEY([PolicyCoverageSK])
REFERENCES [Policy].[PolicyCoverage] ([PolicyCoverageSK])
GO
ALTER TABLE [Finance].[EarnedPremiumDetail] CHECK CONSTRAINT [FK_PolicyCoverageSK_EarnedPremiumDetail]
GO
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH CHECK ADD  CONSTRAINT [FK_PolicyGeographySK_EarnedPremiumDetail] FOREIGN KEY([PolicyGeographySK])
REFERENCES [Policy].[PolicyGeography] ([PolicyGeographySK])
GO
ALTER TABLE [Finance].[EarnedPremiumDetail] CHECK CONSTRAINT [FK_PolicyGeographySK_EarnedPremiumDetail]
GO
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH CHECK ADD  CONSTRAINT [FK_PolicySK_EarnedPremiumDetail] FOREIGN KEY([PolicySK])
REFERENCES [Policy].[Policy] ([PolicySK])
GO
ALTER TABLE [Finance].[EarnedPremiumDetail] CHECK CONSTRAINT [FK_PolicySK_EarnedPremiumDetail]
GO
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH CHECK ADD  CONSTRAINT [FK_PolicySubCoverageSK_EarnedPremiumDetail] FOREIGN KEY([PolicySubCoverageSK])
REFERENCES [Policy].[PolicySubCoverage] ([PolicySubCoverageSK])
GO
ALTER TABLE [Finance].[EarnedPremiumDetail] CHECK CONSTRAINT [FK_PolicySubCoverageSK_EarnedPremiumDetail]
GO
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH CHECK ADD  CONSTRAINT [FK_PremiumTypeSK_EarnedPremiumDetail] FOREIGN KEY([PremiumTypeSK])
REFERENCES [TypeList].[PremiumType] ([PremiumTypeSK])
GO
ALTER TABLE [Finance].[EarnedPremiumDetail] CHECK CONSTRAINT [FK_PremiumTypeSK_EarnedPremiumDetail]
GO
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH CHECK ADD  CONSTRAINT [FK_ProfitAnalysisSK_EarnedPremiumDetail] FOREIGN KEY([ProfitAnalysisSK])
REFERENCES [TypeList].[ProfitAnalysis] ([ProfitAnalysisSK])
GO
ALTER TABLE [Finance].[EarnedPremiumDetail] CHECK CONSTRAINT [FK_ProfitAnalysisSK_EarnedPremiumDetail]
GO
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_EarnedPremiumDetail] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Finance].[EarnedPremiumDetail] CHECK CONSTRAINT [FK_SourceSystemSK_EarnedPremiumDetail]
GO
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH CHECK ADD  CONSTRAINT [FK_WritingCompanySK_EarnedPremiumDetail] FOREIGN KEY([WritingCompanySK])
REFERENCES [Party].[WritingCompany] ([WritingCompanySK])
GO
ALTER TABLE [Finance].[EarnedPremiumDetail] CHECK CONSTRAINT [FK_WritingCompanySK_EarnedPremiumDetail]
GO
