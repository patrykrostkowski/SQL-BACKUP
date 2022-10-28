USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcClosedOutcome]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE   VIEW [StgClaim].[SrcClosedOutcome]
AS

SELECT SourceSystemCode
	,ClosedOutcomeCode
	,ClosedOutcomeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, ClosedOutcomeCode ORDER BY ClosedOutcomeName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,clm.ClosedOutcomeCode
			,ISNULL(clm.ClosedOutcomeDesc, '') AS ClosedOutcomeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (ClosedOutcomeCode NVARCHAR(MAX), ClosedOutcomeDesc NVARCHAR(MAX)) clm
		WHERE ISNULL(clm.ClosedOutcomeCode, '') <> ''

UNION ALL

		SELECT hdr.SourceSystemCode
			,srg.SubrogationClosedOutcomeCode AS ClosedOutcomeCode
			,ISNULL(srg.SubrogationClosedOutcomeDesc, '') AS ClosedOutcomeName
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

UNION ALL

		SELECT hdr.SourceSystemCode
			,loc.ClosedOutcomeCode AS ClosedOutcomeCode
			,ISNULL(loc.ClosedOutcomeDesc, '') AS ClosedOutcomeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (LossOccurrence NVARCHAR(MAX) AS JSON) lev
		CROSS APPLY OPENJSON(lev.LossOccurrence) WITH (ClosedOutcomeCode NVARCHAR(MAX), ClosedOutcomeDesc NVARCHAR(MAX)) loc
		WHERE ISNULL(loc.ClosedOutcomeCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
