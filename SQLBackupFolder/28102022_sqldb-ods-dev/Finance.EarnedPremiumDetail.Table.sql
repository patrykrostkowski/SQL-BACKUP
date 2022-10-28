USE [sqldb-ods-dev]
GO
/****** Object:  Table [Finance].[EarnedPremiumDetail]    Script Date: 28.10.2022 12:26:24 ******/
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
	[FinancialReportingPeriodSK] [int] NULL,
	[PolicySK] [int] NOT NULL,
	[PolicyTransSK] [int] NOT NULL,
	[PolicyTransTypeSK] [int] NOT NULL,
	[LineofBusinessSK] [int] NOT NULL,
	[CoverageSK] [int] NULL,
	[AnnualStatementLineofBusinessSK] [int] NULL,
	[ClassCodeSK] [int] NULL,
	[StatCodeSK] [int] NULL,
	[SubCoverageSK] [int] NULL,
	[CountrySK] [int] NOT NULL,
	[StateSK] [int] NOT NULL,
	[InsuredSK] [int] NULL,
	[AgencySK] [int] NOT NULL,
	[WritingCompanySK] [int] NULL,
	[ProfitAnalysisSK] [int] NULL,
	[BaseCurrencySK] [int] NULL,
	[IsFullyEarnedInd] [tinyint] NULL,
	[IsPremiumWaivedInd] [tinyint] NULL,
	[IsIncludedInPremiumInd] [tinyint] NULL,
	[DirectWrittenPremiumBaseAmt] [decimal](19, 4) NULL,
	[DirectTaxBaseAmt] [decimal](19, 4) NULL,
	[DirectSurchargeBaseAmt] [decimal](19, 4) NULL,
	[DirectFeeBaseAmt] [decimal](19, 4) NULL,
	[DirectWrittenPremiumITDBaseAmt] [decimal](19, 4) NULL,
	[DirectTaxSurchargeFeeITDBaseAmt] [decimal](19, 4) NULL,
	[DirectEarnedPremiumBaseAmt] [decimal](19, 4) NULL,
	[DirectEarnedTaxSurchargeFeeBaseAmt] [decimal](19, 4) NULL,
	[DirectUnearnedPremiumBaseAmt] [numeric](19, 4) NULL,
	[DirectUnearnedTaxSurchargeFeeBaseAmt] [decimal](19, 4) NULL,
	[AssumedWrittenPremiumBaseAmt] [decimal](19, 4) NULL,
	[AssumedTaxBaseAmt] [decimal](19, 4) NULL,
	[AssumedFeeBaseAmt] [decimal](19, 4) NULL,
	[AssumedSurchargeBaseAmt] [decimal](19, 4) NULL,
	[AssumedWrittenPremiumITDBaseAmt] [decimal](19, 4) NULL,
	[AssumedTaxSurchargeFeeITDBaseAmt] [decimal](19, 4) NULL,
	[AssumedEarnedPremiumBaseAmt] [decimal](19, 4) NULL,
	[AssumedEarnedTaxSurchargeFeeBaseAmt] [decimal](19, 4) NULL,
	[AssumedUnearnedPremiumBaseAmt] [decimal](19, 4) NULL,
	[AssumedUnearnedTaxSurchargeFeeBaseAmt] [decimal](19, 4) NULL,
	[CededPremiumBaseAmt] [decimal](19, 4) NULL,
	[CededEarnedPremiumBaseAmt] [decimal](19, 4) NULL,
	[CededUnearnedPremiumBaseAmt] [decimal](19, 4) NULL,
	[CommissionBaseAmt] [decimal](19, 4) NULL,
	[EarnedCommissionBaseAmt] [decimal](19, 4) NULL,
	[UnEarnedCommissionBaseAmt] [decimal](19, 4) NULL,
	[CommissionPct] [decimal](6, 4) NULL,
	[DirectExposureBaseAmt] [decimal](19, 4) NULL,
	[AssumedExposureBaseAmt] [decimal](19, 4) NULL,
	[EarnedExposureBaseAmt] [decimal](19, 4) NULL,
	[UnearnedExposureBaseAmt] [decimal](19, 4) NULL,
 CONSTRAINT [PK_EarnedPremiumDetail] PRIMARY KEY CLUSTERED 
(
	[EarnedPremiumDetailSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_EarnedPremiumDetail]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_EarnedPremiumDetail] ON [Finance].[EarnedPremiumDetail]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH NOCHECK ADD  CONSTRAINT [FJ_CoverageSK_EarnedPremiumDetail] FOREIGN KEY([CoverageSK])
