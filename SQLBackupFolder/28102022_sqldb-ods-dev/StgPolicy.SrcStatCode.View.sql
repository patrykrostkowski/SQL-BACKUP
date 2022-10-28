USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcStatCode]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [StgPolicy].[SrcStatCode]
AS
SELECT SourceSystemCode
	,StatCode
	,StatCodeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, StatCode ORDER BY StatCodeName DESC) AS rn
	FROM (


	   	SELECT hdr.SourceSystemCode
			,cov.StatCode
			,ISNULL(cov.StatCodeDesc, '') AS StatCodeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (Coverage NVARCHAR(MAX) AS JSON) lob
		CROSS APPLY OPENJSON(lob.Coverage) WITH (StatCode NVARCHAR(MAX), StatCodeDesc NVARCHAR(MAX)) cov
		WHERE ISNULL(cov.StatCode, '') <> ''

UNION ALL

	   	SELECT hdr.SourceSystemCode
			,rtp.StatCode
			,ISNULL(rtp.StatCodeDesc, '') AS StatCodeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (RatingPlan NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.RatingPlan) WITH (StatCode NVARCHAR(MAX), StatCodeDesc NVARCHAR(MAX)) rtp
		WHERE ISNULL(rtp.StatCode, '') <> ''

UNION ALL

	   	SELECT hdr.SourceSystemCode
			,cov.StatCode
			,ISNULL(cov.StatCodeDesc, '') AS StatCodeName
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
		CROSS APPLY OPENJSON(ino.Coverage) WITH (StatCode NVARCHAR(MAX), StatCodeDesc NVARCHAR(MAX)) cov
		WHERE ISNULL(cov.StatCode, '') <> ''

UNION ALL

	   	SELECT hdr.SourceSystemCode
			,cov.StatCode
			,ISNULL(cov.StatCodeDesc, '') AS StatCodeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (PolicyFee NVARCHAR(MAX) AS JSON) lob
		CROSS APPLY OPENJSON(lob.PolicyFee) WITH (StatCode NVARCHAR(MAX), StatCodeDesc NVARCHAR(MAX)) cov
		WHERE ISNULL(cov.StatCode, '') <> ''

UNION ALL

	   	SELECT hdr.SourceSystemCode
			,plf.StatCode
			,ISNULL(plf.StatCodeDesc, '') AS StatCodeName
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
		CROSS APPLY OPENJSON(cov.PolicyFee) WITH (StatCode NVARCHAR(MAX), StatCodeDesc NVARCHAR(MAX)) plf
		WHERE ISNULL(plf.StatCode, '') <> ''

UNION ALL

	   	SELECT hdr.SourceSystemCode
			,plf.StatCode
			,ISNULL(plf.StatCodeDesc, '') AS StatCodeName
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
		CROSS APPLY OPENJSON(cov.PolicyFee) WITH (StatCode NVARCHAR(MAX), StatCodeDesc NVARCHAR(MAX)) plf
		WHERE ISNULL(plf.StatCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1



GO
