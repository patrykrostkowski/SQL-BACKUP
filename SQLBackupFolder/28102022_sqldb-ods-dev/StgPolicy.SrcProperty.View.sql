USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcProperty]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE      VIEW [StgPolicy].[SrcProperty]
AS
SELECT hdr.SourceSystemCode
	,pro.PropertySourceCode AS SourceCode
	,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,ino.InsurableObjectSourceCode
	,pro.SequenceNum
	,pro.AddressLine1
	,pro.AddressLine2
	,pro.AddressLine3
	,pro.CityName
	,pro.StateCode
	,pro.TerritoryName
	,pro.TaxTerritoryName
	,pro.TownName
	,pro.CountyName
	,pro.CountryCode
	,pro.PostalCode
	,pro.IsPrimaryInd
	,pro.IsExcludedInd
	,pro.ItemValuationTypeCode
	,pro.ItemValuationAmt
	,pro.PropertyClassCode
	,pro.PropertyClassDesc
	,pro.PropertySubClassCode
	,pro.ProtectionClassCode
	,pro.ProtectionClassDesc
	,pro.ProtectionDeviceSprinklerCode
	,pro.ProtectionDeviceSprinklerDesc
	,pro.ConstTypeCode
	,pro.ConstTypeDesc
	,pro.ConstSymbolCode
	,pro.ConstSymbolDesc
	,pro.EQTerrCode AS EarthquakeCode
	,pro.EQTerrDesc AS EarthquakeDesc
	,pro.DistanceToWaterCode AS DistancetoWaterCode
	,pro.DistanceToWaterDesc
	,pro.ValuationTypeCode
	,pro.ValuationTypeDesc
	,pro.IsMinPremInd AS IsMinimumPremiumInd
	,pro.ManufacturerCode
	,pro.ManufacturerDesc
	,pro.ManufactureMethodCode
	,pro.ManufactureMethodDesc
	,pro.ModelCode
	,pro.ModelDesc
	,pro.CertifyingEntityCode
	,pro.SerialIdNumber
	,pro.ConstYear
	,pro.MilesFireStation
	,pro.NumOfBldgs
	,pro.LatitudeId
	,pro.LongitudeId
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
CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (
		LineOfBusiness NVARCHAR(max) AS JSON
		) ptr
CROSS APPLY OPENJSON(ptr.LineOfBusiness) WITH (
		Geography NVARCHAR(max) AS JSON	
		) lob
CROSS APPLY OPENJSON(lob.Geography) WITH (
		InsurableObject NVARCHAR(max) AS JSON
		) geo
CROSS APPLY OPENJSON(geo.InsurableObject) WITH (
		InsurableObjectSourceCode NVARCHAR(max)
		,Property NVARCHAR(max) AS JSON
		) ino
CROSS APPLY OPENJSON(ino.Property) WITH (
		PropertySourceCode NVARCHAR(max)
		,SequenceNum NVARCHAR(max)
		,AddressLine1 NVARCHAR(max)
		,AddressLine2 NVARCHAR(max)
		,AddressLine3 NVARCHAR(max)
		,CityName NVARCHAR(max)
		,StateCode NVARCHAR(max)
		,TerritoryName NVARCHAR(max)
		,TaxTerritoryName NVARCHAR(max)
		,TownName NVARCHAR(max)
		,CountyName NVARCHAR(max)
		,CountryCode NVARCHAR(max)
		,PostalCode NVARCHAR(max)
		,IsPrimaryInd NVARCHAR(max)
		,IsExcludedInd NVARCHAR(max)
		,ItemValuationTypeCode NVARCHAR(max)
		,ItemValuationAmt NVARCHAR(max)
		,PropertyClassCode NVARCHAR(max)
		,PropertyClassDesc NVARCHAR(max)
		,PropertySubClassCode NVARCHAR(max)
		,ProtectionClassCode NVARCHAR(max)
		,ProtectionClassDesc NVARCHAR(max)
		,ProtectionDeviceSprinklerCode NVARCHAR(max)
		,ProtectionDeviceSprinklerDesc NVARCHAR(max)
		,ConstTypeCode NVARCHAR(max)
		,ConstTypeDesc NVARCHAR(max)
		,ConstSymbolCode NVARCHAR(max)
		,ConstSymbolDesc NVARCHAR(max)
		,EQTerrCode NVARCHAR(max)
		,EQTerrDesc NVARCHAR(max)
		,DistanceToWaterCode NVARCHAR(max)
		,DistanceToWaterDesc NVARCHAR(max)
		,ValuationTypeCode NVARCHAR(max)
		,ValuationTypeDesc NVARCHAR(max)
		,IsMinPremInd NVARCHAR(max)
		,ManufacturerCode NVARCHAR(max)
		,ManufacturerDesc NVARCHAR(max)
		,ManufactureMethodCode NVARCHAR(max)
		,ManufactureMethodDesc NVARCHAR(max)
		,ModelCode NVARCHAR(max)
		,ModelDesc NVARCHAR(max)
		,CertifyingEntityCode NVARCHAR(max)
		,SerialIdNumber NVARCHAR(max)
		,ConstYear NVARCHAR(max)
		,MilesFireStation NVARCHAR(max)
		,NumOfBldgs NVARCHAR(max)
		,LatitudeId NVARCHAR(max)
		,LongitudeId NVARCHAR(max)
		) pro

GO
