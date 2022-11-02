USE [DataMagnifier]
GO
/****** Object:  View [StgPolicy].[SrcCoverage]    Script Date: 02.11.2022 12:45:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [StgPolicy].[SrcCoverage]
AS
SELECT SourceSystemCode
	,CoverageCode
	,CoverageName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, CoverageCode ORDER BY CoverageName DESC) AS rn
	FROM (
	   	SELECT hdr.SourceSystemCode
			,cov.CoverageCode
			,ISNULL(cov.CoverageDesc, '') AS CoverageName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol	
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (Coverage NVARCHAR(MAX) AS JSON) lob
		CROSS APPLY OPENJSON(lob.Coverage) WITH (CoverageCode NVARCHAR(MAX), CoverageDesc NVARCHAR(MAX)) cov
		WHERE ISNULL(cov.CoverageCode, '') <> ''

		UNION ALL 

		SELECT hdr.SourceSystemCode
			,cov.CoverageCode
			,ISNULL(cov.CoverageDesc, '') AS CoverageName
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
		CROSS APPLY OPENJSON(ino.Coverage) WITH (CoverageCode NVARCHAR(MAX), CoverageDesc NVARCHAR(MAX)) cov
		WHERE ISNULL(cov.CoverageCode, '') <> ''

		) AS tmp
	) AS tpl
GO
