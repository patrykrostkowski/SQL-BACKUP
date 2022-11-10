USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteDiscount]    Script Date: 10.11.2022 14:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PreBind].[QuoteDiscount]') AND type in (N'U'))
BEGIN
CREATE TABLE [PreBind].[QuoteDiscount](
	[QuoteDiscountSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteTransSK] [int] NULL,
	[QuoteLineofBusinessSK] [int] NULL,
	[QuoteGeographySK] [int] NULL,
	[QuoteInsurableObjectSK] [int] NULL,
	[QuoteCoverageSK] [int] NULL,
	[DiscountLevelSK] [int] NOT NULL,
	[DiscountTypeSK] [int] NOT NULL,
	[BaseCurrencySK] [int] NULL,
	[PolicyDiscountBaseAmt] [decimal](19, 4) NULL,
 CONSTRAINT [PK_QuoteDiscount] PRIMARY KEY NONCLUSTERED 
(
	[QuoteDiscountSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_BaseCurrencySK_QuoteDiscount]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteDiscount]'))
ALTER TABLE [PreBind].[QuoteDiscount]  WITH CHECK ADD  CONSTRAINT [FK_BaseCurrencySK_QuoteDiscount] FOREIGN KEY([BaseCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_BaseCurrencySK_QuoteDiscount]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteDiscount]'))
ALTER TABLE [PreBind].[QuoteDiscount] CHECK CONSTRAINT [FK_BaseCurrencySK_QuoteDiscount]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteCoverageSK_QuoteDiscount]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteDiscount]'))
ALTER TABLE [PreBind].[QuoteDiscount]  WITH CHECK ADD  CONSTRAINT [FK_QuoteCoverageSK_QuoteDiscount] FOREIGN KEY([QuoteCoverageSK])
REFERENCES [PreBind].[QuoteCoverage] ([QuoteCoverageSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteCoverageSK_QuoteDiscount]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteDiscount]'))
ALTER TABLE [PreBind].[QuoteDiscount] CHECK CONSTRAINT [FK_QuoteCoverageSK_QuoteDiscount]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteGeographySK_QuoteDiscount]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteDiscount]'))
ALTER TABLE [PreBind].[QuoteDiscount]  WITH CHECK ADD  CONSTRAINT [FK_QuoteGeographySK_QuoteDiscount] FOREIGN KEY([QuoteGeographySK])
REFERENCES [PreBind].[QuoteGeography] ([QuoteGeographySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteGeographySK_QuoteDiscount]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteDiscount]'))
ALTER TABLE [PreBind].[QuoteDiscount] CHECK CONSTRAINT [FK_QuoteGeographySK_QuoteDiscount]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteInsurableObjectSK_QuoteDiscount]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteDiscount]'))
ALTER TABLE [PreBind].[QuoteDiscount]  WITH CHECK ADD  CONSTRAINT [FK_QuoteInsurableObjectSK_QuoteDiscount] FOREIGN KEY([QuoteInsurableObjectSK])
REFERENCES [PreBind].[QuoteInsurableObject] ([QuoteInsurableObjectSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteInsurableObjectSK_QuoteDiscount]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteDiscount]'))
ALTER TABLE [PreBind].[QuoteDiscount] CHECK CONSTRAINT [FK_QuoteInsurableObjectSK_QuoteDiscount]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteLineofBusinessSK_QuoteDiscount]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteDiscount]'))
ALTER TABLE [PreBind].[QuoteDiscount]  WITH CHECK ADD  CONSTRAINT [FK_QuoteLineofBusinessSK_QuoteDiscount] FOREIGN KEY([QuoteLineofBusinessSK])
REFERENCES [PreBind].[QuoteLineofBusiness] ([QuoteLineofBusinessSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteLineofBusinessSK_QuoteDiscount]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteDiscount]'))
ALTER TABLE [PreBind].[QuoteDiscount] CHECK CONSTRAINT [FK_QuoteLineofBusinessSK_QuoteDiscount]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteTransSK_QuoteDiscount]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteDiscount]'))
ALTER TABLE [PreBind].[QuoteDiscount]  WITH CHECK ADD  CONSTRAINT [FK_QuoteTransSK_QuoteDiscount] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteTransSK_QuoteDiscount]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteDiscount]'))
ALTER TABLE [PreBind].[QuoteDiscount] CHECK CONSTRAINT [FK_QuoteTransSK_QuoteDiscount]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SourceSystemSK_QuoteDiscount]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteDiscount]'))
ALTER TABLE [PreBind].[QuoteDiscount]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteDiscount] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SourceSystemSK_QuoteDiscount]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteDiscount]'))
ALTER TABLE [PreBind].[QuoteDiscount] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteDiscount]
GO
