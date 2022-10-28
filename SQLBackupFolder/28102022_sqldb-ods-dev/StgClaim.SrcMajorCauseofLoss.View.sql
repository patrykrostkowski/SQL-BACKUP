USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcMajorCauseofLoss]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcMajorCauseofLoss]
AS

SELECT SourceSystemCode
	,MajorCauseofLossCode
	,MajorCauseofLossName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, MajorCauseofLossCode ORDER BY MajorCauseofLossName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,clm.MajorCauseofLossCode 
			,ISNULL(clm.MajorCauseofLossDesc, '') AS MajorCauseofLossName
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
