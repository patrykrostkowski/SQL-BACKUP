USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcClaimStatus]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcClaimStatus]
AS

SELECT SourceSystemCode
	,ClaimStatusCode
	,ClaimStatusName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, ClaimStatusCode ORDER BY ClaimStatusName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,clm.ClaimStatusCode
			,ISNULL(clm.ClaimStatusDesc, '') AS ClaimStatusName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (ClaimStatusCode NVARCHAR(MAX), ClaimStatusDesc NVARCHAR(MAX)) clm
		WHERE ISNULL(clm.ClaimStatusCode, '') <> ''
		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
