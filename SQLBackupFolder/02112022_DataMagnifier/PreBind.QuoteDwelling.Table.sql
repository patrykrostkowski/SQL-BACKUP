USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteDwelling]    Script Date: 02.11.2022 09:09:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteDwelling](
	[QuoteDwellingSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuotePropertySK] [int] NOT NULL,
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
	[IsAdditionalResidenceInd] [varchar](255) NULL,
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
	[YearBuilt] [varchar](2) NULL,
	[DistanceToFireStation] [decimal](8, 2) NULL,
	[DistanceToHydrant] [decimal](8, 2) NULL,
 CONSTRAINT [PK_QuoteDwelling] PRIMARY KEY CLUSTERED 
(
	[QuoteDwellingSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteDwelling]  WITH CHECK ADD  CONSTRAINT [FK_QuotePropertySK_QuoteDwelling] FOREIGN KEY([QuotePropertySK])
REFERENCES [PreBind].[QuoteProperty] ([QuotePropertySK])
GO
ALTER TABLE [PreBind].[QuoteDwelling] CHECK CONSTRAINT [FK_QuotePropertySK_QuoteDwelling]
GO
ALTER TABLE [PreBind].[QuoteDwelling]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteDwelling] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteDwelling] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteDwelling]
GO
