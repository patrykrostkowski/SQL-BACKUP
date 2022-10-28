USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcWatercraftLocation]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE      VIEW [StgPolicy].[SrcWatercraftLocation]
AS
SELECT hdr.SourceSystemCode
	,wal.WatercraftLocationSourceCode AS SourceCode
	,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,wat.WatercraftSourceCode	
	,wal.SlipNum
	,wal.AddressLine1
	,wal.AddressLine2
	,wal.AddressLine3
	,wal.AddressLine4
	,wal.CityName
	,wal.PostalCode
	,wal.StateCode -- FK
	,wal.TerritoryName
	,wal.TaxTerritoryName
	,wal.TownName
	,wal.CountyName
	,wal.CountryCode -- FK
	,wal.ConstTypeCode
	,wal.ConstTypeDesc
	,wal.YearBuilt
	,wal.ConstYear
	,wal.DistToWaterCode AS DisttoWaterCode
	,wal.DistToWaterDesc
	,wal.ConstSymbolCode
	,wal.ConstSymbolDesc
	,wal.ClassCode
	,wal.ClassDesc
	,wal.LocationDesc
	,wal.CityLimitCode
	,wal.UndwrReferenceCode
	,wal.MilesFireStation
	,try_convert(DATETIME, wal.PropAppraisalDate, 127) AS PropAppraisalDate
	,wal.ComplexName
	,wal.ProbableMaximumLossAmt
	,wal.RegisteredStateCode
	,wal.FireDistrName
	,wal.LatitudeId
	,wal.LongitudeId
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
		Watercraft NVARCHAR(max) AS JSON
		) ino
CROSS APPLY OPENJSON(ino.Watercraft) WITH (
		WatercraftSourceCode NVARCHAR(max)
		,WatercraftLocation NVARCHAR(max) AS JSON
		) wat
CROSS APPLY OPENJSON(wat.WatercraftLocation) WITH (
		WatercraftLocationSourceCode NVARCHAR(max)
		,SlipNum NVARCHAR(max)
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
		,YearBuilt NVARCHAR(max)
		,ConstYear NVARCHAR(max)
		,DistToWaterCode NVARCHAR(max)
		,DistToWaterDesc NVARCHAR(max)
		,ConstSymbolCode NVARCHAR(max)
		,ConstSymbolDesc NVARCHAR(max)
		,ClassCode NVARCHAR(max)
		,ClassDesc NVARCHAR(max)
		,LocationDesc NVARCHAR(max)
		,CityLimitCode NVARCHAR(max)
		,UndwrReferenceCode NVARCHAR(max)
		,MilesFireStation NVARCHAR(max)
		,PropAppraisalDate NVARCHAR(max)
		,ComplexName NVARCHAR(max)
		,ProbableMaximumLossAmt NVARCHAR(max)
		,RegisteredStateCode NVARCHAR(max)
		,FireDistrName NVARCHAR(max)
		,LatitudeId NVARCHAR(max)
		,LongitudeId NVARCHAR(max)
		
		) wal
GO
