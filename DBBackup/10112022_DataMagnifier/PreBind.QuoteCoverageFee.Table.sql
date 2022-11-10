USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteCoverageFee]    Script Date: 10.11.2022 14:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PreBind].[QuoteCoverageFee]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_BaseCurrencySK_QuoteCoverageFee]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteCoverageFee]'))
ALTER TABLE [PreBind].[QuoteCoverageFee]  WITH CHECK ADD  CONSTRAINT [FK_BaseCurrencySK_QuoteCoverageFee] FOREIGN KEY([BaseCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_BaseCurrencySK_QuoteCoverageFee]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteCoverageFee]'))
ALTER TABLE [PreBind].[QuoteCoverageFee] CHECK CONSTRAINT [FK_BaseCurrencySK_QuoteCoverageFee]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_CoverageFeeTypeSK_QuoteCoverageFee]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteCoverageFee]'))
ALTER TABLE [PreBind].[QuoteCoverageFee]  WITH CHECK ADD  CONSTRAINT [FK_CoverageFeeTypeSK_QuoteCoverageFee] FOREIGN KEY([CoverageFeeTypeSK])
REFERENCES [TypeList].[CoverageFeeType] ([CoverageFeeTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_CoverageFeeTypeSK_QuoteCoverageFee]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteCoverageFee]'))
ALTER TABLE [PreBind].[QuoteCoverageFee] CHECK CONSTRAINT [FK_CoverageFeeTypeSK_QuoteCoverageFee]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_FeeChargeTypeSK_QuoteCoverageFee]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteCoverageFee]'))
ALTER TABLE [PreBind].[QuoteCoverageFee]  WITH CHECK ADD  CONSTRAINT [FK_FeeChargeTypeSK_QuoteCoverageFee] FOREIGN KEY([FeeChargeTypeSK])
REFERENCES [TypeList].[RevenueCode] ([RevenueCodeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_FeeChargeTypeSK_QuoteCoverageFee]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteCoverageFee]'))
ALTER TABLE [PreBind].[QuoteCoverageFee] CHECK CONSTRAINT [FK_FeeChargeTypeSK_QuoteCoverageFee]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteCoverageSK_QuoteCoverageFee]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteCoverageFee]'))
ALTER TABLE [PreBind].[QuoteCoverageFee]  WITH CHECK ADD  CONSTRAINT [FK_QuoteCoverageSK_QuoteCoverageFee] FOREIGN KEY([QuoteCoverageSK])
REFERENCES [PreBind].[QuoteCoverage] ([QuoteCoverageSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteCoverageSK_QuoteCoverageFee]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteCoverageFee]'))
ALTER TABLE [PreBind].[QuoteCoverageFee] CHECK CONSTRAINT [FK_QuoteCoverageSK_QuoteCoverageFee]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteTransSK_QuoteCoverageFee]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteCoverageFee]'))
ALTER TABLE [PreBind].[QuoteCoverageFee]  WITH CHECK ADD  CONSTRAINT [FK_QuoteTransSK_QuoteCoverageFee] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteTransSK_QuoteCoverageFee]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteCoverageFee]'))
ALTER TABLE [PreBind].[QuoteCoverageFee] CHECK CONSTRAINT [FK_QuoteTransSK_QuoteCoverageFee]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SourceSystemSK_QuoteCoverageFee]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteCoverageFee]'))
ALTER TABLE [PreBind].[QuoteCoverageFee]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteCoverageFee] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SourceSystemSK_QuoteCoverageFee]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteCoverageFee]'))
ALTER TABLE [PreBind].[QuoteCoverageFee] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteCoverageFee]
GO
