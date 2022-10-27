USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcLossOccurrenceTier]    Script Date: 27.10.2022 12:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcLossOccurrenceTier]
AS

SELECT SourceSystemCode
	,LossOccurrenceTierCode
	,LossOccurrenceTierName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, LossOccurrenceTierCode ORDER BY LossOccurrenceTierName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,loc.LossOccurrenceTierCode 
			,ISNULL(loc.LossOccurrenceTierDesc, '') AS LossOccurrenceTierName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (LossOccurrence NVARCHAR(MAX) AS JSON) lev
		CROSS APPLY OPENJSON(lev.LossOccurrence) WITH (LossOccurrenceTierCode NVARCHAR(MAX), LossOccurrenceTierDesc NVARCHAR(MAX)) loc
		WHERE ISNULL(loc.LossOccurrenceTierCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
