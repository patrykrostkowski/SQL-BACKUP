USE [sqldb-ods-dev]
GO
/****** Object:  Table [PreBind].[QuotePersonalProperty]    Script Date: 28.10.2022 13:37:01 ******/
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
 CONSTRAINT [PK_QuotePersonalProperty] PRIMARY KEY CLUSTERED 
(
	[QuotePersonalPropertySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_QuotePersonalProperty]    Script Date: 28.10.2022 13:37:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_QuotePersonalProperty] ON [PreBind].[QuotePersonalProperty]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuotePersonalProperty]  WITH NOCHECK ADD  CONSTRAINT [FK_BaseCurrencySK_QuotePersonalProperty] FOREIGN KEY([BaseCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [PreBind].[QuotePersonalProperty] NOCHECK CONSTRAINT [FK_BaseCurrencySK_QuotePersonalProperty]
GO
ALTER TABLE [PreBind].[QuotePersonalProperty]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteInsurableObjectSK_QuotePersonalProperty] FOREIGN KEY([QuoteInsurableObjectSK])
REFERENCES [PreBind].[QuoteInsurableObject] ([QuoteInsurableObjectSK])
GO
ALTER TABLE [PreBind].[QuotePersonalProperty] NOCHECK CONSTRAINT [FK_QuoteInsurableObjectSK_QuotePersonalProperty]
GO
ALTER TABLE [PreBind].[QuotePersonalProperty]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuotePersonalProperty] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuotePersonalProperty] NOCHECK CONSTRAINT [FK_SourceSystemSK_QuotePersonalProperty]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Scheduled Item is listed in a property insurance contract, and insured separately from the standard property insurance in order to receive the full 
value for a loss. Examples are: expensive jewelry, furs, paintings, electronics, etc.' , @level0type=N'SCHEMA',@level0name=N'PreBind', @level1type=N'TABLE',@level1name=N'QuotePersonalProperty'
GO
