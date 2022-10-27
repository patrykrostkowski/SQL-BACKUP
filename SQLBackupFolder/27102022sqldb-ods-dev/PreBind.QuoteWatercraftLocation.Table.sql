USE [sqldb-ods-dev]
GO
/****** Object:  Table [PreBind].[QuoteWatercraftLocation]    Script Date: 27.10.2022 12:27:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteWatercraftLocation](
	[QuoteWatercraftLocationSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteWatercraftSK] [int] NOT NULL,
	[SlipNum] [varchar](20) NULL,
	[AddressLine1] [varchar](128) NULL,
	[AddressLine2] [varchar](128) NULL,
	[AddressLine3] [varchar](50) NULL,
	[AddressLine4] [varchar](100) NULL,
	[CityName] [varchar](128) NULL,
	[PostalCode] [varchar](100) NULL,
	[StateSK] [int] NULL,
	[TerritoryName] [varchar](50) NULL,
	[TaxTerritoryName] [varchar](50) NULL,
	[TownName] [varchar](50) NULL,
	[CountyName] [varchar](50) NULL,
	[CountrySK] [int] NULL,
	[ConstTypeCode] [varchar](3) NULL,
	[ConstTypeDesc] [varchar](50) NULL,
	[YearBuilt] [varchar](4) NULL,
	[ConstYear] [varchar](4) NULL,
	[DistancetoWaterCode] [varchar](20) NULL,
	[DistanceToWaterDesc] [varchar](50) NULL,
	[ConstSymbolCode] [varchar](20) NULL,
	[ConstSymbolDesc] [varchar](50) NULL,
	[ClassCode] [varchar](20) NULL,
	[ClassDesc] [varchar](256) NULL,
	[LocationDesc] [varchar](255) NULL,
	[CityLimitCode] [varchar](20) NULL,
	[UndwrReferenceCode] [varchar](30) NULL,
	[MilesFireStation] [decimal](19, 4) NULL,
	[PropAppraisalDate] [datetime] NULL,
	[ComplexName] [varchar](50) NULL,
	[ProbableMaximumLossAmt] [decimal](19, 4) NULL,
	[RegisteredStateCode] [varchar](20) NULL,
	[FireDistrName] [varchar](100) NULL,
	[LatitudeId] [decimal](9, 6) NULL,
	[LongitudeId] [decimal](9, 6) NULL,
 CONSTRAINT [PK_QuoteWatercraftLocation] PRIMARY KEY CLUSTERED 
(
	[QuoteWatercraftLocationSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_QuoteWatercraftLocation]    Script Date: 27.10.2022 12:28:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_QuoteWatercraftLocation] ON [PreBind].[QuoteWatercraftLocation]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteWatercraftLocation]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteWatercraftSK_QuoteWatercraftLocation] FOREIGN KEY([QuoteWatercraftSK])
REFERENCES [PreBind].[QuoteWatercraft] ([QuoteWatercraftSK])
GO
ALTER TABLE [PreBind].[QuoteWatercraftLocation] NOCHECK CONSTRAINT [FK_QuoteWatercraftSK_QuoteWatercraftLocation]
GO
ALTER TABLE [PreBind].[QuoteWatercraftLocation]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteWatercraftLocation] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteWatercraftLocation] NOCHECK CONSTRAINT [FK_SourceSystemSK_QuoteWatercraftLocation]
GO
ALTER TABLE [PreBind].[QuoteWatercraftLocation]  WITH NOCHECK ADD  CONSTRAINT [RefCountry973] FOREIGN KEY([CountrySK])
REFERENCES [Typelist].[Country] ([CountrySK])
GO
ALTER TABLE [PreBind].[QuoteWatercraftLocation] NOCHECK CONSTRAINT [RefCountry973]
GO
ALTER TABLE [PreBind].[QuoteWatercraftLocation]  WITH NOCHECK ADD  CONSTRAINT [RefState972] FOREIGN KEY([StateSK])
REFERENCES [Typelist].[State] ([StateSK])
GO
ALTER TABLE [PreBind].[QuoteWatercraftLocation] NOCHECK CONSTRAINT [RefState972]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The physical location of a vehicle during the policy term.  Example garage or other physical object location' , @level0type=N'SCHEMA',@level0name=N'PreBind', @level1type=N'TABLE',@level1name=N'QuoteWatercraftLocation'
GO
