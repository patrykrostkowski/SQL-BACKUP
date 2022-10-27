USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcClaimTier]    Script Date: 27.10.2022 12:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcClaimTier]
AS

SELECT SourceSystemCode
	,ClaimTierCode
	,ClaimTierName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, ClaimTierCode ORDER BY ClaimTierName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,clm.ClaimTierCode
			,ISNULL(clm.ClaimTierDesc, '') AS ClaimTierName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (ClaimTierCode NVARCHAR(MAX), ClaimTierDesc NVARCHAR(MAX)) clm
		WHERE ISNULL(clm.ClaimTierCode, '') <> ''
		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
