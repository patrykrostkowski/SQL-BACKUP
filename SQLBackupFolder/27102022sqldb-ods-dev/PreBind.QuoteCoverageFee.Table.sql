USE [sqldb-ods-dev]
GO
/****** Object:  Table [PreBind].[QuoteCoverageFee]    Script Date: 27.10.2022 12:27:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteCoverageFee](
	[QuoteCoverageFeeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteTransSK] [int] NOT NULL,
	[QuoteLineofBusinessSK] [int] NOT NULL,
	[QuoteGeographySK] [int] NULL,
	[QuoteCoverageSK] [int] NOT NULL,
	[FeeLevelTypeSK] [int] NOT NULL,
	[ClassCodeSK] [int] NULL,
	[StatCodeSK] [int] NULL,
	[CoverageFeeTypeSK] [int] NOT NULL,
	[BaseCurrencySK] [int] NOT NULL,
	[CoverageFeeBaseAmt] [decimal](19, 4) NULL,
	[FeeChargeTypeSK] [int] NULL,
	[FeeEffectiveDate] [date] NULL,
	[FeeExpirationDate] [date] NULL,
	[IsSurchargeInd] [tinyint] NOT NULL,
	[IsIncludedInPremiumInd] [tinyint] NOT NULL,
 CONSTRAINT [PK_QuoteCoverageFee] PRIMARY KEY CLUSTERED 
(
	[QuoteCoverageFeeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_QuoteCoverageFee]    Script Date: 27.10.2022 12:28:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_QuoteCoverageFee] ON [PreBind].[QuoteCoverageFee]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteCoverageFee]  WITH NOCHECK ADD  CONSTRAINT [FK_BaseCurrencySK_QuoteCoverageFee] FOREIGN KEY([BaseCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [PreBind].[QuoteCoverageFee] NOCHECK CONSTRAINT [FK_BaseCurrencySK_QuoteCoverageFee]
GO
ALTER TABLE [PreBind].[QuoteCoverageFee]  WITH NOCHECK ADD  CONSTRAINT [FK_ClassCodeSK_QuoteCoverageFee] FOREIGN KEY([ClassCodeSK])
REFERENCES [Typelist].[ClassCode] ([ClassCodeSK])
GO
ALTER TABLE [PreBind].[QuoteCoverageFee] NOCHECK CONSTRAINT [FK_ClassCodeSK_QuoteCoverageFee]
GO
ALTER TABLE [PreBind].[QuoteCoverageFee]  WITH NOCHECK ADD  CONSTRAINT [FK_CoverageFeeTypeSK_QuoteCoverageFee] FOREIGN KEY([CoverageFeeTypeSK])
REFERENCES [Typelist].[CoverageFeeType] ([CoverageFeeTypeSK])
GO
ALTER TABLE [PreBind].[QuoteCoverageFee] NOCHECK CONSTRAINT [FK_CoverageFeeTypeSK_QuoteCoverageFee]
GO
ALTER TABLE [PreBind].[QuoteCoverageFee]  WITH NOCHECK ADD  CONSTRAINT [FK_FeeChargeTypeSK_QuoteCoverageFee] FOREIGN KEY([FeeChargeTypeSK])
REFERENCES [Typelist].[FinancialTransactionType] ([FinancialTransactionTypeSK])
GO
ALTER TABLE [PreBind].[QuoteCoverageFee] NOCHECK CONSTRAINT [FK_FeeChargeTypeSK_QuoteCoverageFee]
GO
ALTER TABLE [PreBind].[QuoteCoverageFee]  WITH NOCHECK ADD  CONSTRAINT [FK_FeeLevelTypeSK_QuoteCoverageFee] FOREIGN KEY([FeeLevelTypeSK])
REFERENCES [Typelist].[LevelType] ([LevelTypeSK])
GO
ALTER TABLE [PreBind].[QuoteCoverageFee] NOCHECK CONSTRAINT [FK_FeeLevelTypeSK_QuoteCoverageFee]
GO
ALTER TABLE [PreBind].[QuoteCoverageFee]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteCoverageSK_QuoteCoverageFee] FOREIGN KEY([QuoteCoverageSK])
REFERENCES [PreBind].[QuoteCoverage] ([QuoteCoverageSK])
GO
ALTER TABLE [PreBind].[QuoteCoverageFee] NOCHECK CONSTRAINT [FK_QuoteCoverageSK_QuoteCoverageFee]
GO
ALTER TABLE [PreBind].[QuoteCoverageFee]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteGeographySK_QuoteCoverageFee] FOREIGN KEY([QuoteGeographySK])
REFERENCES [PreBind].[QuoteGeography] ([QuoteGeographySK])
GO
ALTER TABLE [PreBind].[QuoteCoverageFee] NOCHECK CONSTRAINT [FK_QuoteGeographySK_QuoteCoverageFee]
GO
ALTER TABLE [PreBind].[QuoteCoverageFee]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteLineofBusinessSK_QuoteCoverageFee] FOREIGN KEY([QuoteLineofBusinessSK])
REFERENCES [PreBind].[QuoteLineofBusiness] ([QuoteLineofBusinessSK])
GO
ALTER TABLE [PreBind].[QuoteCoverageFee] NOCHECK CONSTRAINT [FK_QuoteLineofBusinessSK_QuoteCoverageFee]
GO
ALTER TABLE [PreBind].[QuoteCoverageFee]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteTransSK_QuoteCoverageFee] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
ALTER TABLE [PreBind].[QuoteCoverageFee] NOCHECK CONSTRAINT [FK_QuoteTransSK_QuoteCoverageFee]
GO
ALTER TABLE [PreBind].[QuoteCoverageFee]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteCoverageFee] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteCoverageFee] NOCHECK CONSTRAINT [FK_SourceSystemSK_QuoteCoverageFee]
GO
ALTER TABLE [PreBind].[QuoteCoverageFee]  WITH NOCHECK ADD  CONSTRAINT [FK_StatCodeSK_QuoteCoverageFee] FOREIGN KEY([StatCodeSK])
REFERENCES [Typelist].[StatCode] ([StatCodeSK])
GO
ALTER TABLE [PreBind].[QuoteCoverageFee] NOCHECK CONSTRAINT [FK_StatCodeSK_QuoteCoverageFee]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the miscellanous fees associated with a coverage.  These may not be excluded from  premiums' , @level0type=N'SCHEMA',@level0name=N'PreBind', @level1type=N'TABLE',@level1name=N'QuoteCoverageFee'
GO
