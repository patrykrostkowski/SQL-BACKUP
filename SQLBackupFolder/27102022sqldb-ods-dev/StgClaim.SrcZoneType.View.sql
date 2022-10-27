USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcZoneType]    Script Date: 27.10.2022 12:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcZoneType]
AS

SELECT SourceSystemCode
	,ZoneTypeCode
	,ZoneTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, ZoneTypeCode ORDER BY ZoneTypeName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,ctz.ZoneTypeCode
			,ISNULL(ctz.ZoneTypeDesc, '') AS ZoneTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (Catastrophe NVARCHAR(MAX) AS JSON) clm	
		CROSS APPLY OPENJSON(clm.Catastrophe) WITH (CatastropheZone NVARCHAR(MAX) AS JSON) cts
		CROSS APPLY OPENJSON(cts.CatastropheZone) WITH (ZoneTypeCode NVARCHAR(MAX), ZoneTypeDesc NVARCHAR(MAX)) ctz
		WHERE ISNULL(ctz.ZoneTypeCode, '') <> ''
		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
