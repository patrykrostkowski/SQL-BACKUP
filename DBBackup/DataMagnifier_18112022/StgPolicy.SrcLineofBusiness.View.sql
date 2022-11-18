USE [DataMagnifier]
GO
/****** Object:  View [StgPolicy].[SrcLineofBusiness]    Script Date: 18.11.2022 16:48:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [StgPolicy].[SrcLineofBusiness]
AS
SELECT SourceSystemCode
	,LineofBusinessCode
	,LineofBusinessName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, LineofBusinessCode ORDER BY LineofBusinessName DESC) AS rn
	FROM (		
		SELECT hdr.SourceSystemCode
			,cvg.AnnualStatementLineofBusinessCode AS LineofBusinessCode
			,ISNULL(cvg.AnnualStatementLineofBusinessDesc, '') AS LineofBusinessName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (Coverage NVARCHAR(MAX) AS JSON ) lob
		CROSS APPLY OPENJSON(lob.Coverage) WITH (AnnualStatementLineofBusinessCode NVARCHAR(MAX), AnnualStatementLineofBusinessDesc NVARCHAR(MAX)) cvg
		WHERE ISNULL(cvg.AnnualStatementLineofBusinessCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,cvg.AnnualStatementLineofBusinessCode AS LineofBusinessCode
			,ISNULL(cvg.AnnualStatementLineofBusinessDesc, '') AS LineofBusinessName
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
		CROSS APPLY OPENJSON(ino.Coverage) WITH (AnnualStatementLineofBusinessCode NVARCHAR(MAX), AnnualStatementLineofBusinessDesc NVARCHAR(MAX)) cvg
		WHERE ISNULL(cvg.AnnualStatementLineofBusinessCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,lob.LineOfBusinessCode
			,ISNULL(lob.LineOfBusinessDesc, '') AS LineofBusinessName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (LineOfBusinessCode NVARCHAR(MAX), LineOfBusinessDesc NVARCHAR(MAX)) lob
		WHERE ISNULL(lob.LineOfBusinessCode, '') <> ''

		) AS tmp
	) AS tpl
GO
