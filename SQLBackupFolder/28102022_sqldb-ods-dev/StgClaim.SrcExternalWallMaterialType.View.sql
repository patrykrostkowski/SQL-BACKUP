USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcExternalWallMaterialType]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [StgClaim].[SrcExternalWallMaterialType]
AS

SELECT SourceSystemCode
	,ExternalWallMaterialTypeCode
	,ExternalWallMaterialTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, ExternalWallMaterialTypeCode ORDER BY ExternalWallMaterialTypeName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,lep.ExternalWallMaterialTypeCode
			,ISNULL(lep.ExternalWallMaterialTypeDesc, '') AS ExternalWallMaterialTypeName
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
		CROSS APPLY OPENJSON(lev.LossEventProperty) WITH (ExternalWallMaterialTypeDesc NVARCHAR(MAX), ExternalWallMaterialTypeCode NVARCHAR(MAX)) lep
		WHERE ISNULL(lep.ExternalWallMaterialTypeCode, '') <> ''
		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
