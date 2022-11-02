USE [DataMagnifier]
GO
/****** Object:  View [StgPolicy].[SrcCoverageGroup]    Script Date: 02.11.2022 12:44:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [StgPolicy].[SrcCoverageGroup]
AS
SELECT SourceSystemCode
	,CoverageGroupCode
	,CoverageGroupName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, CoverageGroupCode ORDER BY CoverageGroupName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,cov.CoverageGroupCode
			,ISNULL(cov.CoverageGroupDesc, '') AS CoverageGroupName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol	
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (Coverage NVARCHAR(MAX) AS JSON) lob
		CROSS APPLY OPENJSON(lob.Coverage) WITH (CoverageGroupCode NVARCHAR(MAX), CoverageGroupDesc NVARCHAR(MAX)) cov
		WHERE ISNULL(cov.CoverageGroupCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,cov.CoverageGroupCode
			,ISNULL(cov.CoverageGroupDesc, '') AS CoverageGroupName
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
		CROSS APPLY OPENJSON(ino.Coverage) WITH (CoverageGroupCode NVARCHAR(MAX), CoverageGroupDesc NVARCHAR(MAX)) cov
		WHERE ISNULL(cov.CoverageGroupCode, '') <> ''

		) AS tmp
	) AS tpl
GO
