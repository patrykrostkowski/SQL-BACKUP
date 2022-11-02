USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[PolicyLineofBusiness]    Script Date: 02.11.2022 14:05:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[PolicyLineofBusiness](
	[PolicyLineofBusinessSK] [int] IDENTITY(2,1) NOT NULL,
	[LineofBusinessSK] [int] NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PolicyTransSK] [int] NOT NULL,
	[BaseCurrencySK] [int] NULL,
	[OriginalCurrencySK] [int] NULL,
	[ReportingCurrencySK] [int] NULL,
	[AddlRetPremBaseAmt] [decimal](19, 4) NULL,
	[AddlRetPremOriginalAmt] [decimal](19, 4) NULL,
	[AddlRetPremReportingAmt] [char](10) NULL,
	[WrittenPremiumBaseAmt] [decimal](19, 4) NULL,
	[WrittenPremiumOriginalAmt] [decimal](19, 4) NULL,
	[WrittenPremiumReportingAmt] [decimal](19, 4) NULL,
	[AnnualPremiumBaseAmt] [decimal](19, 4) NULL,
	[AnnualPremiumOriginalAmt] [decimal](19, 4) NULL,
	[AnnualPremiumReportingAmt] [decimal](19, 4) NULL,
	[TermPremiumBaseAmt] [decimal](19, 4) NULL,
	[TermPremiumOriginalAmt] [decimal](19, 4) NULL,
	[TermPremiumReportingAmt] [decimal](19, 4) NULL,
	[ManualPremBaseAmt] [decimal](19, 4) NULL,
	[ManualPremOriginalAmt] [decimal](19, 4) NULL,
	[ManualPremReportingAmt] [decimal](19, 4) NULL,
	[ModifiedPremAmt] [decimal](19, 4) NULL,
	[ModifiedPremiumOriginalAmt] [decimal](19, 4) NULL,
	[ModifiedPremiumReportingAmt] [decimal](19, 4) NULL,
	[ModifiedPremiumBaseAmt] [decimal](19, 4) NULL,
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
	[RateEffectiveDate] [datetime] NULL,
	[IsSplitRateInd] [tinyint] NULL,
	[IsBillingWaivePremiumInd] [tinyint] NULL,
	[IsBillingWaivePremiumOverrideInd] [tinyint] NULL,
	[IsFacReinsuranceInd] [tinyint] NULL,
	[UnderlyingInfoDesc] [varchar](255) NULL,
	[MaxCommissionPct] [decimal](8, 2) NULL,
 CONSTRAINT [PK_PolicyLineofBusiness] PRIMARY KEY CLUSTERED 
(
	[PolicyLineofBusinessSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Policy].[PolicyLineofBusiness]  WITH CHECK ADD  CONSTRAINT [FK_BaseCurrencySK_PolicyLineofBusiness] FOREIGN KEY([BaseCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[PolicyLineofBusiness] CHECK CONSTRAINT [FK_BaseCurrencySK_PolicyLineofBusiness]
GO
ALTER TABLE [Policy].[PolicyLineofBusiness]  WITH CHECK ADD  CONSTRAINT [FK_LineofBusinessSK_PolicyLineofBusiness] FOREIGN KEY([LineofBusinessSK])
REFERENCES [TypeList].[LineofBusiness] ([LineofBusinessSK])
GO
ALTER TABLE [Policy].[PolicyLineofBusiness] CHECK CONSTRAINT [FK_LineofBusinessSK_PolicyLineofBusiness]
GO
ALTER TABLE [Policy].[PolicyLineofBusiness]  WITH CHECK ADD  CONSTRAINT [FK_OriginalCurrencySK_PolicyLineofBusiness] FOREIGN KEY([OriginalCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[PolicyLineofBusiness] CHECK CONSTRAINT [FK_OriginalCurrencySK_PolicyLineofBusiness]
GO
ALTER TABLE [Policy].[PolicyLineofBusiness]  WITH CHECK ADD  CONSTRAINT [FK_PolicyTransSK_PolicyLineofBusiness] FOREIGN KEY([PolicyTransSK])
REFERENCES [Policy].[PolicyTrans] ([PolicyTransSK])
GO
ALTER TABLE [Policy].[PolicyLineofBusiness] CHECK CONSTRAINT [FK_PolicyTransSK_PolicyLineofBusiness]
GO
ALTER TABLE [Policy].[PolicyLineofBusiness]  WITH CHECK ADD  CONSTRAINT [FK_ReportingCurrencySK_PolicyLineofBusiness] FOREIGN KEY([ReportingCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[PolicyLineofBusiness] CHECK CONSTRAINT [FK_ReportingCurrencySK_PolicyLineofBusiness]
GO
ALTER TABLE [Policy].[PolicyLineofBusiness]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyLineofBusiness] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[PolicyLineofBusiness] CHECK CONSTRAINT [FK_SourceSystemSK_PolicyLineofBusiness]
GO
