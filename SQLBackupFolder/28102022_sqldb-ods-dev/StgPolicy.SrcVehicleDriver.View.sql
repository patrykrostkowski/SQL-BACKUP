USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcVehicleDriver]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     VIEW [StgPolicy].[SrcVehicleDriver]
AS
SELECT hdr.SourceSystemCode
	,ved.VehicleDriverSourceCode AS SourceCode
	,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,veh.VehicleSourceCode
	,ved.DriverSourceCode
	,ved.IsPrimaryDriverInd
	,ved.IsExcludedDriverInd
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
		Vehicle NVARCHAR(max) AS JSON
		) ino
CROSS APPLY OPENJSON(ino.Vehicle) WITH (
		VehicleSourceCode NVARCHAR(max)
		,VehicleDriver NVARCHAR(max) AS JSON
		) veh
CROSS APPLY OPENJSON(veh.VehicleDriver) WITH (
		VehicleDriverSourceCode NVARCHAR(max)
		,DriverSourceCode NVARCHAR(max)
		,IsPrimaryDriverInd NVARCHAR(max)
		,IsExcludedDriverInd NVARCHAR(max)
		) ved
GO
