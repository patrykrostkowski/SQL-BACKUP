USE [sqldb-ods-dev]
GO
/****** Object:  Table [PreBind].[QuoteGeography]    Script Date: 28.10.2022 12:26:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteGeography](
	[QuoteGeographySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteTransSK] [int] NOT NULL,
	[QuoteLineofBusinessSK] [int] NOT NULL,
	[CountrySK] [int] NOT NULL,
	[StateSK] [int] NOT NULL,
	[TerritoryName] [varchar](25) NULL,
	[RegionName] [varchar](25) NULL,
	[CountyName] [varchar](25) NULL,
 CONSTRAINT [PK_QuoteGeography] PRIMARY KEY CLUSTERED 
(
	[QuoteGeographySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[SourceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_QuoteGeography]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_QuoteGeography] ON [PreBind].[QuoteGeography]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteGeography]  WITH NOCHECK ADD  CONSTRAINT [FK_CountrySK_QuoteGeography] FOREIGN KEY([CountrySK])
REFERENCES [Typelist].[Country] ([CountrySK])
GO
ALTER TABLE [PreBind].[QuoteGeography] NOCHECK CONSTRAINT [FK_CountrySK_QuoteGeography]
GO
ALTER TABLE [PreBind].[QuoteGeography]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteLineofBusinessSK_QuoteGeography] FOREIGN KEY([QuoteLineofBusinessSK])
REFERENCES [PreBind].[QuoteLineofBusiness] ([QuoteLineofBusinessSK])
GO
ALTER TABLE [PreBind].[QuoteGeography] NOCHECK CONSTRAINT [FK_QuoteLineofBusinessSK_QuoteGeography]
GO
ALTER TABLE [PreBind].[QuoteGeography]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteTransSK_QuoteGeography] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
ALTER TABLE [PreBind].[QuoteGeography] NOCHECK CONSTRAINT [FK_QuoteTransSK_QuoteGeography]
GO
ALTER TABLE [PreBind].[QuoteGeography]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteGeography] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteGeography] NOCHECK CONSTRAINT [FK_SourceSystemSK_QuoteGeography]
GO
ALTER TABLE [PreBind].[QuoteGeography]  WITH NOCHECK ADD  CONSTRAINT [FK_StateSK_QuoteGeography] FOREIGN KEY([StateSK])
REFERENCES [Typelist].[State] ([StateSK])
GO
ALTER TABLE [PreBind].[QuoteGeography] NOCHECK CONSTRAINT [FK_StateSK_QuoteGeography]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The physical location  of an insurable object defined as its country, stateprovince, region and territory.  This factor may be used to underwrite risk,  calculate premiums and enforce   geographical limits  on claim reporting' , @level0type=N'SCHEMA',@level0name=N'PreBind', @level1type=N'TABLE',@level1name=N'QuoteGeography'
GO
