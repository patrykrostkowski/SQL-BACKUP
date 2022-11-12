USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteLineofBusiness]    Script Date: 12.11.2022 09:01:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PreBind].[QuoteLineofBusiness]') AND type in (N'U'))
BEGIN
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
	[SubLineCode] [varchar](255) NULL,
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_BaseCurrencySK_QuoteLineofBusiness]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteLineofBusiness]'))
ALTER TABLE [PreBind].[QuoteLineofBusiness]  WITH CHECK ADD  CONSTRAINT [FK_BaseCurrencySK_QuoteLineofBusiness] FOREIGN KEY([BaseCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_BaseCurrencySK_QuoteLineofBusiness]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteLineofBusiness]'))
ALTER TABLE [PreBind].[QuoteLineofBusiness] CHECK CONSTRAINT [FK_BaseCurrencySK_QuoteLineofBusiness]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteTransSK_QuoteLineofBusiness]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteLineofBusiness]'))
ALTER TABLE [PreBind].[QuoteLineofBusiness]  WITH CHECK ADD  CONSTRAINT [FK_QuoteTransSK_QuoteLineofBusiness] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteTransSK_QuoteLineofBusiness]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteLineofBusiness]'))
ALTER TABLE [PreBind].[QuoteLineofBusiness] CHECK CONSTRAINT [FK_QuoteTransSK_QuoteLineofBusiness]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SourceSystemSK_QuoteLineofBusiness]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteLineofBusiness]'))
ALTER TABLE [PreBind].[QuoteLineofBusiness]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteLineofBusiness] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SourceSystemSK_QuoteLineofBusiness]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteLineofBusiness]'))
ALTER TABLE [PreBind].[QuoteLineofBusiness] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteLineofBusiness]
GO
