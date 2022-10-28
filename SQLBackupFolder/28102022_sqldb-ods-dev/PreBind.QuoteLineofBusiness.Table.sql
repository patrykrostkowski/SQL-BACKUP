USE [sqldb-ods-dev]
GO
/****** Object:  Table [PreBind].[QuoteLineofBusiness]    Script Date: 28.10.2022 12:26:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteLineofBusiness](
	[QuoteLineofBusinessSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[LineofBusinessSK] [int] NOT NULL,
	[QuoteTransSK] [int] NOT NULL,
	[BaseCurrencySK] [int] NOT NULL,
	[AddlRetPremAmt] [decimal](19, 4) NULL,
	[WrittenPremiumBaseAmt] [decimal](19, 4) NULL,
	[AnnualPremiumBaseAmt] [decimal](19, 4) NULL,
	[TermPremiumBaseAmt] [decimal](19, 4) NULL,
	[ManualPremBaseAmt] [decimal](19, 4) NULL,
	[ModifiedPremiumBaseAmt] [decimal](19, 4) NULL,
	[IsPremiumWaivedInd] [tinyint] NULL,
	[CommissionPct] [decimal](8, 2) NULL,
	[CommissionAmt] [decimal](19, 4) NULL,
	[OOSOffsetPremiumAmt] [decimal](19, 4) NULL,
	[OOSFuturePremiumAmt] [decimal](19, 4) NULL,
	[SplitNum] [int] NULL,
	[SplitEffectiveDate] [date] NULL,
	[SplitExpirationDate] [date] NULL,
	[RateEffectiveDate] [date] NULL,
	[IsSplitRateInd] [tinyint] NULL,
	[IsBillingWaivePremiumInd] [tinyint] NULL,
	[IsBillingWaivePremiumOverrideInd] [tinyint] NULL,
	[IsFacReinsuranceInd] [tinyint] NULL,
	[UnderlyingInfoDesc] [varchar](255) NULL,
	[MaxCommissionPct] [decimal](8, 2) NULL,
 CONSTRAINT [PK_QuoteLineofBusiness] PRIMARY KEY CLUSTERED 
(
	[QuoteLineofBusinessSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_QuoteLineofBusiness]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_QuoteLineofBusiness] ON [PreBind].[QuoteLineofBusiness]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteLineofBusiness]  WITH NOCHECK ADD  CONSTRAINT [FK_BaseCurrencySK_QuoteLineofBusiness] FOREIGN KEY([BaseCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [PreBind].[QuoteLineofBusiness] NOCHECK CONSTRAINT [FK_BaseCurrencySK_QuoteLineofBusiness]
GO
ALTER TABLE [PreBind].[QuoteLineofBusiness]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteTransSK_QuoteLineofBusiness] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
ALTER TABLE [PreBind].[QuoteLineofBusiness] NOCHECK CONSTRAINT [FK_QuoteTransSK_QuoteLineofBusiness]
GO
ALTER TABLE [PreBind].[QuoteLineofBusiness]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteLineofBusiness] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteLineofBusiness] NOCHECK CONSTRAINT [FK_SourceSystemSK_QuoteLineofBusiness]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A general classification that represents an organization,sub-organization or  the product specification that defines and manages the risk.    Examples include Commerical property, Personal Vehicle, Excess and Surplus (E&S), Inland Marine...' , @level0type=N'SCHEMA',@level0name=N'PreBind', @level1type=N'TABLE',@level1name=N'QuoteLineofBusiness'
GO
