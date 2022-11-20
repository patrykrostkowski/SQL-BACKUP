USE [DataMagnifier]
GO
/****** Object:  View [StgPolicy].[SrcSafetyFeatureEquipment]    Script Date: 20.11.2022 14:18:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [StgPolicy].[SrcSafetyFeatureEquipment]
AS
SELECT SourceSystemCode
	,SafetyFeatureEquipmentCode
	,SafetyFeatureEquipmentName
FROM (


	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SafetyFeatureEquipmentCode ORDER BY SafetyFeatureEquipmentName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,vsf.SafetyFeatureEquipmentCode
			,ISNULL(vsf.SafetyFeatureEquipmentDesc, '') AS SafetyFeatureEquipmentName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol	
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (Geography NVARCHAR(MAX) AS JSON) lob
		CROSS APPLY OPENJSON(lob.Geography) WITH (InsurableObject NVARCHAR(MAX) AS JSON) grg
		CROSS APPLY OPENJSON(grg.InsurableObject) WITH (Vehicle NVARCHAR(MAX) AS JSON) ino
		CROSS APPLY OPENJSON(ino.Vehicle) WITH (VehicleSafetyFeature NVARCHAR(MAX) AS JSON) vhc
		CROSS APPLY OPENJSON(vhc.VehicleSafetyFeature) WITH (SafetyFeatureEquipmentCode NVARCHAR(MAX), SafetyFeatureEquipmentDesc NVARCHAR(MAX)) vsf
		WHERE ISNULL(vsf.SafetyFeatureEquipmentCode, '') <> ''
		) AS tmp
	) AS tpl
GO
