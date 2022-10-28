USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcClaimantOutcome]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcClaimantOutcome]
AS

SELECT SourceSystemCode
	,ClaimantOutcomeCode
	,ClaimantOutcomeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, ClaimantOutcomeCode ORDER BY ClaimantOutcomeName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,clm.ClaimantOutcomeCode
			,ISNULL(clm.ClaimantOutcomeDesc, '') AS ClaimantOutcomeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (ClaimantOutcomeCode NVARCHAR(MAX), ClaimantOutcomeDesc NVARCHAR(MAX)) clm
		WHERE ISNULL(clm.ClaimantOutcomeCode, '') <> ''
		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
