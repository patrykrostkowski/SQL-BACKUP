USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[PolicyCoverageFee]    Script Date: 10.11.2022 14:36:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Policy].[PolicyCoverageFee]') AND type in (N'U'))
BEGIN
CREATE TABLE [Policy].[PolicyCoverageFee](
	[PolicyCoverageFeeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PolicyTransSK] [int] NOT NULL,
	[PolicyCoverageSK] [int] NOT NULL,
	[CoverageFeeTypeSK] [int] NOT NULL,
	[BaseCurrencySK] [int] NULL,
	[OriginalCurrencySK] [int] NULL,
	[ReportingCurrencySK] [int] NULL,
	[CoverageFeeBaseAmt] [decimal](19, 4) NULL,
	[CoverageFeeOriginalAmt] [decimal](19, 4) NULL,
	[CoverageFeeReportingAmt] [decimal](19, 4) NULL,
	[FeeEffectiveDate] [date] NULL,
	[FeeExpirationDate] [date] NULL,
	[FeeChargeTypeSK] [int] NULL,
	[IsSurchargeInd] [tinyint] NOT NULL,
	[IsIncludedInPremiumInd] [tinyint] NOT NULL,
 CONSTRAINT [PK_PolicyCoverageFee] PRIMARY KEY CLUSTERED 
(
	[PolicyCoverageFeeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_BaseCurrencySK_PolicyCoverageFee]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyCoverageFee]'))
ALTER TABLE [Policy].[PolicyCoverageFee]  WITH CHECK ADD  CONSTRAINT [FK_BaseCurrencySK_PolicyCoverageFee] FOREIGN KEY([BaseCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_BaseCurrencySK_PolicyCoverageFee]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyCoverageFee]'))
ALTER TABLE [Policy].[PolicyCoverageFee] CHECK CONSTRAINT [FK_BaseCurrencySK_PolicyCoverageFee]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_CoverageFeeTypeSK_PolicyCoverageFee]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyCoverageFee]'))
ALTER TABLE [Policy].[PolicyCoverageFee]  WITH CHECK ADD  CONSTRAINT [FK_CoverageFeeTypeSK_PolicyCoverageFee] FOREIGN KEY([CoverageFeeTypeSK])
REFERENCES [TypeList].[CoverageFeeType] ([CoverageFeeTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_CoverageFeeTypeSK_PolicyCoverageFee]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyCoverageFee]'))
ALTER TABLE [Policy].[PolicyCoverageFee] CHECK CONSTRAINT [FK_CoverageFeeTypeSK_PolicyCoverageFee]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_FeeChargeTypeSK_PolicyCoverageFee]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyCoverageFee]'))
ALTER TABLE [Policy].[PolicyCoverageFee]  WITH CHECK ADD  CONSTRAINT [FK_FeeChargeTypeSK_PolicyCoverageFee] FOREIGN KEY([FeeChargeTypeSK])
REFERENCES [TypeList].[RevenueCode] ([RevenueCodeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_FeeChargeTypeSK_PolicyCoverageFee]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyCoverageFee]'))
ALTER TABLE [Policy].[PolicyCoverageFee] CHECK CONSTRAINT [FK_FeeChargeTypeSK_PolicyCoverageFee]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_OriginalCurrencySK_PolicyCoverageFee]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyCoverageFee]'))
ALTER TABLE [Policy].[PolicyCoverageFee]  WITH CHECK ADD  CONSTRAINT [FK_OriginalCurrencySK_PolicyCoverageFee] FOREIGN KEY([OriginalCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_OriginalCurrencySK_PolicyCoverageFee]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyCoverageFee]'))
ALTER TABLE [Policy].[PolicyCoverageFee] CHECK CONSTRAINT [FK_OriginalCurrencySK_PolicyCoverageFee]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyCoverageSK_PolicyCoverageFee]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyCoverageFee]'))
ALTER TABLE [Policy].[PolicyCoverageFee]  WITH CHECK ADD  CONSTRAINT [FK_PolicyCoverageSK_PolicyCoverageFee] FOREIGN KEY([PolicyCoverageSK])
REFERENCES [Policy].[PolicyCoverage] ([PolicyCoverageSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyCoverageSK_PolicyCoverageFee]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyCoverageFee]'))
ALTER TABLE [Policy].[PolicyCoverageFee] CHECK CONSTRAINT [FK_PolicyCoverageSK_PolicyCoverageFee]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyTransSK_PolicyCoverageFee]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyCoverageFee]'))
ALTER TABLE [Policy].[PolicyCoverageFee]  WITH CHECK ADD  CONSTRAINT [FK_PolicyTransSK_PolicyCoverageFee] FOREIGN KEY([PolicyTransSK])
REFERENCES [Policy].[PolicyTrans] ([PolicyTransSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyTransSK_PolicyCoverageFee]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyCoverageFee]'))
ALTER TABLE [Policy].[PolicyCoverageFee] CHECK CONSTRAINT [FK_PolicyTransSK_PolicyCoverageFee]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_ReportingCurrencySK_PolicyCoverageFee]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyCoverageFee]'))
ALTER TABLE [Policy].[PolicyCoverageFee]  WITH CHECK ADD  CONSTRAINT [FK_ReportingCurrencySK_PolicyCoverageFee] FOREIGN KEY([ReportingCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_ReportingCurrencySK_PolicyCoverageFee]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyCoverageFee]'))
ALTER TABLE [Policy].[PolicyCoverageFee] CHECK CONSTRAINT [FK_ReportingCurrencySK_PolicyCoverageFee]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_PolicyCoverageFee]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyCoverageFee]'))
ALTER TABLE [Policy].[PolicyCoverageFee]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyCoverageFee] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_PolicyCoverageFee]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyCoverageFee]'))
ALTER TABLE [Policy].[PolicyCoverageFee] CHECK CONSTRAINT [FK_SourceSystemSK_PolicyCoverageFee]
GO
