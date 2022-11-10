USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[VehicleLocation]    Script Date: 10.11.2022 12:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[VehicleLocation](
	[VehicleLocationSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[VehicleSK] [int] NULL,
	[SequenceNum] [varchar](20) NULL,
	[BldgNum] [int] NULL,
	[AddressLine1] [varchar](128) NULL,
	[AddressLine2] [varchar](128) NULL,
	[AddressLine3] [varchar](50) NULL,
	[AddressLine4] [varchar](100) NULL,
	[CityName] [varchar](128) NULL,
	[PostalCode] [varchar](100) NULL,
	[StateSK] [int] NULL,
	[TerritoryCode] [varchar](20) NULL,
	[TerritoryDesc] [varchar](50) NULL,
	[TaxTerritoryCode] [varchar](20) NULL,
	[TaxTerritoryDesc] [varchar](50) NULL,
	[TownCode] [varchar](20) NULL,
	[TownDesc] [varchar](50) NULL,
	[CountyCode] [varchar](20) NULL,
	[CountyDesc] [varchar](50) NULL,
	[CountrySK] [int] NOT NULL,
	[ConstTypeCode] [varchar](3) NULL,
	[ConstTypeDesc] [varchar](50) NULL,
	[NumOfStories] [int] NULL,
	[NumSqrFt] [int] NULL,
	[NumUnits] [int] NULL,
	[YearBuilt] [varchar](4) NULL,
	[ProtectionClassCode] [varchar](20) NULL,
	[ProtectionlassDesc] [varchar](50) NULL,
	[ConstYear] [varchar](4) NULL,
	[DisttoWaterCode] [varchar](20) NULL,
	[DistToWaterDesc] [varchar](50) NULL,
	[NumOfBldgs] [int] NULL,
	[ConstSymbolCode] [varchar](20) NULL,
	[ConstSymbolDesc] [varchar](50) NULL,
	[SpklrProtTypeCode] [varchar](20) NULL,
	[SpklrProtTypeDesc] [varchar](50) NULL,
	[EQTerrCode] [varchar](20) NULL,
	[EQTerrDesc] [varchar](50) NULL,
	[OccupancyCode] [int] NULL,
	[OccupancyDesc] [varchar](50) NULL,
	[RateVersionEffectiveDate] [date] NULL,
	[RateVersionWrittenDate] [date] NULL,
	[ClassCode] [varchar](20) NULL,
	[ClassDesc] [varchar](256) NULL,
	[LocationDesc] [varchar](255) NULL,
	[OperationsStartHr] [varchar](20) NULL,
	[OperationsEndHr] [varchar](20) NULL,
	[CityLimitCode] [varchar](20) NULL,
	[UndwrRefId] [int] NULL,
	[MilesFireStation] [decimal](19, 4) NULL,
	[WildfireHazardScore] [int] NULL,
	[PropAppraisalDate] [date] NULL,
	[ComplexName] [varchar](50) NULL,
	[ProbableMaximumLossAmt] [decimal](19, 4) NULL,
	[RegisteredStateCode] [varchar](20) NULL,
	[FireDistrNm] [varchar](100) NULL,
	[LatitudeId] [decimal](9, 6) NULL,
	[LongitudeId] [decimal](9, 6) NULL,
 CONSTRAINT [PK_VehicleLocation] PRIMARY KEY CLUSTERED 
(
	[VehicleLocationSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Policy].[VehicleLocation]  WITH CHECK ADD  CONSTRAINT [FK_CountrySK_VehicleLocation] FOREIGN KEY([CountrySK])
REFERENCES [TypeList].[Country] ([CountrySK])
GO
ALTER TABLE [Policy].[VehicleLocation] CHECK CONSTRAINT [FK_CountrySK_VehicleLocation]
GO
ALTER TABLE [Policy].[VehicleLocation]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_VehicleLocation] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[VehicleLocation] CHECK CONSTRAINT [FK_SourceSystemSK_VehicleLocation]
GO
ALTER TABLE [Policy].[VehicleLocation]  WITH CHECK ADD  CONSTRAINT [FK_StateSK_VehicleLocation] FOREIGN KEY([StateSK])
REFERENCES [TypeList].[State] ([StateSK])
GO
ALTER TABLE [Policy].[VehicleLocation] CHECK CONSTRAINT [FK_StateSK_VehicleLocation]
GO
ALTER TABLE [Policy].[VehicleLocation]  WITH CHECK ADD  CONSTRAINT [FK_VehicleSK_VehicleLocation] FOREIGN KEY([VehicleSK])
REFERENCES [Policy].[Vehicle] ([VehicleSK])
GO
ALTER TABLE [Policy].[VehicleLocation] CHECK CONSTRAINT [FK_VehicleSK_VehicleLocation]
GO
