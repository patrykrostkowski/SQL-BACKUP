USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuotePersonalProperty]    Script Date: 02.11.2022 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
ALTER TABLE [PreBind].[QuotePersonalProperty]  WITH CHECK ADD  CONSTRAINT [FK_BaseCurrencySK_QuotePersonalProperty] FOREIGN KEY([BaseCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [PreBind].[QuotePersonalProperty] CHECK CONSTRAINT [FK_BaseCurrencySK_QuotePersonalProperty]
GO
ALTER TABLE [PreBind].[QuotePersonalProperty]  WITH CHECK ADD  CONSTRAINT [FK_QuoteInsurableObjectSK_QuotePersonalProperty] FOREIGN KEY([QuoteInsurableObjectSK])
REFERENCES [PreBind].[QuoteInsurableObject] ([QuoteInsurableObjectSK])
GO
ALTER TABLE [PreBind].[QuotePersonalProperty] CHECK CONSTRAINT [FK_QuoteInsurableObjectSK_QuotePersonalProperty]
GO
ALTER TABLE [PreBind].[QuotePersonalProperty]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuotePersonalProperty] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuotePersonalProperty] CHECK CONSTRAINT [FK_SourceSystemSK_QuotePersonalProperty]
GO
