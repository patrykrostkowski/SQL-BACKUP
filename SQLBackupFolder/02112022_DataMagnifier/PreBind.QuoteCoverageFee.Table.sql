USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteCoverageFee]    Script Date: 02.11.2022 14:57:42 ******/
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
	[QuoteCoverageSK] [int] NOT NULL,
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
ALTER TABLE [PreBind].[QuoteCoverageFee]  WITH CHECK ADD  CONSTRAINT [FK_BaseCurrencySK_QuoteCoverageFee] FOREIGN KEY([BaseCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [PreBind].[QuoteCoverageFee] CHECK CONSTRAINT [FK_BaseCurrencySK_QuoteCoverageFee]
GO
ALTER TABLE [PreBind].[QuoteCoverageFee]  WITH CHECK ADD  CONSTRAINT [FK_CoverageFeeTypeSK_QuoteCoverageFee] FOREIGN KEY([CoverageFeeTypeSK])
REFERENCES [TypeList].[CoverageFeeType] ([CoverageFeeTypeSK])
GO
ALTER TABLE [PreBind].[QuoteCoverageFee] CHECK CONSTRAINT [FK_CoverageFeeTypeSK_QuoteCoverageFee]
GO
ALTER TABLE [PreBind].[QuoteCoverageFee]  WITH CHECK ADD  CONSTRAINT [FK_FeeChargeTypeSK_QuoteCoverageFee] FOREIGN KEY([FeeChargeTypeSK])
REFERENCES [TypeList].[RevenueCode] ([RevenueCodeSK])
GO
ALTER TABLE [PreBind].[QuoteCoverageFee] CHECK CONSTRAINT [FK_FeeChargeTypeSK_QuoteCoverageFee]
GO
ALTER TABLE [PreBind].[QuoteCoverageFee]  WITH CHECK ADD  CONSTRAINT [FK_QuoteCoverageSK_QuoteCoverageFee] FOREIGN KEY([QuoteCoverageSK])
REFERENCES [PreBind].[QuoteCoverage] ([QuoteCoverageSK])
GO
ALTER TABLE [PreBind].[QuoteCoverageFee] CHECK CONSTRAINT [FK_QuoteCoverageSK_QuoteCoverageFee]
GO
ALTER TABLE [PreBind].[QuoteCoverageFee]  WITH CHECK ADD  CONSTRAINT [FK_QuoteTransSK_QuoteCoverageFee] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
ALTER TABLE [PreBind].[QuoteCoverageFee] CHECK CONSTRAINT [FK_QuoteTransSK_QuoteCoverageFee]
GO
ALTER TABLE [PreBind].[QuoteCoverageFee]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteCoverageFee] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteCoverageFee] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteCoverageFee]
GO
