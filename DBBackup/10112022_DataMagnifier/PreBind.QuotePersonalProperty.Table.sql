USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuotePersonalProperty]    Script Date: 10.11.2022 14:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PreBind].[QuotePersonalProperty]') AND type in (N'U'))
BEGIN
CREATE TABLE [PreBind].[QuotePersonalProperty](
	[QuotePersonalPropertySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteInsurableObjectSK] [int] NOT NULL,
	[AddressLine1] [varchar](50) NULL,
	[AddressLine2] [varchar](50) NULL,
	[AddressLine3] [varchar](50) NULL,
	[CityName] [varchar](50) NULL,
	[StateCode] [varchar](10) NULL,
	[ZipCode] [varchar](20) NULL,
	[ItemNum] [varchar](10) NULL,
	[ItemName] [varchar](50) NULL,
	[ItemDesc] [varchar](100) NULL,
	[BaseCurrencySK] [int] NOT NULL,
	[ItemValueBaseAmt] [decimal](19, 4) NULL,
 CONSTRAINT [PK_QuotePersonalProperty] PRIMARY KEY NONCLUSTERED 
(
	[QuotePersonalPropertySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_BaseCurrencySK_QuotePersonalProperty]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuotePersonalProperty]'))
ALTER TABLE [PreBind].[QuotePersonalProperty]  WITH CHECK ADD  CONSTRAINT [FK_BaseCurrencySK_QuotePersonalProperty] FOREIGN KEY([BaseCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_BaseCurrencySK_QuotePersonalProperty]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuotePersonalProperty]'))
ALTER TABLE [PreBind].[QuotePersonalProperty] CHECK CONSTRAINT [FK_BaseCurrencySK_QuotePersonalProperty]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteInsurableObjectSK_QuotePersonalProperty]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuotePersonalProperty]'))
ALTER TABLE [PreBind].[QuotePersonalProperty]  WITH CHECK ADD  CONSTRAINT [FK_QuoteInsurableObjectSK_QuotePersonalProperty] FOREIGN KEY([QuoteInsurableObjectSK])
REFERENCES [PreBind].[QuoteInsurableObject] ([QuoteInsurableObjectSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteInsurableObjectSK_QuotePersonalProperty]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuotePersonalProperty]'))
ALTER TABLE [PreBind].[QuotePersonalProperty] CHECK CONSTRAINT [FK_QuoteInsurableObjectSK_QuotePersonalProperty]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SourceSystemSK_QuotePersonalProperty]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuotePersonalProperty]'))
ALTER TABLE [PreBind].[QuotePersonalProperty]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuotePersonalProperty] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SourceSystemSK_QuotePersonalProperty]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuotePersonalProperty]'))
ALTER TABLE [PreBind].[QuotePersonalProperty] CHECK CONSTRAINT [FK_SourceSystemSK_QuotePersonalProperty]
GO
