USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[PolicyLineofBusiness]    Script Date: 10.11.2022 14:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Policy].[PolicyLineofBusiness]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_BaseCurrencySK_PolicyLineofBusiness]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyLineofBusiness]'))
ALTER TABLE [Policy].[PolicyLineofBusiness]  WITH CHECK ADD  CONSTRAINT [FK_BaseCurrencySK_PolicyLineofBusiness] FOREIGN KEY([BaseCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_BaseCurrencySK_PolicyLineofBusiness]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyLineofBusiness]'))
ALTER TABLE [Policy].[PolicyLineofBusiness] CHECK CONSTRAINT [FK_BaseCurrencySK_PolicyLineofBusiness]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_LineofBusinessSK_PolicyLineofBusiness]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyLineofBusiness]'))
ALTER TABLE [Policy].[PolicyLineofBusiness]  WITH CHECK ADD  CONSTRAINT [FK_LineofBusinessSK_PolicyLineofBusiness] FOREIGN KEY([LineofBusinessSK])
REFERENCES [TypeList].[LineofBusiness] ([LineofBusinessSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_LineofBusinessSK_PolicyLineofBusiness]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyLineofBusiness]'))
ALTER TABLE [Policy].[PolicyLineofBusiness] CHECK CONSTRAINT [FK_LineofBusinessSK_PolicyLineofBusiness]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_OriginalCurrencySK_PolicyLineofBusiness]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyLineofBusiness]'))
ALTER TABLE [Policy].[PolicyLineofBusiness]  WITH CHECK ADD  CONSTRAINT [FK_OriginalCurrencySK_PolicyLineofBusiness] FOREIGN KEY([OriginalCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_OriginalCurrencySK_PolicyLineofBusiness]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyLineofBusiness]'))
ALTER TABLE [Policy].[PolicyLineofBusiness] CHECK CONSTRAINT [FK_OriginalCurrencySK_PolicyLineofBusiness]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyTransSK_PolicyLineofBusiness]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyLineofBusiness]'))
ALTER TABLE [Policy].[PolicyLineofBusiness]  WITH CHECK ADD  CONSTRAINT [FK_PolicyTransSK_PolicyLineofBusiness] FOREIGN KEY([PolicyTransSK])
REFERENCES [Policy].[PolicyTrans] ([PolicyTransSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyTransSK_PolicyLineofBusiness]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyLineofBusiness]'))
ALTER TABLE [Policy].[PolicyLineofBusiness] CHECK CONSTRAINT [FK_PolicyTransSK_PolicyLineofBusiness]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_ReportingCurrencySK_PolicyLineofBusiness]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyLineofBusiness]'))
ALTER TABLE [Policy].[PolicyLineofBusiness]  WITH CHECK ADD  CONSTRAINT [FK_ReportingCurrencySK_PolicyLineofBusiness] FOREIGN KEY([ReportingCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_ReportingCurrencySK_PolicyLineofBusiness]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyLineofBusiness]'))
ALTER TABLE [Policy].[PolicyLineofBusiness] CHECK CONSTRAINT [FK_ReportingCurrencySK_PolicyLineofBusiness]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_PolicyLineofBusiness]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyLineofBusiness]'))
ALTER TABLE [Policy].[PolicyLineofBusiness]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyLineofBusiness] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_PolicyLineofBusiness]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyLineofBusiness]'))
ALTER TABLE [Policy].[PolicyLineofBusiness] CHECK CONSTRAINT [FK_SourceSystemSK_PolicyLineofBusiness]
GO
