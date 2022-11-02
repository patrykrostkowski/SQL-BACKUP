USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[PolicyDiscount]    Script Date: 02.11.2022 12:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
ALTER TABLE [Policy].[PolicyDiscount]  WITH CHECK ADD  CONSTRAINT [FK_BaseCurrencySK_PolicyDiscount] FOREIGN KEY([BaseCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[PolicyDiscount] CHECK CONSTRAINT [FK_BaseCurrencySK_PolicyDiscount]
GO
ALTER TABLE [Policy].[PolicyDiscount]  WITH CHECK ADD  CONSTRAINT [FK_DiscountLevelSK_PolicyDiscount] FOREIGN KEY([DiscountLevelSK])
REFERENCES [TypeList].[LevelType] ([LevelTypeSK])
GO
ALTER TABLE [Policy].[PolicyDiscount] CHECK CONSTRAINT [FK_DiscountLevelSK_PolicyDiscount]
GO
ALTER TABLE [Policy].[PolicyDiscount]  WITH CHECK ADD  CONSTRAINT [FK_DiscountTypeSK_PolicyDiscount] FOREIGN KEY([DiscountTypeSK])
REFERENCES [TypeList].[DiscountType] ([DiscountTypeSK])
GO
ALTER TABLE [Policy].[PolicyDiscount] CHECK CONSTRAINT [FK_DiscountTypeSK_PolicyDiscount]
GO
ALTER TABLE [Policy].[PolicyDiscount]  WITH CHECK ADD  CONSTRAINT [FK_OriginalCurrencySK_PolicyDiscount] FOREIGN KEY([OriginalCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[PolicyDiscount] CHECK CONSTRAINT [FK_OriginalCurrencySK_PolicyDiscount]
GO
ALTER TABLE [Policy].[PolicyDiscount]  WITH CHECK ADD  CONSTRAINT [FK_PolicyCoverageSK_PolicyDiscount] FOREIGN KEY([PolicyCoverageSK])
REFERENCES [Policy].[PolicyCoverage] ([PolicyCoverageSK])
GO
ALTER TABLE [Policy].[PolicyDiscount] CHECK CONSTRAINT [FK_PolicyCoverageSK_PolicyDiscount]
GO
ALTER TABLE [Policy].[PolicyDiscount]  WITH CHECK ADD  CONSTRAINT [FK_PolicyGeographySK_PolicyDiscount] FOREIGN KEY([PolicyGeographySK])
REFERENCES [Policy].[PolicyGeography] ([PolicyGeographySK])
GO
ALTER TABLE [Policy].[PolicyDiscount] CHECK CONSTRAINT [FK_PolicyGeographySK_PolicyDiscount]
GO
ALTER TABLE [Policy].[PolicyDiscount]  WITH CHECK ADD  CONSTRAINT [FK_PolicyInsurableObjectSK_PolicyDiscount] FOREIGN KEY([PolicyInsurableObjectSK])
REFERENCES [Policy].[PolicyInsurableObject] ([PolicyInsurableObjectSK])
GO
ALTER TABLE [Policy].[PolicyDiscount] CHECK CONSTRAINT [FK_PolicyInsurableObjectSK_PolicyDiscount]
GO
ALTER TABLE [Policy].[PolicyDiscount]  WITH CHECK ADD  CONSTRAINT [FK_PolicyLineofBusinessSK_PolicyDiscount] FOREIGN KEY([PolicyLineofBusinessSK])
REFERENCES [Policy].[PolicyLineofBusiness] ([PolicyLineofBusinessSK])
GO
ALTER TABLE [Policy].[PolicyDiscount] CHECK CONSTRAINT [FK_PolicyLineofBusinessSK_PolicyDiscount]
GO
ALTER TABLE [Policy].[PolicyDiscount]  WITH CHECK ADD  CONSTRAINT [FK_PolicyTransSK_PolicyDiscount] FOREIGN KEY([PolicyTransSK])
REFERENCES [Policy].[PolicyTrans] ([PolicyTransSK])
GO
ALTER TABLE [Policy].[PolicyDiscount] CHECK CONSTRAINT [FK_PolicyTransSK_PolicyDiscount]
GO
ALTER TABLE [Policy].[PolicyDiscount]  WITH CHECK ADD  CONSTRAINT [FK_ReportingCurrencySK_PolicyDiscount] FOREIGN KEY([ReportingCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[PolicyDiscount] CHECK CONSTRAINT [FK_ReportingCurrencySK_PolicyDiscount]
GO
ALTER TABLE [Policy].[PolicyDiscount]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyDiscount] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[PolicyDiscount] CHECK CONSTRAINT [FK_SourceSystemSK_PolicyDiscount]
GO
