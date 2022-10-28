USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcResolution]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [StgClaim].[SrcResolution]
AS

SELECT SourceSystemCode
	,ResolutionCode
	,ResolutionName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, ResolutionCode ORDER BY ResolutionName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,lgt.ResolutionCode 
			,ISNULL(lgt.ResolutionDesc, '') AS ResolutionName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (Litigation NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.Litigation) WITH (ResolutionCode NVARCHAR(MAX), ResolutionDesc NVARCHAR(MAX)) lgt
		WHERE ISNULL(lgt.ResolutionCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
