USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcLossCause]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcLossCause]
AS

SELECT SourceSystemCode
	,LossCauseCode
	,LossCauseName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, LossCauseCode ORDER BY LossCauseName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,ctd.LossCauseCode 
			,ISNULL(ctd.LossCauseDesc, '') AS LossCauseName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (Catastrophe NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.Catastrophe) WITH (CatastropheDetail NVARCHAR(MAX) AS JSON) cts
		CROSS APPLY OPENJSON(cts.CatastropheDetail) WITH (LossCauseCode NVARCHAR(MAX), LossCauseDesc NVARCHAR(MAX)) ctd
		WHERE ISNULL(ctd.LossCauseCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
