USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcAnnualStatementLineofBusiness]    Script Date: 27.10.2022 12:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [StgClaim].[SrcAnnualStatementLineofBusiness]
AS
SELECT SourceSystemCode
	,AnnualStatementLineofBusinessCode
	,AnnualStatementLineofBusinessName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, AnnualStatementLineofBusinessCode ORDER BY AnnualStatementLineofBusinessName DESC) AS rn
	FROM (
	   	SELECT hdr.SourceSystemCode
			,cov.AnnualStatementLineofBusinessCode
			,ISNULL(cov.AnnualStatementLineofBusinessDesc, '') AS AnnualStatementLineofBusinessName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (ClaimPolicy NVARCHAR(MAX) AS JSON) clm	
		CROSS APPLY OPENJSON(clm.ClaimPolicy) WITH (ClaimCoverage NVARCHAR(MAX) AS JSON) clp
		CROSS APPLY OPENJSON(clp.ClaimCoverage) WITH (AnnualStatementLineofBusinessCode NVARCHAR(MAX), AnnualStatementLineofBusinessDesc NVARCHAR(MAX)) cov
		WHERE ISNULL(cov.AnnualStatementLineofBusinessCode, '') <> ''


		) AS tmp
	) AS tpl
	where tpl.rn = 1




GO
