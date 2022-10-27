USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcSeverity]    Script Date: 27.10.2022 12:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE    VIEW [StgClaim].[SrcSeverity]
AS

SELECT SourceSystemCode
	,SeverityCode
	,SeverityName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SeverityCode ORDER BY SeverityName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,clm.InjurySeverityCode AS SeverityCode 
			,ISNULL(clm.InjurySeverityDesc, '') AS SeverityName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (InjurySeverityCode NVARCHAR(MAX), InjurySeverityDesc NVARCHAR(MAX)) clm
		WHERE ISNULL(clm.InjurySeverityCode, '') <> ''

	UNION ALL

		SELECT hdr.SourceSystemCode
			,lev.SeverityCode 
			,ISNULL(lev.SeverityDesc, '') AS SeverityName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (SeverityCode NVARCHAR(MAX), SeverityDesc NVARCHAR(MAX)) lev
		WHERE ISNULL(lev.SeverityCode, '') <> ''

	UNION ALL

		SELECT hdr.SourceSystemCode
			,clt.OSHASeverityCode AS SeverityCode 
			,ISNULL(clt.OSHASeverityDesc, '') AS SeverityName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (Claimant NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.Claimant) WITH (OSHASeverityCode NVARCHAR(MAX), OSHASeverityDesc NVARCHAR(MAX)) clt
		WHERE ISNULL(clt.OSHASeverityCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
