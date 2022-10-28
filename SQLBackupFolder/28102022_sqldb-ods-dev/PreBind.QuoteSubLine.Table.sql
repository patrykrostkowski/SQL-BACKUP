USE [sqldb-ods-dev]
GO
/****** Object:  Table [PreBind].[QuoteSubLine]    Script Date: 28.10.2022 12:26:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteSubLine](
	[QuoteSubLineSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[Sourcecode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[SublineSK] [int] NOT NULL,
	[QuoteLineofBusinessSK] [int] NOT NULL,
	[AddlRetPremAmt] [decimal](19, 4) NULL,
	[WrittenPremiumAmt] [decimal](19, 4) NULL,
	[AnnualPremiumAmt] [decimal](19, 4) NULL,
	[TermPremiumAmt] [decimal](19, 4) NULL,
	[ManualPremAmt] [decimal](19, 4) NULL,
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
	[ModifiedPremAmt] [decimal](19, 4) NULL,
 CONSTRAINT [PK_QuoteSubLine] PRIMARY KEY CLUSTERED 
(
	[QuoteSubLineSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_QuoteSubLine]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_QuoteSubLine] ON [PreBind].[QuoteSubLine]
(
	[SourceSystemSK] ASC,
	[Sourcecode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteSubLine]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteLineofBusinessSK_QuoteSubLine] FOREIGN KEY([QuoteLineofBusinessSK])
REFERENCES [PreBind].[QuoteLineofBusiness] ([QuoteLineofBusinessSK])
GO
ALTER TABLE [PreBind].[QuoteSubLine] NOCHECK CONSTRAINT [FK_QuoteLineofBusinessSK_QuoteSubLine]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quote Sub Line' , @level0type=N'SCHEMA',@level0name=N'PreBind', @level1type=N'TABLE',@level1name=N'QuoteSubLine'
GO
