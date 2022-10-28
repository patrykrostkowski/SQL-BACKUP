USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcLimitDeductibleType]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [StgPolicy].[SrcLimitDeductibleType]
AS
SELECT SourceSystemCode
	,LimitTypeCode as LimitDeductibleTypeCode
	,LimitTypeName as LimitDeductibleTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, LimitTypeCode ORDER BY LimitTypeName DESC) AS rn
	FROM (
	   	SELECT hdr.SourceSystemCode
			,pll.LimitTypeCode
			,ISNULL(pll.LimitTypeDesc, '') AS LimitTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol	
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (PolicyLimit NVARCHAR(MAX) AS JSON) lob
		CROSS APPLY OPENJSON(lob.PolicyLimit) WITH (LimitTypeCode NVARCHAR(MAX), LimitTypeDesc NVARCHAR(MAX)) pll
		WHERE ISNULL(pll.LimitTypeCode, '') <> ''

	UNION ALL

		SELECT hdr.SourceSystemCode
			,pll.LimitTypeCode
			,ISNULL(pll.LimitTypeDesc, '') AS LimitTypeName
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
		CROSS APPLY OPENJSON(ino.Coverage) WITH (PolicyLimit NVARCHAR(MAX) AS JSON) cov
		CROSS APPLY OPENJSON(cov.PolicyLimit) WITH (LimitTypeCode NVARCHAR(MAX), LimitTypeDesc NVARCHAR(MAX)) pll
		WHERE ISNULL(pll.LimitTypeCode, '') <> ''

	UNION ALL

		SELECT hdr.SourceSystemCode
			,pll.LimitTypeCode
			,ISNULL(pll.LimitTypeDesc, '') AS LimitTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol	
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (Coverage NVARCHAR(MAX) AS JSON) lob
		CROSS APPLY OPENJSON(lob.Coverage) WITH (PolicyLimit NVARCHAR(MAX) AS JSON) cov
		CROSS APPLY OPENJSON(cov.PolicyLimit) WITH (LimitTypeCode NVARCHAR(MAX), LimitTypeDesc NVARCHAR(MAX)) pll
		WHERE ISNULL(pll.LimitTypeCode, '') <> ''

	UNION ALL
	
		   	SELECT hdr.SourceSystemCode
			,pll.DeductibleTypeCode AS LimitTypeCode
			,ISNULL(pll.DeductibleTypeDesc, '') AS LimitTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol	
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (PolicyDeductible NVARCHAR(MAX) AS JSON) lob
		CROSS APPLY OPENJSON(lob.PolicyDeductible) WITH (DeductibleTypeCode NVARCHAR(MAX), DeductibleTypeDesc NVARCHAR(MAX)) pll
		WHERE ISNULL(pll.DeductibleTypeCode, '') <> ''

	UNION ALL

		SELECT hdr.SourceSystemCode
			,pll.DeductibleTypeCode AS LimitTypeCode
			,ISNULL(pll.DeductibleTypeDesc, '') AS LimitTypeName
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
		CROSS APPLY OPENJSON(ino.Coverage) WITH (PolicyDeductible NVARCHAR(MAX) AS JSON) cov
		CROSS APPLY OPENJSON(cov.PolicyDeductible) WITH (DeductibleTypeCode NVARCHAR(MAX), DeductibleTypeDesc NVARCHAR(MAX)) pll
		WHERE ISNULL(pll.DeductibleTypeCode, '') <> ''

	UNION ALL

		SELECT hdr.SourceSystemCode
			,pll.DeductibleTypeCode AS LimitTypeCode
			,ISNULL(pll.DeductibleTypeDesc, '') AS LimitTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol	
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (Coverage NVARCHAR(MAX) AS JSON) lob
		CROSS APPLY OPENJSON(lob.Coverage) WITH (PolicyDeductible NVARCHAR(MAX) AS JSON) cov
		CROSS APPLY OPENJSON(cov.PolicyDeductible) WITH (DeductibleTypeCode NVARCHAR(MAX), DeductibleTypeDesc NVARCHAR(MAX)) pll
		WHERE ISNULL(pll.DeductibleTypeCode, '') <> ''

		) AS tmp
	) AS tpl
where tpl.rn = 1


GO
