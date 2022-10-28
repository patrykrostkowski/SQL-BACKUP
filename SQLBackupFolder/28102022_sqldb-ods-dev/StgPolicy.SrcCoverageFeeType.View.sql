USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcCoverageFeeType]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [StgPolicy].[SrcCoverageFeeType]
AS
SELECT SourceSystemCode
	,CoverageFeeTypeCode
	,CoverageFeeTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, CoverageFeeTypeCode ORDER BY CoverageFeeTypeName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,plf.CoverageFeeTypeCode
			,ISNULL(plf.CoverageFeeTypeDesc, '') AS CoverageFeeTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol	
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (Coverage NVARCHAR(MAX) AS JSON) lob
		CROSS APPLY OPENJSON(lob.Coverage) WITH (PolicyFee NVARCHAR(MAX) AS JSON) cov
		CROSS APPLY OPENJSON(cov.PolicyFee) WITH (CoverageFeeTypeCode NVARCHAR(MAX), CoverageFeeTypeDesc NVARCHAR(MAX)) plf
		WHERE ISNULL(plf.CoverageFeeTypeCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,plf.CoverageFeeTypeCode
			,ISNULL(plf.CoverageFeeTypeDesc, '') AS CoverageFeeTypeName
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
		CROSS APPLY OPENJSON(ino.Coverage) WITH (PolicyFee NVARCHAR(MAX) AS JSON) cov
		CROSS APPLY OPENJSON(cov.PolicyFee) WITH (CoverageFeeTypeCode NVARCHAR(MAX), CoverageFeeTypeDesc NVARCHAR(MAX)) plf
		WHERE ISNULL(plf.CoverageFeeTypeCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,plf.CoverageFeeTypeCode
			,ISNULL(plf.CoverageFeeTypeDesc, '') AS CoverageFeeTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol	
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (PolicyFee NVARCHAR(MAX) AS JSON) lob
		CROSS APPLY OPENJSON(lob.PolicyFee) WITH (CoverageFeeTypeCode NVARCHAR(MAX), CoverageFeeTypeDesc NVARCHAR(MAX)) plf
		WHERE ISNULL(plf.CoverageFeeTypeCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
