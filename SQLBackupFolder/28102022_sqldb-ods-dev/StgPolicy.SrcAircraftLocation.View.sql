USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcAircraftLocation]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE    VIEW [StgPolicy].[SrcAircraftLocation]
AS
SELECT hdr.SourceSystemCode
	,arl.AircraftLocationSourceCode AS SourceCode
	,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,air.AircraftSourceCode	
	,arl.IsPrivateStripInd
	,arl.FacilityName
	,arl.FacilityDesc
	,arl.FacilityLastBuildYear
	,arl.StorageTypeCode
	,arl.AddressLine1
	,arl.AddressLine2
	,arl.AddressLine3
	,arl.AddressLine4
	,arl.CityName
	,arl.PostalCode
	,arl.StateCode
	,arl.TerritoryName
	,arl.TaxTerritoryName
	,arl.TownName
	,arl.CountyName
	,arl.CountryCode
	,arl.ConstTypeCode
	,arl.ConstTypeDesc
	,arl.RunwayLenghtNum
	,arl.ElevationValueNum
	,arl.ProbableMaximumLossAmt
	,arl.LatitudeId
	,arl.LongitudeId
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
		Aircraft NVARCHAR(max) AS JSON
		) ino
CROSS APPLY OPENJSON(ino.Aircraft) WITH (
		AircraftSourceCode NVARCHAR(max)
		,AircraftLocation NVARCHAR(max) AS JSON
		) air
CROSS APPLY OPENJSON(air.AircraftLocation) WITH (
		AircraftLocationSourceCode NVARCHAR(max)
		,IsPrivateStripInd NVARCHAR(max)
		,FacilityName NVARCHAR(max)
		,FacilityDesc NVARCHAR(max)
		,FacilityLastBuildYear NVARCHAR(max)
		,StorageTypeCode NVARCHAR(max)
		,AddressLine1 NVARCHAR(max)
		,AddressLine2 NVARCHAR(max)
		,AddressLine3 NVARCHAR(max)
		,AddressLine4 NVARCHAR(max)
		,CityName NVARCHAR(max)
		,PostalCode NVARCHAR(max)
		,StateCode NVARCHAR(max)
		,TerritoryName NVARCHAR(max)
		,TaxTerritoryName NVARCHAR(max)
		,TownName NVARCHAR(max)
		,CountyName NVARCHAR(max)
		,CountryCode NVARCHAR(max)
		,ConstTypeCode NVARCHAR(max)
		,ConstTypeDesc NVARCHAR(max)
		,RunwayLenghtNum NVARCHAR(max)
		,ElevationValueNum NVARCHAR(max)
		,ProbableMaximumLossAmt NVARCHAR(max)
		,LatitudeId NVARCHAR(max)
		,LongitudeId NVARCHAR(max)
		) arl
GO
