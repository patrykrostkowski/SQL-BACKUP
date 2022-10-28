USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcEquipmentClass]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcEquipmentClass]
AS

SELECT SourceSystemCode
	,EquipmentClassCode
	,EquipmentClassName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, EquipmentClassCode ORDER BY EquipmentClassName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,loa.EquipmentClassCode
			,ISNULL(loa.EquipmentClassDesc, '') AS EquipmentClassName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (LossEventAircraft NVARCHAR(MAX) AS JSON) loe
		CROSS APPLY OPENJSON(loe.LossEventAircraft) WITH (EquipmentClassCode NVARCHAR(MAX), EquipmentClassDesc NVARCHAR(MAX)) loa

		WHERE ISNULL(loa.EquipmentClassCode, '') <> ''

	UNION ALL

		SELECT hdr.SourceSystemCode
			,loa.EquipmentClassCode
			,ISNULL(loa.EquipmentClassDesc, '') AS EquipmentClassName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (LossEventWatercraft NVARCHAR(MAX) AS JSON) loe
		CROSS APPLY OPENJSON(loe.LossEventWatercraft) WITH (EquipmentClassCode NVARCHAR(MAX), EquipmentClassDesc NVARCHAR(MAX)) loa

		WHERE ISNULL(loa.EquipmentClassCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
