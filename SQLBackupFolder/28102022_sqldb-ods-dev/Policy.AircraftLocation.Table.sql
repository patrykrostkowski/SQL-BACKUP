USE [sqldb-ods-dev]
GO
/****** Object:  Table [Policy].[AircraftLocation]    Script Date: 28.10.2022 15:04:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[AircraftLocation](
	[AircraftLocationSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](255) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[AircraftSK] [int] NOT NULL,
	[IsPrivateStripInd] [tinyint] NOT NULL,
	[FacilityName] [varchar](50) NULL,
	[FacilityDesc] [varchar](255) NULL,
	[FacilityLastBuildYear] [varchar](4) NULL,
	[StorageTypeCode] [varchar](25) NULL,
	[AddressLine1] [varchar](128) NULL,
	[AddressLine2] [varchar](128) NULL,
	[AddressLine3] [varchar](50) NULL,
	[AddressLine4] [varchar](100) NULL,
	[CityName] [varchar](128) NULL,
	[PostalCode] [varchar](100) NULL,
	[StateSK] [int] NOT NULL,
	[TerritoryName] [varchar](50) NULL,
	[TaxTerritoryName] [varchar](50) NULL,
	[TownName] [varchar](50) NULL,
	[CountyName] [varchar](50) NULL,
	[CountrySK] [int] NOT NULL,
	[ConstTypeCode] [varchar](3) NULL,
	[ConstTypeDesc] [varchar](50) NULL,
	[RunwayLenghtNum] [decimal](12, 3) NULL,
	[ElevationValueNum] [decimal](12, 3) NULL,
	[ProbableMaximumLossAmt] [decimal](19, 4) NULL,
	[LatitudeId] [decimal](9, 6) NULL,
	[LongitudeId] [decimal](9, 6) NULL,
 CONSTRAINT [PK_AircraftLocation] PRIMARY KEY CLUSTERED 
(
	[AircraftLocationSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_AircraftLocation]    Script Date: 28.10.2022 15:06:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_AircraftLocation] ON [Policy].[AircraftLocation]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Policy].[AircraftLocation]  WITH NOCHECK ADD  CONSTRAINT [FK_AircraftSK_AircraftLocation] FOREIGN KEY([AircraftSK])
REFERENCES [Policy].[Aircraft] ([AircraftSK])
GO
ALTER TABLE [Policy].[AircraftLocation] NOCHECK CONSTRAINT [FK_AircraftSK_AircraftLocation]
GO
ALTER TABLE [Policy].[AircraftLocation]  WITH NOCHECK ADD  CONSTRAINT [FK_CountrySK_AircraftLocation] FOREIGN KEY([CountrySK])
REFERENCES [Typelist].[Country] ([CountrySK])
GO
ALTER TABLE [Policy].[AircraftLocation] NOCHECK CONSTRAINT [FK_CountrySK_AircraftLocation]
GO
ALTER TABLE [Policy].[AircraftLocation]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_AircraftLocation] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[AircraftLocation] NOCHECK CONSTRAINT [FK_SourceSystemSK_AircraftLocation]
GO
ALTER TABLE [Policy].[AircraftLocation]  WITH NOCHECK ADD  CONSTRAINT [FK_StateSK_AircraftLocation] FOREIGN KEY([StateSK])
REFERENCES [Typelist].[State] ([StateSK])
GO
ALTER TABLE [Policy].[AircraftLocation] NOCHECK CONSTRAINT [FK_StateSK_AircraftLocation]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The physical location of a an aircraft during the policy term.  Example hangers, garage, tie-donw locations  or other physical object location' , @level0type=N'SCHEMA',@level0name=N'Policy', @level1type=N'TABLE',@level1name=N'AircraftLocation'
GO
