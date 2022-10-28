﻿USE [sqldb-ods-dev]
GO
/****** Object:  Table [Policy].[WatercraftLocation]    Script Date: 28.10.2022 12:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[WatercraftLocation](
	[WatercraftLocationSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[WatercraftSK] [int] NOT NULL,
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
	[DistancetoWaterDesc] [varchar](50) NULL,
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
 CONSTRAINT [PK_WatercraftLocation] PRIMARY KEY CLUSTERED 
(
	[WatercraftLocationSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_WatercraftLocation]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_WatercraftLocation] ON [Policy].[WatercraftLocation]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Policy].[WatercraftLocation]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_WatercraftLocation] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[WatercraftLocation] NOCHECK CONSTRAINT [FK_SourceSystemSK_WatercraftLocation]
GO
ALTER TABLE [Policy].[WatercraftLocation]  WITH NOCHECK ADD  CONSTRAINT [FK_WatercraftSK_WatercraftLocation] FOREIGN KEY([WatercraftSK])
REFERENCES [Policy].[Watercraft] ([WatercraftSK])
GO
ALTER TABLE [Policy].[WatercraftLocation] NOCHECK CONSTRAINT [FK_WatercraftSK_WatercraftLocation]
GO
ALTER TABLE [Policy].[WatercraftLocation]  WITH NOCHECK ADD  CONSTRAINT [RefCountry971] FOREIGN KEY([CountrySK])
REFERENCES [Typelist].[Country] ([CountrySK])
GO
ALTER TABLE [Policy].[WatercraftLocation] NOCHECK CONSTRAINT [RefCountry971]
GO
ALTER TABLE [Policy].[WatercraftLocation]  WITH NOCHECK ADD  CONSTRAINT [RefState970] FOREIGN KEY([StateSK])
REFERENCES [Typelist].[State] ([StateSK])
GO
ALTER TABLE [Policy].[WatercraftLocation] NOCHECK CONSTRAINT [RefState970]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The physical location of a vehicle during the policy term.  Example garage or other physical object location' , @level0type=N'SCHEMA',@level0name=N'Policy', @level1type=N'TABLE',@level1name=N'WatercraftLocation'
GO
