USE [DataMagnifier]
GO
/****** Object:  View [StgPolicy].[SrcCoverageClass]    Script Date: 10.11.2022 14:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[StgPolicy].[SrcCoverageClass]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [StgPolicy].[SrcCoverageClass]
AS
SELECT SourceSystemCode
	,CoverageClassCode
	,CoverageClassName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, CoverageClassCode ORDER BY CoverageClassName DESC) AS rn
	FROM (
	   	SELECT hdr.SourceSystemCode
			,cov.CoverageClassCode
			,ISNULL(cov.CoverageClassDesc, '''') AS CoverageClassName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol	
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (Coverage NVARCHAR(MAX) AS JSON) lob
		CROSS APPLY OPENJSON(lob.Coverage) WITH (CoverageClassCode NVARCHAR(MAX), CoverageClassDesc NVARCHAR(MAX)) cov
		WHERE ISNULL(cov.CoverageClassCode, '''') <> ''''

		UNION ALL 

		SELECT hdr.SourceSystemCode
			,cov.CoverageClassCode
			,ISNULL(cov.CoverageClassDesc, '''') AS CoverageClassName
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
		CROSS APPLY OPENJSON(ino.Coverage) WITH (CoverageClassCode NVARCHAR(MAX), CoverageClassDesc NVARCHAR(MAX)) cov
		WHERE ISNULL(cov.CoverageClassCode, '''') <> ''''

		) AS tmp
	) AS tpl
' 
GO
