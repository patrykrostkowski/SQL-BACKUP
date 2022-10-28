USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcCoverageTrigger]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create   VIEW [StgPolicy].[SrcCoverageTrigger]
AS
SELECT distinct SourceSystemCode
	,CoverageTriggerCode
	,CoverageTriggerName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, CoverageTriggerCode ORDER BY CoverageTriggerName DESC) AS rn
	FROM (
	    SELECT distinct pol.SourceSystemCode
			,pol.CoverageTriggerCode
			,ISNULL(pol.CoverageTriggerDesc, '') AS CoverageTriggerName
		FROM StgPolicy.SrcPolicy pol
		WHERE ISNULL(pol.CoverageTriggerCode, '') <> ''

		UNION ALL

		SELECT distinct plt.SourceSystemCode
			,plt.CoverageTriggerCode
			,ISNULL(plt.CoverageTriggerDesc, '') AS CoverageTriggerName
		FROM StgPolicy.SrcPolicyTrans plt
		WHERE ISNULL(plt.CoverageTriggerCode, '') <> ''

		UNION ALL

		SELECT distinct hdr.SourceSystemCode
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

		SELECT distinct hdr.SourceSystemCode
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
