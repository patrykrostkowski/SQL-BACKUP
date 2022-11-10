USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[PolicyDiscount]    Script Date: 10.11.2022 14:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Policy].[PolicyDiscount]') AND type in (N'U'))
BEGIN
CREATE TABLE [Policy].[PolicyDiscount](
	[PolicyDiscountSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PolicyTransSK] [int] NOT NULL,
	[PolicyLineofBusinessSK] [int] NOT NULL,
	[PolicyGeographySK] [int] NULL,
	[PolicyInsurableObjectSK] [int] NULL,
	[PolicyCoverageSK] [int] NULL,
	[DiscountLevelSK] [int] NOT NULL,
	[DiscountTypeSK] [int] NOT NULL,
	[BaseCurrencySK] [int] NULL,
	[OriginalCurrencySK] [int] NULL,
	[ReportingCurrencySK] [int] NULL,
	[PolicyDiscountBaseAmt] [decimal](19, 4) NULL,
	[PolicyDiscountOriginalAmt] [decimal](19, 4) NULL,
	[PolicyDiscountReportingAmt] [decimal](19, 4) NULL,
 CONSTRAINT [PK_PolicyDiscount] PRIMARY KEY NONCLUSTERED 
(
	[PolicyDiscountSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_BaseCurrencySK_PolicyDiscount]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyDiscount]'))
ALTER TABLE [Policy].[PolicyDiscount]  WITH CHECK ADD  CONSTRAINT [FK_BaseCurrencySK_PolicyDiscount] FOREIGN KEY([BaseCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_BaseCurrencySK_PolicyDiscount]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyDiscount]'))
ALTER TABLE [Policy].[PolicyDiscount] CHECK CONSTRAINT [FK_BaseCurrencySK_PolicyDiscount]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_DiscountLevelSK_PolicyDiscount]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyDiscount]'))
ALTER TABLE [Policy].[PolicyDiscount]  WITH CHECK ADD  CONSTRAINT [FK_DiscountLevelSK_PolicyDiscount] FOREIGN KEY([DiscountLevelSK])
REFERENCES [TypeList].[LevelType] ([LevelTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_DiscountLevelSK_PolicyDiscount]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyDiscount]'))
ALTER TABLE [Policy].[PolicyDiscount] CHECK CONSTRAINT [FK_DiscountLevelSK_PolicyDiscount]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_DiscountTypeSK_PolicyDiscount]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyDiscount]'))
ALTER TABLE [Policy].[PolicyDiscount]  WITH CHECK ADD  CONSTRAINT [FK_DiscountTypeSK_PolicyDiscount] FOREIGN KEY([DiscountTypeSK])
REFERENCES [TypeList].[DiscountType] ([DiscountTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_DiscountTypeSK_PolicyDiscount]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyDiscount]'))
ALTER TABLE [Policy].[PolicyDiscount] CHECK CONSTRAINT [FK_DiscountTypeSK_PolicyDiscount]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_OriginalCurrencySK_PolicyDiscount]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyDiscount]'))
ALTER TABLE [Policy].[PolicyDiscount]  WITH CHECK ADD  CONSTRAINT [FK_OriginalCurrencySK_PolicyDiscount] FOREIGN KEY([OriginalCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_OriginalCurrencySK_PolicyDiscount]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyDiscount]'))
ALTER TABLE [Policy].[PolicyDiscount] CHECK CONSTRAINT [FK_OriginalCurrencySK_PolicyDiscount]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyCoverageSK_PolicyDiscount]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyDiscount]'))
ALTER TABLE [Policy].[PolicyDiscount]  WITH CHECK ADD  CONSTRAINT [FK_PolicyCoverageSK_PolicyDiscount] FOREIGN KEY([PolicyCoverageSK])
REFERENCES [Policy].[PolicyCoverage] ([PolicyCoverageSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyCoverageSK_PolicyDiscount]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyDiscount]'))
ALTER TABLE [Policy].[PolicyDiscount] CHECK CONSTRAINT [FK_PolicyCoverageSK_PolicyDiscount]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyGeographySK_PolicyDiscount]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyDiscount]'))
ALTER TABLE [Policy].[PolicyDiscount]  WITH CHECK ADD  CONSTRAINT [FK_PolicyGeographySK_PolicyDiscount] FOREIGN KEY([PolicyGeographySK])
REFERENCES [Policy].[PolicyGeography] ([PolicyGeographySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyGeographySK_PolicyDiscount]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyDiscount]'))
ALTER TABLE [Policy].[PolicyDiscount] CHECK CONSTRAINT [FK_PolicyGeographySK_PolicyDiscount]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyInsurableObjectSK_PolicyDiscount]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyDiscount]'))
ALTER TABLE [Policy].[PolicyDiscount]  WITH CHECK ADD  CONSTRAINT [FK_PolicyInsurableObjectSK_PolicyDiscount] FOREIGN KEY([PolicyInsurableObjectSK])
REFERENCES [Policy].[PolicyInsurableObject] ([PolicyInsurableObjectSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyInsurableObjectSK_PolicyDiscount]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyDiscount]'))
ALTER TABLE [Policy].[PolicyDiscount] CHECK CONSTRAINT [FK_PolicyInsurableObjectSK_PolicyDiscount]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyLineofBusinessSK_PolicyDiscount]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyDiscount]'))
ALTER TABLE [Policy].[PolicyDiscount]  WITH CHECK ADD  CONSTRAINT [FK_PolicyLineofBusinessSK_PolicyDiscount] FOREIGN KEY([PolicyLineofBusinessSK])
REFERENCES [Policy].[PolicyLineofBusiness] ([PolicyLineofBusinessSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyLineofBusinessSK_PolicyDiscount]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyDiscount]'))
ALTER TABLE [Policy].[PolicyDiscount] CHECK CONSTRAINT [FK_PolicyLineofBusinessSK_PolicyDiscount]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyTransSK_PolicyDiscount]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyDiscount]'))
ALTER TABLE [Policy].[PolicyDiscount]  WITH CHECK ADD  CONSTRAINT [FK_PolicyTransSK_PolicyDiscount] FOREIGN KEY([PolicyTransSK])
REFERENCES [Policy].[PolicyTrans] ([PolicyTransSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyTransSK_PolicyDiscount]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyDiscount]'))
ALTER TABLE [Policy].[PolicyDiscount] CHECK CONSTRAINT [FK_PolicyTransSK_PolicyDiscount]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_ReportingCurrencySK_PolicyDiscount]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyDiscount]'))
ALTER TABLE [Policy].[PolicyDiscount]  WITH CHECK ADD  CONSTRAINT [FK_ReportingCurrencySK_PolicyDiscount] FOREIGN KEY([ReportingCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_ReportingCurrencySK_PolicyDiscount]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyDiscount]'))
ALTER TABLE [Policy].[PolicyDiscount] CHECK CONSTRAINT [FK_ReportingCurrencySK_PolicyDiscount]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_PolicyDiscount]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyDiscount]'))
ALTER TABLE [Policy].[PolicyDiscount]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyDiscount] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_PolicyDiscount]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyDiscount]'))
ALTER TABLE [Policy].[PolicyDiscount] CHECK CONSTRAINT [FK_SourceSystemSK_PolicyDiscount]
GO
