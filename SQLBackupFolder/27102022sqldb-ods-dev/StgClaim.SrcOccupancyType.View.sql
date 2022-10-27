USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcOccupancyType]    Script Date: 27.10.2022 12:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [StgClaim].[SrcOccupancyType]
AS

SELECT SourceSystemCode
	,OccupancyTypeCode
	,OccupancyTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, OccupancyTypeCode ORDER BY OccupancyTypeName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,lep.OccupancyTypeCode
			,ISNULL(lep.OccupancyTypeDesc, '') AS OccupancyTypeName
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
		CROSS APPLY OPENJSON(lev.LossEventProperty) WITH (OccupancyTypeDesc NVARCHAR(MAX), OccupancyTypeCode NVARCHAR(MAX)) lep
		WHERE ISNULL(lep.OccupancyTypeCode, '') <> ''
		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
