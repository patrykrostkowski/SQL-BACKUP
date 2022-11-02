USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteSubLine]    Script Date: 02.11.2022 14:37:23 ******/
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
ALTER TABLE [PreBind].[QuoteSubLine]  WITH CHECK ADD  CONSTRAINT [FK_QuoteLineofBusinessSK_QuoteSubLine] FOREIGN KEY([QuoteLineofBusinessSK])
REFERENCES [PreBind].[QuoteLineofBusiness] ([QuoteLineofBusinessSK])
GO
ALTER TABLE [PreBind].[QuoteSubLine] CHECK CONSTRAINT [FK_QuoteLineofBusinessSK_QuoteSubLine]
GO