REFERENCES [Typelist].[Coverage] ([CoverageSK])
GO
ALTER TABLE [Finance].[EarnedPremiumDetail] NOCHECK CONSTRAINT [FJ_CoverageSK_EarnedPremiumDetail]
GO
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_AgencySK_EarnedPremiumDetail] FOREIGN KEY([AgencySK])
REFERENCES [Party].[Agency] ([AgencySK])
GO
ALTER TABLE [Finance].[EarnedPremiumDetail] NOCHECK CONSTRAINT [FK_AgencySK_EarnedPremiumDetail]
GO
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_AnnualStatementLineSK_EarnedPremiumDetail] FOREIGN KEY([AnnualStatementLineofBusinessSK])
REFERENCES [Typelist].[AnnualStatementLineofBusiness] ([AnnualStatementLineofBusinessSK])
GO
ALTER TABLE [Finance].[EarnedPremiumDetail] NOCHECK CONSTRAINT [FK_AnnualStatementLineSK_EarnedPremiumDetail]
GO
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_ClassCodeSK_EarnedPremiumDetail] FOREIGN KEY([ClassCodeSK])
REFERENCES [Typelist].[ClassCode] ([ClassCodeSK])
GO
ALTER TABLE [Finance].[EarnedPremiumDetail] NOCHECK CONSTRAINT [FK_ClassCodeSK_EarnedPremiumDetail]
GO
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_CountrySK_EarnedPremiumDetail] FOREIGN KEY([CountrySK])
REFERENCES [Typelist].[Country] ([CountrySK])
GO
ALTER TABLE [Finance].[EarnedPremiumDetail] NOCHECK CONSTRAINT [FK_CountrySK_EarnedPremiumDetail]
GO
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_CurrencySK_EarnedPremiumDetail] FOREIGN KEY([BaseCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[EarnedPremiumDetail] NOCHECK CONSTRAINT [FK_CurrencySK_EarnedPremiumDetail]
GO
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_FinancialReportingPeriodSK_EarnedPremiumDetail] FOREIGN KEY([FinancialReportingPeriodSK])
REFERENCES [Typelist].[FinancialReportingPeriod] ([FinancialReportingPeriodSK])
GO
ALTER TABLE [Finance].[EarnedPremiumDetail] NOCHECK CONSTRAINT [FK_FinancialReportingPeriodSK_EarnedPremiumDetail]
GO
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_InsuredSK_EarnedPremiumDetail] FOREIGN KEY([InsuredSK])
REFERENCES [Party].[Insured] ([InsuredSK])
GO
ALTER TABLE [Finance].[EarnedPremiumDetail] NOCHECK CONSTRAINT [FK_InsuredSK_EarnedPremiumDetail]
GO
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_LineofBusinessSK_EarnedPremiumDetail] FOREIGN KEY([LineofBusinessSK])
REFERENCES [Typelist].[LineofBusiness] ([LineofBusinessSK])
GO
ALTER TABLE [Finance].[EarnedPremiumDetail] NOCHECK CONSTRAINT [FK_LineofBusinessSK_EarnedPremiumDetail]
GO
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicySK_EarnedPremiumDetail] FOREIGN KEY([PolicySK])
REFERENCES [Policy].[Policy] ([PolicySK])
GO
ALTER TABLE [Finance].[EarnedPremiumDetail] NOCHECK CONSTRAINT [FK_PolicySK_EarnedPremiumDetail]
GO
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyTransSK_EarnedPremiumDetail] FOREIGN KEY([PolicyTransSK])
REFERENCES [Policy].[PolicyTrans] ([PolicyTransSK])
GO
ALTER TABLE [Finance].[EarnedPremiumDetail] NOCHECK CONSTRAINT [FK_PolicyTransSK_EarnedPremiumDetail]
GO
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyTransTypeSK_EarnedPremiumDetail] FOREIGN KEY([PolicyTransTypeSK])
REFERENCES [Typelist].[PolicyTransType] ([PolicyTransTypeSK])
GO
ALTER TABLE [Finance].[EarnedPremiumDetail] NOCHECK CONSTRAINT [FK_PolicyTransTypeSK_EarnedPremiumDetail]
GO
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_ProfitAnalysisSK_EarnedPremiumDetail] FOREIGN KEY([ProfitAnalysisSK])
REFERENCES [Typelist].[ProfitAnalysis] ([ProfitAnalysisSK])
GO
ALTER TABLE [Finance].[EarnedPremiumDetail] NOCHECK CONSTRAINT [FK_ProfitAnalysisSK_EarnedPremiumDetail]
GO
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_EarnedPremiumDetail] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Finance].[EarnedPremiumDetail] NOCHECK CONSTRAINT [FK_SourceSystemSK_EarnedPremiumDetail]
GO
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_StatCodeSK_EarnedPremiumDetail] FOREIGN KEY([StatCodeSK])
REFERENCES [Typelist].[StatCode] ([StatCodeSK])
GO
ALTER TABLE [Finance].[EarnedPremiumDetail] NOCHECK CONSTRAINT [FK_StatCodeSK_EarnedPremiumDetail]
GO
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_StateSK_EarnedPremiumDetail] FOREIGN KEY([StateSK])
REFERENCES [Typelist].[State] ([StateSK])
GO
ALTER TABLE [Finance].[EarnedPremiumDetail] NOCHECK CONSTRAINT [FK_StateSK_EarnedPremiumDetail]
GO
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_SubCoverageSK_EarnedPremiumDetail] FOREIGN KEY([SubCoverageSK])
REFERENCES [Typelist].[SubCoverage] ([SubCoverageSK])
GO
ALTER TABLE [Finance].[EarnedPremiumDetail] NOCHECK CONSTRAINT [FK_SubCoverageSK_EarnedPremiumDetail]
GO
ALTER TABLE [Finance].[EarnedPremiumDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_WritingCompanySK_EarnedPremiumDetail] FOREIGN KEY([WritingCompanySK])
REFERENCES [Party].[WritingCompany] ([WritingCompanySK])
GO
ALTER TABLE [Finance].[EarnedPremiumDetail] NOCHECK CONSTRAINT [FK_WritingCompanySK_EarnedPremiumDetail]
GO
