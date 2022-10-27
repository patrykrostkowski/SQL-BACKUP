USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcCoverageTrigger]    Script Date: 27.10.2022 12:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [StgPolicy].[SrcCoverageTrigger]
AS
SELECT SourceSystemCode
	,CoverageTriggerCode
	,CoverageTriggerName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, CoverageTriggerCode ORDER BY CoverageTriggerName DESC) AS rn
	FROM (
	    SELECT hdr.SourceSystemCode
			,pol.CoverageTriggerCode
			,ISNULL(pol.CoverageTriggerDesc, '') AS CoverageTriggerName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (CoverageTriggerCode NVARCHAR(MAX), CoverageTriggerDesc NVARCHAR(MAX)) pol
		WHERE ISNULL(pol.CoverageTriggerCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,plt.CoverageTriggerCode
			,ISNULL(plt.CoverageTriggerDesc, '') AS CoverageTriggerName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (CoverageTriggerCode NVARCHAR(MAX), CoverageTriggerDesc NVARCHAR(MAX)) plt
		WHERE ISNULL(plt.CoverageTriggerCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,cvg.CoverageTriggerCode
			,ISNULL(cvg.CoverageTriggerDesc, '') AS CoverageTriggerName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (Coverage NVARCHAR(MAX) AS JSON) lob
		CROSS APPLY OPENJSON(lob.Coverage) WITH (CoverageTriggerCode NVARCHAR(MAX), CoverageTriggerDesc NVARCHAR(MAX)) cvg
		WHERE ISNULL(cvg.CoverageTriggerCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,cvg.CoverageTriggerCode
			,ISNULL(cvg.CoverageTriggerDesc, '') AS CoverageTriggerName
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
		CROSS APPLY OPENJSON(ino.Coverage) WITH (CoverageTriggerCode NVARCHAR(MAX), CoverageTriggerDesc NVARCHAR(MAX)) cvg
		WHERE ISNULL(cvg.CoverageTriggerCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
