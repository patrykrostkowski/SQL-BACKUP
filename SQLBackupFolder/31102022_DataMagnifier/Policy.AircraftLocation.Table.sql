USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[AircraftLocation]    Script Date: 31.10.2022 12:30:52 ******/
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
	[TerritoryCode] [varchar](20) NULL,
	[TerritoryDesc] [varchar](50) NULL,
	[TaxTerritoryCode] [varchar](20) NULL,
	[TaxTerritoryDesc] [varchar](50) NULL,
	[TownCode] [varchar](20) NULL,
	[TownDesc] [varchar](50) NULL,
	[CountyCode] [varchar](20) NULL,
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
ALTER TABLE [Policy].[AircraftLocation]  WITH CHECK ADD  CONSTRAINT [FK_AircraftSK_AircraftLocation] FOREIGN KEY([AircraftSK])
REFERENCES [Policy].[Aircraft] ([AircraftSK])
GO
ALTER TABLE [Policy].[AircraftLocation] CHECK CONSTRAINT [FK_AircraftSK_AircraftLocation]
GO
ALTER TABLE [Policy].[AircraftLocation]  WITH CHECK ADD  CONSTRAINT [FK_CountrySK_AircraftLocation] FOREIGN KEY([CountrySK])
REFERENCES [TypeList].[Country] ([CountrySK])
GO
ALTER TABLE [Policy].[AircraftLocation] CHECK CONSTRAINT [FK_CountrySK_AircraftLocation]
GO
ALTER TABLE [Policy].[AircraftLocation]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_AircraftLocation] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[AircraftLocation] CHECK CONSTRAINT [FK_SourceSystemSK_AircraftLocation]
GO
ALTER TABLE [Policy].[AircraftLocation]  WITH CHECK ADD  CONSTRAINT [FK_StateSK_AircraftLocation] FOREIGN KEY([StateSK])
REFERENCES [TypeList].[State] ([StateSK])
GO
ALTER TABLE [Policy].[AircraftLocation] CHECK CONSTRAINT [FK_StateSK_AircraftLocation]
GO
