USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcAreaofPractice]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [StgClaim].[SrcAreaofPractice]
AS
SELECT SourceSystemCode
	,AreaofPracticeCode
	,AreaofPracticeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, AreaofPracticeCode ORDER BY AreaofPracticeName DESC) AS rn
	FROM (
	   	SELECT hdr.SourceSystemCode
			,clm.AreaofPracticeCode
			,ISNULL(clm.AreaofPracticeDesc, '') AS AreaofPracticeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (
			ClaimPolicy NVARCHAR(MAX)
			,AreaofPracticeCode NVARCHAR(MAX)
			,AreaofPracticeDesc NVARCHAR(MAX)
		) clm			
		WHERE ISNULL(clm.AreaofPracticeCode, '') <> ''


		) AS tmp
	) AS tpl
	where tpl.rn = 1




GO
