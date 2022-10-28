USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcVehicleSafetyFeature]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     VIEW [StgPolicy].[SrcVehicleSafetyFeature]
AS
SELECT hdr.SourceSystemCode
	,vsf.VehicleSafetyFeatureSourceCode AS SourceCode
	,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,veh.VehicleSourceCode
	,vsf.SafetyFeatureEquipmentCode
	,vsf.EquipmentAvailabilityCode
	,vsf.EquipmentAvailabilityDesc
	,vsf.IsUserEquipmentAvailabilityInd
	,vsf.IsEquippedInd
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
		,VehicleSafetyFeature NVARCHAR(max) AS JSON
		) veh
CROSS APPLY OPENJSON(veh.VehicleSafetyFeature) WITH (
		VehicleSafetyFeatureSourceCode NVARCHAR(max)
		,SafetyFeatureEquipmentCode NVARCHAR(max)
		,EquipmentAvailabilityCode NVARCHAR(max)
		,EquipmentAvailabilityDesc NVARCHAR(max)
		,IsUserEquipmentAvailabilityInd NVARCHAR(max)
		,IsEquippedInd NVARCHAR(max)
		) vsf
GO
