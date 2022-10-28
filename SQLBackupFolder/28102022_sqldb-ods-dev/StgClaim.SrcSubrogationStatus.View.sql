USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcSubrogationStatus]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [StgClaim].[SrcSubrogationStatus]
AS

SELECT SourceSystemCode
	,SubrogationStatusCode
	,SubrogationStatusName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SubrogationStatusCode ORDER BY SubrogationStatusName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,clm.SubrogationStatusCode
			,ISNULL(clm.SubrogationStatusDesc, '') AS SubrogationStatusName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (SubrogationStatusCode NVARCHAR(MAX), SubrogationStatusDesc NVARCHAR(MAX)) clm
		WHERE ISNULL(clm.SubrogationStatusCode, '') <> ''

	UNION ALL

		SELECT hdr.SourceSystemCode
			,srg.SubrogationStatusCode
			,ISNULL(srg.SubrogationStatusDesc, '') AS SubrogationStatusName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (Subrogation NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.Subrogation) WITH (SubrogationStatusCode NVARCHAR(MAX), SubrogationStatusDesc NVARCHAR(MAX)) srg
		WHERE ISNULL(srg.SubrogationStatusCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
