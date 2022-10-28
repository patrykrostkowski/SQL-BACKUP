USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcAuthorizationStatus]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE    VIEW [StgClaim].[SrcAuthorizationStatus]
AS

SELECT SourceSystemCode
	,AuthorizationStatusCode
	,AuthorizationStatusName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, AuthorizationStatusCode ORDER BY AuthorizationStatusName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,clt.AuthorizationStatusCode
			,ISNULL(clt.AuthorizationStatusDesc, '') AS AuthorizationStatusName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (ClaimTransaction NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.ClaimTransaction) WITH (AuthorizationStatusCode NVARCHAR(MAX), AuthorizationStatusDesc NVARCHAR(MAX)) clt

		WHERE ISNULL(clt.AuthorizationStatusCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
