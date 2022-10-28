USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcSprinklerType]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [StgClaim].[SrcSprinklerType]
AS

SELECT SourceSystemCode
	,SprinklerTypeCode
	,SprinklerTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SprinklerTypeCode ORDER BY SprinklerTypeName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,lep.SprinklerTypeCode
			,ISNULL(lep.SprinklerTypeDesc, '') AS SprinklerTypeName
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
		CROSS APPLY OPENJSON(lev.LossEventProperty) WITH (SprinklerTypeDesc NVARCHAR(MAX), SprinklerTypeCode NVARCHAR(MAX)) lep
		WHERE ISNULL(lep.SprinklerTypeCode, '') <> ''
		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
