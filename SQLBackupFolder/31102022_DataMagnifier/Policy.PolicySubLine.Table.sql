USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[PolicySubLine]    Script Date: 31.10.2022 12:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[PolicySubLine](
	[PolicySubLineSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[Sourcecode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[SublineSK] [int] NOT NULL,
	[PolicyLineofBusinessSK] [int] NOT NULL,
	[BaseCurrencySK] [int] NULL,
	[OriginalCurrencySK] [int] NULL,
	[ReportingCurrencySK] [int] NULL,
	[WrittenPremiumBaseAmt] [decimal](19, 4) NULL,
	[WrittenPremiumOriginalAmt] [decimal](19, 4) NULL,
	[WrittenPremiumReportingAmt] [decimal](19, 4) NULL,
	[AddlRetPremiumBaseAmt] [decimal](19, 4) NULL,
	[AddlRetPremiumOriginalAmt] [decimal](19, 4) NULL,
	[AddlRetPremiumReportingAmt] [decimal](19, 4) NULL,
	[AnnualPremiumBaseAmt] [decimal](19, 4) NULL,
	[AnnualPremiumOriginaAmt] [decimal](19, 4) NULL,
	[AnnualPremiumReportingAmt] [decimal](19, 4) NULL,
	[TermPremiumBaseAmt] [decimal](19, 4) NULL,
	[TermPremiumOriginalAmt] [decimal](19, 4) NULL,
	[TermPremiumReportingAmt] [decimal](19, 4) NULL,
	[ManualPremiumBaseAmt] [decimal](19, 4) NULL,
	[ManualPremiumOriginalAmt] [decimal](19, 4) NULL,
	[ManualPremiumReportingAmt] [decimal](19, 4) NULL,
	[IsPremiumWaivedInd] [tinyint] NULL,
	[CommissionPct] [decimal](8, 2) NULL,
	[CommissionBaseAmt] [decimal](19, 4) NULL,
	[CommissionOriginalAmt] [decimal](19, 4) NULL,
	[CommissionReportingAmt] [decimal](19, 4) NULL,
	[OOSOffsetPremiumBaseAmt] [decimal](19, 4) NULL,
	[OOSOffsetPremiumOriginalAmt] [decimal](19, 4) NULL,
	[OOSOffsetPremiumReportingAmt] [decimal](19, 4) NULL,
	[OOSFuturePremiumBaseAmt] [decimal](19, 4) NULL,
	[OOSFuturePremiumOriginalAmt] [decimal](19, 4) NULL,
	[OOSFuturePremiumReportingAmt] [decimal](19, 4) NULL,
	[SplitNum] [int] NULL,
	[SplitEffectiveDate] [date] NULL,
	[SplitExpirationDate] [date] NULL,
	[RateEffectiveDate] [date] NULL,
	[IsSplitRateInd] [tinyint] NULL,
	[IsBillingWaivePremiumInd] [tinyint] NULL,
	[IsBillingWaivePremiumOverrideInd] [tinyint] NULL,
	[IsFacReinsuranceInd] [tinyint] NULL,
	[UnderlyingInfoDesc] [varchar](255) NULL,
	[ModifiedPremiumBaseAmt] [decimal](19, 4) NULL,
	[ModifiedPremiumOriginalAmt] [decimal](19, 4) NULL,
	[ModifiedPremiumReportingAmt] [decimal](19, 4) NULL,
 CONSTRAINT [PK_PolicySubLine] PRIMARY KEY CLUSTERED 
(
	[PolicySubLineSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Policy].[PolicySubLine]  WITH CHECK ADD  CONSTRAINT [FK_BaseCurrencySK_PolicySubLine] FOREIGN KEY([BaseCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[PolicySubLine] CHECK CONSTRAINT [FK_BaseCurrencySK_PolicySubLine]
GO
ALTER TABLE [Policy].[PolicySubLine]  WITH CHECK ADD  CONSTRAINT [FK_OriginalCurrencySK_PolicySubLine] FOREIGN KEY([OriginalCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[PolicySubLine] CHECK CONSTRAINT [FK_OriginalCurrencySK_PolicySubLine]
GO
ALTER TABLE [Policy].[PolicySubLine]  WITH CHECK ADD  CONSTRAINT [FK_PolicyLineofBusinessSK_PolicySubLine] FOREIGN KEY([PolicyLineofBusinessSK])
REFERENCES [Policy].[PolicyLineofBusiness] ([PolicyLineofBusinessSK])
GO
ALTER TABLE [Policy].[PolicySubLine] CHECK CONSTRAINT [FK_PolicyLineofBusinessSK_PolicySubLine]
GO
ALTER TABLE [Policy].[PolicySubLine]  WITH CHECK ADD  CONSTRAINT [FK_ReportingCurrencySK_PolicySubLine] FOREIGN KEY([ReportingCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[PolicySubLine] CHECK CONSTRAINT [FK_ReportingCurrencySK_PolicySubLine]
GO
ALTER TABLE [Policy].[PolicySubLine]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicySubLine] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[PolicySubLine] CHECK CONSTRAINT [FK_SourceSystemSK_PolicySubLine]
GO
ALTER TABLE [Policy].[PolicySubLine]  WITH CHECK ADD  CONSTRAINT [FK_SublineSK_PolicySubLine] FOREIGN KEY([SublineSK])
REFERENCES [TypeList].[Subline] ([SublineSK])
GO
ALTER TABLE [Policy].[PolicySubLine] CHECK CONSTRAINT [FK_SublineSK_PolicySubLine]
GO
