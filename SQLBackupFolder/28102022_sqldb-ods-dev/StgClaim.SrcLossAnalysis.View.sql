USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcLossAnalysis]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [StgClaim].[SrcLossAnalysis]
AS

SELECT SourceSystemCode
	,LossAnalysisCode
	,LossAnalysisName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, LossAnalysisCode ORDER BY LossAnalysisName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,clm.LossAnalysisCode 
			,ISNULL(clm.LossAnalysisDesc, '') AS LossAnalysisName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossAnalysisCode NVARCHAR(MAX), LossAnalysisDesc NVARCHAR(MAX)) clm
		WHERE ISNULL(clm.LossAnalysisCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
