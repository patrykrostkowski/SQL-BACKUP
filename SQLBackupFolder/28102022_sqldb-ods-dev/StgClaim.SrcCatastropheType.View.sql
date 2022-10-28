USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcCatastropheType]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcCatastropheType]
AS

SELECT SourceSystemCode
	,CatastropheTypeCode
	,CatastropheTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, CatastropheTypeCode ORDER BY CatastropheTypeName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,cts.CatastropheTypeCode
			,ISNULL(cts.CatastropheTypeDesc, '') AS CatastropheTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (Catastrophe NVARCHAR(MAX) AS JSON) clm	
		CROSS APPLY OPENJSON(clm.Catastrophe) WITH (CatastropheTypeCode NVARCHAR(MAX), CatastropheTypeDesc NVARCHAR(MAX)) cts
		WHERE ISNULL(cts.CatastropheTypeCode, '') <> ''
		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
