USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcAnnualStatementLineofBusiness]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [StgPolicy].[SrcAnnualStatementLineofBusiness]
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
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol	
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (Coverage NVARCHAR(MAX) AS JSON) lob
		CROSS APPLY OPENJSON(lob.Coverage) WITH (AnnualStatementLineofBusinessCode NVARCHAR(MAX), AnnualStatementLineofBusinessDesc NVARCHAR(MAX)) cov
		WHERE ISNULL(cov.AnnualStatementLineofBusinessCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,cov.AnnualStatementLineofBusinessCode
			,ISNULL(cov.AnnualStatementLineofBusinessDesc, '') AS AnnualStatementLineofBusinessName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol	
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (Geography NVARCHAR(MAX) AS JSON) lob
		CROSS APPLY OPENJSON(lob.Geography) WITH (InsurableObject NVARCHAR(MAX) AS JSON) grg
		CROSS APPLY OPENJSON(grg.InsurableObject) WITH (Coverage NVARCHAR(MAX) AS JSON) ino
		CROSS APPLY OPENJSON(ino.Coverage) WITH (AnnualStatementLineofBusinessCode NVARCHAR(MAX), AnnualStatementLineofBusinessDesc NVARCHAR(MAX)) cov
		WHERE ISNULL(cov.AnnualStatementLineofBusinessCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,pol.AnnualStatementLineofBusinessCode
			,ISNULL(pol.AnnualStatementLineofBusinessDesc, '') AS AnnualStatementLineofBusinessName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (AnnualStatementLineofBusinessCode NVARCHAR(MAX), AnnualStatementLineofBusinessDesc NVARCHAR(MAX), PolicyTrans NVARCHAR(MAX) AS JSON) pol	
		WHERE ISNULL(pol.AnnualStatementLineofBusinessCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
