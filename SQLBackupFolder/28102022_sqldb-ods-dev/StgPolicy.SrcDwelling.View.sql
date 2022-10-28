USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcDwelling]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE     VIEW [StgPolicy].[SrcDwelling]
AS

SELECT 
	hdr.SourceSystemCode	
	,dwl.DwellingSourceCode as SourceCode
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,prp.PropertySourceCode
	,dwl.AreaTypeSurroundingsCode ,
dwl.AreaTypeSurroundingsDesc ,
dwl.ConstructionCode,
dwl.DistanceToFireStation ,
dwl.DistanceToHydrant ,
dwl.DwellingUsageTypeCode ,
dwl.FloorUnitNum ,
dwl.FuelLineLocationCode ,
dwl.FuelLineLocationDesc ,
dwl.HillsidePct ,
dwl.HousekeepingConditionDesc ,
dwl.IsAdditionalResidenceInd,
dwl.IsBusinessonPremiseInd,
dwl.IsDaytimeOccupancyInd,
dwl.IsHistoricHomeInd,
dwl.IsPrincipalUnitAtRiskInd,
dwl.IsPublicOfficeInd,
dwl.IsSafetyNetInd,
dwl.IsThermostatCentralHeatInd,
dwl.IsVisibilityInd ,
dwl.IsVisibleToRoadInd ,
dwl.LandArea ,
dwl.LengthTimeConsecutivelyOccupied ,
dwl.LengthTimeRented ,
dwl.NatureBusinessCode ,
dwl.NatureBusinessDesc ,
dwl.NumApartments ,
dwl.NumBoarders ,
dwl.NumChildren,
dwl.NumResidentsInHousehold,
dwl.NumRooms,
dwl.NumUnits,
dwl.OccupancyTypeCode,
dwl.OccupancyTypeDesc,
dwl.OilStorageTankLocationCode,
dwl.OilStorageTankLocationDesc,
dwl.OtherStructureAmt,
dwl.PayorDesc,
dwl.PlumbingConditionCode,
dwl.PlumbingConditionDesc,
dwl.ProtectionDeviceBurglarCode,
dwl.ProtectionDeviceBurglarDesc,
dwl.ProtectionDeviceFireCode,
dwl.ProtectionDeviceFireDesc,
dwl.ProtectionDeviceSprinklerCode,
dwl.ProtectionDeviceSprinklerDesc,
TRY_CONVERT(DATETIME, dwl.PurchaseDate, 127)	AS PurchaseDate,
dwl.PurchasePriceAmt,
dwl.ResideinDwellingNum,
dwl.RoofConditionCode,
dwl.RoofConditionDesc,
dwl.RoofMaterialCode,
dwl.RoofMaterialDesc,
dwl.SequenceNum,
dwl.StormShuttersCode,
dwl.StormShuttersDesc,
TRY_CONVERT(DATETIME, dwl.WiringInspectedDate, 127)	AS WiringInspectedDate ,
dwl.WiringTypeCode,
dwl.WiringTypeDesc ,
dwl.YearBuilt,
dwl.YearOccupancy
,line.IsValidInd	

FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(MAX)
	,ProcessDateTime NVARCHAR(MAX)
	,Policy NVARCHAR(MAX) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (
	PolicyTrans NVARCHAR(MAX) AS JSON
	) pol
CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (
	LineOfBusiness NVARCHAR(MAX) AS JSON
	) plt
CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (
	Geography NVARCHAR(MAX) AS JSON
	) lob
CROSS APPLY OPENJSON(lob.Geography) WITH (
	InsurableObject NVARCHAR(MAX) AS JSON
	) grg
CROSS APPLY OPENJSON(grg.InsurableObject) WITH (
	Property NVARCHAR(MAX) AS JSON
	) ino
CROSS APPLY OPENJSON(ino.Property) WITH (
	Dwelling NVARCHAR(MAX) AS JSON
	,PropertySourceCode NVARCHAR(MAX)
	) prp
CROSS APPLY OPENJSON(prp.Dwelling) WITH (
	DwellingSourceCode nvarchar(max),
AreaTypeSurroundingsCode nvarchar(max),
AreaTypeSurroundingsDesc nvarchar(max),
ConstructionCode nvarchar(max),
DistanceToFireStation nvarchar(max),
DistanceToHydrant nvarchar(max),
DwellingSourceCode nvarchar(max),
DwellingUsageTypeCode nvarchar(max),
DwellingUsageTypeDesc nvarchar(max),
FloorUnitNum INT,
FuelLineLocationCode nvarchar(max),
FuelLineLocationDesc nvarchar(max),
HillsidePct nvarchar(max),
HousekeepingConditionDesc nvarchar(max),
IsAdditionalResidenceInd INT,
IsBusinessonPremiseInd INT,
IsDaytimeOccupancyInd INT,
IsHistoricHomeInd INT,
IsPrincipalUnitAtRiskInd INT,
IsPublicOfficeInd INT,
IsSafetyNetInd INT,
IsThermostatCentralHeatInd INT,
IsVisibilityInd INT,
IsVisibleToRoadInd INT,
LandArea nvarchar(max),
LengthTimeConsecutivelyOccupied nvarchar(max),
LengthTimeRented nvarchar(max),
NatureBusinessCode nvarchar(max),
NatureBusinessDesc nvarchar(max),
NumApartments INT,
NumBoarders INT,
NumChildren INT,
NumResidentsInHousehold INT,
NumRooms INT,
NumUnits INT,
OccupancyTypeCode nvarchar(max),
OccupancyTypeDesc nvarchar(max),
OilStorageTankLocationCode nvarchar(max),
OilStorageTankLocationDesc nvarchar(max),
OtherStructureAmt nvarchar(max),
PayorDesc nvarchar(max),
PlumbingConditionCode nvarchar(max),
PlumbingConditionDesc nvarchar(max),
ProtectionDeviceBurglarCode nvarchar(max),
ProtectionDeviceBurglarDesc nvarchar(max),
ProtectionDeviceFireCode nvarchar(max),
ProtectionDeviceFireDesc nvarchar(max),
ProtectionDeviceSprinklerCode nvarchar(max),
ProtectionDeviceSprinklerDesc nvarchar(max),
PurchaseDate nvarchar(max),
PurchasePriceAmt nvarchar(max),
ResideinDwellingNum INT,
RoofConditionCode nvarchar(max),
RoofConditionDesc nvarchar(max),
RoofMaterialCode nvarchar(max),
RoofMaterialDesc nvarchar(max),
SequenceNum INT,
StormShuttersCode nvarchar(max),
StormShuttersDesc nvarchar(max),
WiringInspectedDate nvarchar(max),
WiringTypeCode nvarchar(max),
WiringTypeDesc nvarchar(max),
YearBuilt nvarchar(max),
YearOccupancy INT
	) dwl

GO
