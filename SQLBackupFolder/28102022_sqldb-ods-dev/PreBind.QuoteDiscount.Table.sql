USE [sqldb-ods-dev]
GO
/****** Object:  Table [PreBind].[QuoteDiscount]    Script Date: 28.10.2022 13:36:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
 CONSTRAINT [PK_QuoteDiscount] PRIMARY KEY CLUSTERED 
(
	[QuoteDiscountSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_QuoteDiscount]    Script Date: 28.10.2022 13:37:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_QuoteDiscount] ON [PreBind].[QuoteDiscount]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteDiscount]  WITH NOCHECK ADD  CONSTRAINT [FK_BaseCurrencySK_QuoteDiscount] FOREIGN KEY([BaseCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [PreBind].[QuoteDiscount] NOCHECK CONSTRAINT [FK_BaseCurrencySK_QuoteDiscount]
GO
ALTER TABLE [PreBind].[QuoteDiscount]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteCoverageSK_QuoteDiscount] FOREIGN KEY([QuoteCoverageSK])
REFERENCES [PreBind].[QuoteCoverage] ([QuoteCoverageSK])
GO
ALTER TABLE [PreBind].[QuoteDiscount] NOCHECK CONSTRAINT [FK_QuoteCoverageSK_QuoteDiscount]
GO
ALTER TABLE [PreBind].[QuoteDiscount]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteGeographySK_QuoteDiscount] FOREIGN KEY([QuoteGeographySK])
REFERENCES [PreBind].[QuoteGeography] ([QuoteGeographySK])
GO
ALTER TABLE [PreBind].[QuoteDiscount] NOCHECK CONSTRAINT [FK_QuoteGeographySK_QuoteDiscount]
GO
ALTER TABLE [PreBind].[QuoteDiscount]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteInsurableObjectSK_QuoteDiscount] FOREIGN KEY([QuoteInsurableObjectSK])
REFERENCES [PreBind].[QuoteInsurableObject] ([QuoteInsurableObjectSK])
GO
ALTER TABLE [PreBind].[QuoteDiscount] NOCHECK CONSTRAINT [FK_QuoteInsurableObjectSK_QuoteDiscount]
GO
ALTER TABLE [PreBind].[QuoteDiscount]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteLineofBusinessSK_QuoteDiscount] FOREIGN KEY([QuoteLineofBusinessSK])
REFERENCES [PreBind].[QuoteLineofBusiness] ([QuoteLineofBusinessSK])
GO
ALTER TABLE [PreBind].[QuoteDiscount] NOCHECK CONSTRAINT [FK_QuoteLineofBusinessSK_QuoteDiscount]
GO
ALTER TABLE [PreBind].[QuoteDiscount]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteTransSK_QuoteDiscount] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
ALTER TABLE [PreBind].[QuoteDiscount] NOCHECK CONSTRAINT [FK_QuoteTransSK_QuoteDiscount]
GO
ALTER TABLE [PreBind].[QuoteDiscount]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteDiscount] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteDiscount] NOCHECK CONSTRAINT [FK_SourceSystemSK_QuoteDiscount]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Premium or non-premium discounts associated with a quote contract' , @level0type=N'SCHEMA',@level0name=N'PreBind', @level1type=N'TABLE',@level1name=N'QuoteDiscount'
GO
