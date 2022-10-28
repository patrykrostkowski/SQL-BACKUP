USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcArea]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcArea]
AS
SELECT SourceSystemCode
	,AreaCode
	,AreaName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, AreaCode ORDER BY AreaName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,lgt.AreaCode
			,ISNULL(lgt.AreaDesc, '') AS AreaName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (
			Litigation NVARCHAR(MAX) AS JSON
			) clm	
		CROSS APPLY OPENJSON(clm.Litigation) WITH (AreaCode NVARCHAR(MAX), AreaDesc NVARCHAR(MAX)) lgt
		WHERE ISNULL(lgt.AreaCode, '') <> ''

UNION ALL

		SELECT hdr.SourceSystemCode
			,clm.AreaofPracticeCode AS AreaCode 
			,ISNULL(clm.AreaofPracticeDesc, '') AS AreaName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (
			AreaofPracticeDesc NVARCHAR(MAX) 
			,AreaofPracticeCode NVARCHAR(MAX) 
			) clm	
		WHERE ISNULL(clm.AreaofPracticeCode, '') <> ''

	) AS tmp
) AS tpl
where tpl.rn = 1
GO
