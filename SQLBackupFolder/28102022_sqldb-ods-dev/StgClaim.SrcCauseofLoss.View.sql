USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcCauseofLoss]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcCauseofLoss]
AS

SELECT SourceSystemCode
	,CauseofLossCode
	,CauseofLossName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, CauseofLossCode ORDER BY CauseofLossName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,clm.CauseofLossCode
			,ISNULL(clm.CauseofLossDesc, '') AS CauseofLossName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (CauseofLossCode NVARCHAR(MAX), CauseofLossDesc NVARCHAR(MAX)) clm
		WHERE ISNULL(clm.CauseofLossCode, '') <> ''

	UNION ALL

		SELECT hdr.SourceSystemCode
			,clm.AllegedCauseOfLossCode
			,ISNULL(clm.AllegedCauseOfLossCodeDesc, '') AS CauseofLossName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (AllegedCauseOfLossCode NVARCHAR(MAX), AllegedCauseOfLossCodeDesc NVARCHAR(MAX)) clm
		WHERE ISNULL(clm.AllegedCauseOfLossCode, '') <> ''

	UNION ALL

		SELECT hdr.SourceSystemCode
			,clm.MajorCauseofLossCode
			,ISNULL(clm.MajorCauseofLossDesc, '') AS CauseofLossName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (MajorCauseofLossCode NVARCHAR(MAX), MajorCauseofLossDesc NVARCHAR(MAX)) clm
		WHERE ISNULL(clm.MajorCauseofLossCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1


GO
