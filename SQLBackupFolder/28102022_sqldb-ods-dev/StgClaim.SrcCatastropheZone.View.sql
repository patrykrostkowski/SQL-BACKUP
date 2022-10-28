USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcCatastropheZone]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE    view [StgClaim].[SrcCatastropheZone]
as 
SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (
select hdr.SourceSystemCode
	,convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,czo.CatastropheZoneSourceCode AS SourceCode
	,cte.CatastropheSourceCode 
	,czo.CountryCode 
	,czo.ZoneTypeCode 
	,czo.ZoneTypeValue 
	,line.IsValidInd
	FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Claim NVARCHAR(max) AS JSON
		) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (
		Catastrophe NVARCHAR(max) AS JSON
		) clm
		CROSS APPLY OPENJSON(clm.Catastrophe) WITH (
		CatastropheSourceCode NVARCHAR(max)
		,CatastropheZone NVARCHAR(max) AS JSON
		) cte
		CROSS APPLY OPENJSON(cte.CatastropheZone) WITH (
		CatastropheZoneSourceCode NVARCHAR(max)
		,CountryCode NVARCHAR(max)
		,ZoneTypeCode NVARCHAR(max)
		,ZoneTypeValue NVARCHAR(max)
		) czo
	) AS tmp
		) AS tpl
	where tpl.rn = 1
GO
