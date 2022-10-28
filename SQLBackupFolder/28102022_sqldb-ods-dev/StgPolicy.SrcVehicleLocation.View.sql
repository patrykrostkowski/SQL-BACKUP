USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcVehicleLocation]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE    VIEW [StgPolicy].[SrcVehicleLocation]
AS
SELECT hdr.SourceSystemCode
	,convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime  
	,vhl.VehicleLocationSourceCode as SourceCode
	,vhl.SequenceNum
	,vhl.BldgNum
	,vhl.AddressLine1
	,vhl.AddressLine2
	,vhl.AddressLine3
	,vhl.AddressLine4
	,vhl.CityName
	,vhl.TerritoryName
	,vhl.TownName
	,vhl.ConstTypeCode
	,vhl.ConstTypeDesc
	,vhl.NumOfStories
	,vhl.NumSqrFt
	,vhl.NumUnits
	,vhl.YearBuilt
	,vhl.ProtectionClassCode
	,vhl.ProtectionClassDesc
	,vhl.ConstYear
	,vhl.DistanceToWaterCode
	,vhl.DistanceToWaterDesc
	,vhl.NumOfBldgs
	,vhl.ConstSymbolCode 
	,vhl.ConstSymbolDesc
	,vhl.SpklrProtTypeCode
	,vhl.SpklrProtTypeDesc
	,vhl.EQTerrCode
	,vhl.EQTerrDesc
	,vhl.OccupancyCode 
	,vhl.RateVersionEffectiveDate
	,vhl.RateVersionWrittenDate
	,vhl.ClassCode
	,vhl.ClassDesc
	,vhl.LocationDesc
	,vhl.OperationsStartHr
	,vhl.OperationsEndHr
	,vhl.CityLimitCode
	,vhl.UndwrRefId
	,vhl.MilesFireStation
	,vhl.WildfireHazardScore
	,vhl.PropAppraisalDate
	,vhl.RegisteredStateCode 
	,vhl.FireDistrNm
	,vhl.LatitudeId
	,vhl.LongitudeId
	,vhl.PostalCode
	,vhl.CountyName
	,vhl.StateCode
	,vhl.CountryCode
	,vhc.VehicleSourceCode
	,line.IsValidInd





FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Policy NVARCHAR(max) AS JSON
		) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (
		PolicyTrans NVARCHAR(max) AS JSON
		) pol
cross APPLY OPENJsoN(pol.PolicyTrans) WITH (
	LineOfBusiness nvarchar(max) AS JSON
)ptr
cross apply openjson(ptr.LineOfBusiness) with (
 Geography nvarchar(max) as json
) lob
cross apply openjson(lob.Geography) with (
 InsurableObject nvarchar(max) as json
) geo
cross apply openjson(geo.insurableobject) with(
Vehicle nvarchar(max) as json
,InsurableObjectSourceCode nvarchar(max)
) iob
cross apply openjson(iob.vehicle) with (
VehicleSourceCode  nvarchar(max)
,VehicleLocation nvarchar(max) as json
)vhc
Cross Apply openjson(vhc.vehicleLocation) with (
VehicleLocationSourceCode nvarchar(max),
SequenceNum nvarchar(max),
BldgNum int,
AddressLine1 nvarchar(max),
AddressLine2 nvarchar(max),
AddressLine4 nvarchar(max),
CityName nvarchar(max),
TerritoryName nvarchar(max),
TownName nvarchar(max),
ConstTypeCode nvarchar(max),
ConstTypeDesc nvarchar(max),
NumOfStories nvarchar(max),
NumSqrFt int,
NumUnits int,
YearBuilt nvarchar(max),
ProtectionClassCode nvarchar(max),
ProtectionClassDesc nvarchar(max),
ConstYear nvarchar(max),
DistanceToWaterCode nvarchar(max),
DistanceToWaterDesc nvarchar(max),
NumOfBldgs nvarchar(max),
ConstSymbolCode nvarchar(max),
ConstSymbolDesc nvarchar(max),
SpklrProtTypeCode nvarchar(max),
SpklrProtTypeDesc nvarchar(max),
EQTerrCode nvarchar(max),
EQTerrDesc  nvarchar(max),
OccupancyCode  nvarchar(max),
RateVersionEffectiveDate datetime,
RateVersionWrittenDate datetime,
ClassCode nvarchar(max),
ClassDesc nvarchar(max),
LocationDesc nvarchar(max),
OperationsStartHr nvarchar(max),
OperationsEndHr  nvarchar(max),
CityLimitCode nvarchar(max),
UndwrRefId int,
MilesFireStation decimal(19,4),
WildfireHazardScore int,
PropAppraisalDate date,
RegisteredStateCode  nvarchar(max),
FireDistrNm  nvarchar(max),
LatitudeId decimal(9,6),
LongitudeId decimal(9,6),
PostalCode nvarchar(max),
AddressLine3 nvarchar(max),
CountyName nvarchar(max),
StateCode nvarchar(max),
CountryCode nvarchar(max)
)vhl
WHERE 1 = 1
GO
