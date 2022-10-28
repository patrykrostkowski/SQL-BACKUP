USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcReason]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [StgClaim].[SrcReason]
AS

SELECT SourceSystemCode
	,ReasonCode
	,ReasonName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, ReasonCode ORDER BY ReasonName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,clm.ReopenReasonCode AS ReasonCode
			,ISNULL(clm.ReopenReasonDesc, '') AS ReasonName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (ReopenReasonCode NVARCHAR(MAX), ReopenReasonDesc NVARCHAR(MAX)) clm
		WHERE ISNULL(clm.ReopenReasonCode, '') <> ''

	UNION ALL

		SELECT hdr.SourceSystemCode
			,loc.OtherReasonCode AS ReasonCode
			,ISNULL(loc.OtherReasonDesc, '') AS ReasonName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (LossOccurrence NVARCHAR(MAX) AS JSON) lev
		CROSS APPLY OPENJSON(lev.LossOccurrence) WITH (OtherReasonCode NVARCHAR(MAX), OtherReasonDesc NVARCHAR(MAX)) loc
		WHERE ISNULL(loc.OtherReasonCode, '') <> ''

	UNION ALL

		SELECT hdr.SourceSystemCode
			,loc.ReopenReasonCode AS ReasonCode
			,ISNULL(loc.ReopenReasonDesc, '') AS ReasonName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (LossOccurrence NVARCHAR(MAX) AS JSON) lev
		CROSS APPLY OPENJSON(lev.LossOccurrence) WITH (ReopenReasonCode NVARCHAR(MAX), ReopenReasonDesc NVARCHAR(MAX)) loc
		WHERE ISNULL(loc.ReopenReasonCode, '') <> ''

	UNION ALL

		SELECT hdr.SourceSystemCode
			,clm.FlaggedReasonCode AS ReasonCode
			,ISNULL(clm.FlaggedReasonDesc, '') AS ReasonName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (FlaggedReasonCode NVARCHAR(MAX), FlaggedReasonDesc NVARCHAR(MAX)) clm
		WHERE ISNULL(clm.FlaggedReasonCode, '') <> ''

	UNION ALL

		SELECT hdr.SourceSystemCode
			,clm.OpenReasonCode AS ReasonCode
			,ISNULL(clm.OpenReasonDesc, '') AS ReasonName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (OpenReasonCode NVARCHAR(MAX), OpenReasonDesc NVARCHAR(MAX)) clm
		WHERE ISNULL(clm.OpenReasonCode, '') <> ''

	UNION ALL

		SELECT hdr.SourceSystemCode
			,clt.ReasonCode
			,ISNULL(clt.ReasonDesc, '') AS ReasonName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (Claimant NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.Claimant) WITH (ReasonCode NVARCHAR(MAX), ReasonDesc NVARCHAR(MAX)) clt
		WHERE ISNULL(clt.ReasonCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
