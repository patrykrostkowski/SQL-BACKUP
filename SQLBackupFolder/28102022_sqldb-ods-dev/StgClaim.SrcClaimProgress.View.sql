USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcClaimProgress]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcClaimProgress]
AS

SELECT SourceSystemCode
	,ClaimProgressCode
	,ClaimProgressName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, ClaimProgressCode ORDER BY ClaimProgressName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,clm.ClaimProgressCode
			,ISNULL(clm.ClaimProgressDesc, '') AS ClaimProgressName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (ClaimProgressCode NVARCHAR(MAX), ClaimProgressDesc NVARCHAR(MAX)) clm
		WHERE ISNULL(clm.ClaimProgressCode, '') <> ''
		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
