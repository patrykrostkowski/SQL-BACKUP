USE [sqldb-ods-dev]
GO
/****** Object:  Table [Policy].[Dwelling]    Script Date: 28.10.2022 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[Dwelling](
	[DwellingSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](255) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PropertySK] [int] NOT NULL,
	[SequenceNum] [int] NULL,
	[DwellingUsageTypeSK] [int] NOT NULL,
	[ResideinDwellingNum] [int] NULL,
	[PurchaseDate] [date] NULL,
	[OilStorageTankLocationCode] [varchar](20) NULL,
	[OilStorageTankLocationDesc] [varchar](255) NULL,
	[FuelLineLocationCode] [varchar](20) NULL,
	[FuelLineLocationDesc] [varchar](255) NULL,
	[WiringTypeCode] [varchar](20) NULL,
	[WiringTypeDesc] [varchar](255) NULL,
	[WiringInspectedDate] [date] NULL,
	[StormShuttersCode] [varchar](20) NULL,
	[StormShuttersDesc] [varchar](255) NULL,
	[AreaTypeSurroundingsCode] [varchar](20) NULL,
	[AreaTypeSurroundingsDesc] [varchar](255) NULL,
	[PlumbingConditionCode] [varchar](20) NULL,
	[PlumbingConditionDesc] [varchar](255) NULL,
	[RoofConditionCode] [varchar](20) NULL,
	[RoofConditionDesc] [varchar](255) NULL,
	[OccupancyTypeCode] [varchar](20) NULL,
	[OccupancyTypeDesc] [varchar](255) NULL,
	[ProtectionDeviceBurglarCode] [varchar](20) NULL,
	[ProtectionDeviceBurglarDesc] [varchar](255) NULL,
	[ProtectionDeviceFireCode] [varchar](20) NULL,
	[ProtectionDeviceFireDesc] [varchar](255) NULL,
	[ProtectionDeviceSprinklerCode] [varchar](20) NULL,
	[ProtectionDeviceSprinklerDesc] [varchar](255) NULL,
	[RoofMaterialCode] [varchar](20) NULL,
	[RoofMaterialDesc] [varchar](255) NULL,
	[NatureBusinessCode] [varchar](20) NULL,
	[NatureBusinessDesc] [varchar](255) NULL,
	[LandArea] [varchar](255) NULL,
	[FloorUnitNum] [int] NULL,
	[IsAdditionalResidenceInd] [tinyint] NULL,
	[IsBusinessonPremiseInd] [tinyint] NULL,
	[IsPrincipalUnitAtRiskInd] [tinyint] NULL,
	[IsPublicOfficeInd] [tinyint] NULL,
	[IsThermostatCentralHeatInd] [tinyint] NULL,
	[IsHistoricHomeInd] [tinyint] NULL,
	[IsVisibilityInd] [tinyint] NULL,
	[IsVisibleToRoadInd] [tinyint] NULL,
	[IsSafetyNetInd] [tinyint] NULL,
	[HillsidePct] [decimal](8, 2) NULL,
	[PurchasePriceAmt] [decimal](18, 10) NULL,
	[OtherStructureAmt] [decimal](18, 10) NULL,
	[YearOccupancy] [int] NULL,
	[NumRooms] [int] NULL,
	[NumApartments] [int] NULL,
	[NumUnits] [int] NULL,
	[IsDaytimeOccupancyInd] [tinyint] NULL,
	[NumBoarders] [int] NULL,
	[NumChildren] [int] NULL,
	[NumResidentsInHousehold] [int] NULL,
	[LengthTimeRented] [varchar](20) NULL,
	[LengthTimeConsecutivelyOccupied] [varchar](20) NULL,
	[HousekeepingConditionDesc] [varchar](255) NULL,
	[PayorDesc] [varchar](255) NULL,
	[ConstructionCode] [varchar](255) NULL,
	[YearBuilt] [varchar](4) NULL,
	[DistanceToFireStation] [decimal](8, 2) NULL,
	[DistanceToHydrant] [decimal](8, 2) NULL,
 CONSTRAINT [PK_Dwelling] PRIMARY KEY CLUSTERED 
(
	[DwellingSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_Dwelling]    Script Date: 28.10.2022 11:11:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_Dwelling] ON [Policy].[Dwelling]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Policy].[Dwelling]  WITH NOCHECK ADD  CONSTRAINT [FK_DwellingUsageTypeSK_Dwelling] FOREIGN KEY([DwellingUsageTypeSK])
REFERENCES [Typelist].[DwellingUsageType] ([DwellingUsageTypeSK])
GO
ALTER TABLE [Policy].[Dwelling] NOCHECK CONSTRAINT [FK_DwellingUsageTypeSK_Dwelling]
GO
ALTER TABLE [Policy].[Dwelling]  WITH NOCHECK ADD  CONSTRAINT [FK_PropertySK_Dwelling] FOREIGN KEY([PropertySK])
REFERENCES [Policy].[Property] ([PropertySK])
GO
ALTER TABLE [Policy].[Dwelling] NOCHECK CONSTRAINT [FK_PropertySK_Dwelling]
GO
ALTER TABLE [Policy].[Dwelling]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_Dwelling] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[Dwelling] NOCHECK CONSTRAINT [FK_SourceSystemSK_Dwelling]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This concept gives particular features of a dwelling. A dwelling can be further described by a dwelling description (DwellingDetail) and completely described by specifying each of its composing elements: rooms, cellars, garages, etc.' , @level0type=N'SCHEMA',@level0name=N'Policy', @level1type=N'TABLE',@level1name=N'Dwelling'
GO
