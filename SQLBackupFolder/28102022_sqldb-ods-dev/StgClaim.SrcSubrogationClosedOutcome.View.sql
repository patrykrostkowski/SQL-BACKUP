USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcSubrogationClosedOutcome]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE    VIEW [StgClaim].[SrcSubrogationClosedOutcome]
AS

SELECT SourceSystemCode
	,SubrogationClosedOutcomeCode
	,SubrogationClosedOutcomeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SubrogationClosedOutcomeCode ORDER BY SubrogationClosedOutcomeName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,srg.SubrogationClosedOutcomeCode
			,ISNULL(srg.SubrogationClosedOutcomeDesc, '') AS SubrogationClosedOutcomeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (Subrogation NVARCHAR(MAX) AS JSON) clm	
		CROSS APPLY OPENJSON(clm.Subrogation) WITH (SubrogationClosedOutcomeCode NVARCHAR(MAX), SubrogationClosedOutcomeDesc NVARCHAR(MAX)) srg
		WHERE ISNULL(srg.SubrogationClosedOutcomeCode, '') <> ''
		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
