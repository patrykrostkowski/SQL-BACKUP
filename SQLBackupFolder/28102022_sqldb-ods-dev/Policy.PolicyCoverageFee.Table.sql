USE [sqldb-ods-dev]
GO
/****** Object:  Table [Policy].[PolicyCoverageFee]    Script Date: 28.10.2022 12:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[PolicyCoverageFee](
	[PolicyCoverageFeeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PolicyTransSK] [int] NOT NULL,
	[PolicyLineofBusinessSK] [int] NOT NULL,
	[PolicyGeographySK] [int] NULL,
	[PolicyCoverageSK] [int] NULL,
	[ClassCodeSK] [int] NULL,
	[StatCodeSK] [int] NULL,
	[FeeLevelTypeSK] [int] NULL,
	[CoverageFeeTypeSK] [int] NOT NULL,
	[BaseCurrencySK] [int] NULL,
	[OriginalCurrencySK] [int] NULL,
	[ReportingCurrencySK] [int] NULL,
	[CoverageFeeBaseAmt] [decimal](19, 4) NULL,
	[CoverageFeeOriginalAmt] [decimal](19, 4) NULL,
	[CoverageFeeReportingAmt] [decimal](19, 4) NULL,
	[FeeEffectiveDate] [date] NULL,
	[FeeExpirationDate] [date] NULL,
	[FeeChargeTypeSK] [int] NULL,
	[IsSurchargeInd] [tinyint] NOT NULL,
	[IsIncludedInPremiumInd] [tinyint] NOT NULL,
	[IsFullyEarnedInd] [tinyint] NULL,
 CONSTRAINT [PK_PolicyCoverageFee] PRIMARY KEY CLUSTERED 
(
	[PolicyCoverageFeeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_PolicyCoverageFee]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_PolicyCoverageFee] ON [Policy].[PolicyCoverageFee]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Policy].[PolicyCoverageFee]  WITH NOCHECK ADD  CONSTRAINT [FK_BaseCurrencySK_PolicyCoverageFee] FOREIGN KEY([BaseCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[PolicyCoverageFee] NOCHECK CONSTRAINT [FK_BaseCurrencySK_PolicyCoverageFee]
GO
ALTER TABLE [Policy].[PolicyCoverageFee]  WITH NOCHECK ADD  CONSTRAINT [FK_ClassCodeSK_PolicyCoverageFee] FOREIGN KEY([ClassCodeSK])
REFERENCES [Typelist].[ClassCode] ([ClassCodeSK])
GO
ALTER TABLE [Policy].[PolicyCoverageFee] NOCHECK CONSTRAINT [FK_ClassCodeSK_PolicyCoverageFee]
GO
ALTER TABLE [Policy].[PolicyCoverageFee]  WITH NOCHECK ADD  CONSTRAINT [FK_CoverageFeeTypeSK_PolicyCoverageFee] FOREIGN KEY([CoverageFeeTypeSK])
REFERENCES [Typelist].[CoverageFeeType] ([CoverageFeeTypeSK])
GO
ALTER TABLE [Policy].[PolicyCoverageFee] NOCHECK CONSTRAINT [FK_CoverageFeeTypeSK_PolicyCoverageFee]
GO
ALTER TABLE [Policy].[PolicyCoverageFee]  WITH NOCHECK ADD  CONSTRAINT [FK_FeeChargeTypeSK_PolicyCoverageFee] FOREIGN KEY([FeeChargeTypeSK])
REFERENCES [Typelist].[FinancialTransactionType] ([FinancialTransactionTypeSK])
GO
ALTER TABLE [Policy].[PolicyCoverageFee] NOCHECK CONSTRAINT [FK_FeeChargeTypeSK_PolicyCoverageFee]
GO
ALTER TABLE [Policy].[PolicyCoverageFee]  WITH NOCHECK ADD  CONSTRAINT [FK_FeeLevelTypeSK_PolicyCoverageFee] FOREIGN KEY([FeeLevelTypeSK])
REFERENCES [Typelist].[LevelType] ([LevelTypeSK])
GO
ALTER TABLE [Policy].[PolicyCoverageFee] NOCHECK CONSTRAINT [FK_FeeLevelTypeSK_PolicyCoverageFee]
GO
ALTER TABLE [Policy].[PolicyCoverageFee]  WITH NOCHECK ADD  CONSTRAINT [FK_OriginalCurrencySK_PolicyCoverageFee] FOREIGN KEY([OriginalCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[PolicyCoverageFee] NOCHECK CONSTRAINT [FK_OriginalCurrencySK_PolicyCoverageFee]
GO
ALTER TABLE [Policy].[PolicyCoverageFee]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyCoverageSK_PolicyCoverageFee] FOREIGN KEY([PolicyCoverageSK])
REFERENCES [Policy].[PolicyCoverage] ([PolicyCoverageSK])
GO
ALTER TABLE [Policy].[PolicyCoverageFee] NOCHECK CONSTRAINT [FK_PolicyCoverageSK_PolicyCoverageFee]
GO
ALTER TABLE [Policy].[PolicyCoverageFee]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyGeographySK_PolicyCoverageFee] FOREIGN KEY([PolicyGeographySK])
REFERENCES [Policy].[PolicyGeography] ([PolicyGeographySK])
GO
ALTER TABLE [Policy].[PolicyCoverageFee] NOCHECK CONSTRAINT [FK_PolicyGeographySK_PolicyCoverageFee]
GO
ALTER TABLE [Policy].[PolicyCoverageFee]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyLineofBusinessSK_PolicyCoverageFee] FOREIGN KEY([PolicyLineofBusinessSK])
REFERENCES [Policy].[PolicyLineofBusiness] ([PolicyLineofBusinessSK])
GO
ALTER TABLE [Policy].[PolicyCoverageFee] NOCHECK CONSTRAINT [FK_PolicyLineofBusinessSK_PolicyCoverageFee]
GO
ALTER TABLE [Policy].[PolicyCoverageFee]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyTransSK_PolicyCoverageFee] FOREIGN KEY([PolicyTransSK])
REFERENCES [Policy].[PolicyTrans] ([PolicyTransSK])
GO
ALTER TABLE [Policy].[PolicyCoverageFee] NOCHECK CONSTRAINT [FK_PolicyTransSK_PolicyCoverageFee]
GO
ALTER TABLE [Policy].[PolicyCoverageFee]  WITH NOCHECK ADD  CONSTRAINT [FK_ReportingCurrencySK_PolicyCoverageFee] FOREIGN KEY([ReportingCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[PolicyCoverageFee] NOCHECK CONSTRAINT [FK_ReportingCurrencySK_PolicyCoverageFee]
GO
ALTER TABLE [Policy].[PolicyCoverageFee]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyCoverageFee] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[PolicyCoverageFee] NOCHECK CONSTRAINT [FK_SourceSystemSK_PolicyCoverageFee]
GO
ALTER TABLE [Policy].[PolicyCoverageFee]  WITH NOCHECK ADD  CONSTRAINT [FK_StatCodeSK_PolicyCoverageFee] FOREIGN KEY([StatCodeSK])
REFERENCES [Typelist].[StatCode] ([StatCodeSK])
GO
ALTER TABLE [Policy].[PolicyCoverageFee] NOCHECK CONSTRAINT [FK_StatCodeSK_PolicyCoverageFee]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the miscellaneous taxes, surcharges or fees associated with a coverage.  These may not be excluded from  premiums
' , @level0type=N'SCHEMA',@level0name=N'Policy', @level1type=N'TABLE',@level1name=N'PolicyCoverageFee'
GO
