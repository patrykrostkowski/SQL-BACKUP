USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcRoofMaterialType]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [StgClaim].[SrcRoofMaterialType]
AS

SELECT SourceSystemCode
	,RoofMaterialTypeCode
	,RoofMaterialTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, RoofMaterialTypeCode ORDER BY RoofMaterialTypeName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,lep.RoofMaterialTypeCode
			,ISNULL(lep.RoofMaterialTypeDesc, '') AS RoofMaterialTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH 
				(
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (LossEventProperty NVARCHAR(MAX) AS JSON) lev
		CROSS APPLY OPENJSON(lev.LossEventProperty) WITH (RoofMaterialTypeDesc NVARCHAR(MAX), RoofMaterialTypeCode NVARCHAR(MAX)) lep
		WHERE ISNULL(lep.RoofMaterialTypeCode, '') <> ''
		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
