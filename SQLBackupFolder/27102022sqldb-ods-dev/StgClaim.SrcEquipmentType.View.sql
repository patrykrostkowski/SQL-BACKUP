USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcEquipmentType]    Script Date: 27.10.2022 12:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcEquipmentType]
AS

SELECT SourceSystemCode
	,EquipmentTypeCode
	,EquipmentTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, EquipmentTypeCode ORDER BY EquipmentTypeName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,loa.EquipmentTypeCode
			,ISNULL(loa.EquipmentTypeDesc, '') AS EquipmentTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (LossEventAircraft NVARCHAR(MAX) AS JSON) loe
		CROSS APPLY OPENJSON(loe.LossEventAircraft) WITH (EquipmentTypeCode NVARCHAR(MAX), EquipmentTypeDesc NVARCHAR(MAX)) loa

		WHERE ISNULL(loa.EquipmentTypeCode, '') <> ''

	UNION ALL

		SELECT hdr.SourceSystemCode
			,loa.EquipmentTypeCode
			,ISNULL(loa.EquipmentTypeDesc, '') AS EquipmentTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (LossEventWatercraft NVARCHAR(MAX) AS JSON) loe
		CROSS APPLY OPENJSON(loe.LossEventWatercraft) WITH (EquipmentTypeCode NVARCHAR(MAX), EquipmentTypeDesc NVARCHAR(MAX)) loa

		WHERE ISNULL(loa.EquipmentTypeCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
