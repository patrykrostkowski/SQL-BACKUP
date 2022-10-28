USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcLitigationStatus]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcLitigationStatus]
AS

SELECT SourceSystemCode
	,LitigationStatusCode
	,LitigationStatusName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, LitigationStatusCode ORDER BY LitigationStatusName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,clm.LitigationStatusCode 
			,ISNULL(clm.LitigationStatusDesc, '') AS LitigationStatusName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LitigationStatusCode NVARCHAR(MAX), LitigationStatusDesc NVARCHAR(MAX)) clm
		WHERE ISNULL(clm.LitigationStatusCode, '') <> ''

UNION ALL

		SELECT hdr.SourceSystemCode
			,lgt.LitigationStatusCode 
			,ISNULL(lgt.LitigationStatusDesc, '') AS LitigationStatusName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (Litigation NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.Litigation) WITH (LitigationStatusCode NVARCHAR(MAX), LitigationStatusDesc NVARCHAR(MAX)) lgt
		WHERE ISNULL(lgt.LitigationStatusCode, '') <> ''

UNION ALL

		SELECT hdr.SourceSystemCode
			,lgd.LitigationStatusCode 
			,ISNULL(lgd.LitigationStatusDesc, '') AS LitigationStatusName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (Litigation NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.Litigation) WITH (LitigationDetail NVARCHAR(MAX) AS JSON) lgt
		CROSS APPLY OPENJSON(lgt.LitigationDetail) WITH (LitigationStatusCode NVARCHAR(MAX), LitigationStatusDesc NVARCHAR(MAX)) lgd
		WHERE ISNULL(lgd.LitigationStatusCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
