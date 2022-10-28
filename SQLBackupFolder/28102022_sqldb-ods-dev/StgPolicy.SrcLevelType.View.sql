USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcLevelType]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [StgPolicy].[SrcLevelType]
AS
SELECT DISTINCT SourceSystemCode
	,LevelTypeCode
	,LevelTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (
			PARTITION BY SourceSystemCode
			,LevelTypeCode ORDER BY LevelTypeName DESC
			) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,rtp.LevelTypeCode
			,ISNULL(rtp.LevelTypeDesc, '') AS LevelTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (RatingIntegrationPlan NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.RatingIntegrationPlan) WITH (RatingPlan NVARCHAR(MAX) AS JSON) rip
		CROSS APPLY OPENJSON(rip.RatingPlan) WITH (
				LevelTypeCode NVARCHAR(MAX)
				,LevelTypeDesc NVARCHAR(MAX)
				) rtp
		WHERE ISNULL(rtp.LevelTypeCode, '') <> ''
		
		UNION ALL
		
		SELECT hdr.SourceSystemCode
			,pll.LimitLevelCode AS LevelTypeCode
			,ISNULL(pll.LimitLevelDesc, '') AS LevelTypeName
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
		CROSS APPLY OPENJSON(cov.PolicyLimit) WITH (
				LimitLevelCode NVARCHAR(MAX)
				,LimitLevelDesc NVARCHAR(max)
				) pll
		WHERE ISNULL(pll.LimitLevelCode, '') <> ''
		
		UNION ALL
		
		SELECT hdr.SourceSystemCode
			,pll.LimitLevelCode AS LevelTypeCode
			,ISNULL(pll.LimitLevelDesc, '') AS LevelTypeName
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
		CROSS APPLY OPENJSON(ino.Coverage) WITH (
				PolicyLimit NVARCHAR(MAX) AS JSON
				,CoverageSourceCode NVARCHAR(MAX)
				) cov
		CROSS APPLY OPENJSON(cov.PolicyLimit) WITH (
				LimitLevelCode NVARCHAR(MAX)
				,LimitLevelDesc NVARCHAR(max)
				) pll
		WHERE ISNULL(pll.LimitLevelCode, '') <> ''
		
		UNION ALL
		
		SELECT hdr.SourceSystemCode
			,pll.LimitLevelCode AS LevelTypeCode
			,ISNULL(pll.LimitLevelDesc, '') AS LevelTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (PolicyLimit NVARCHAR(MAX) AS JSON) lob
		CROSS APPLY OPENJSON(lob.PolicyLimit) WITH (
				LimitLevelCode NVARCHAR(MAX)
				,LimitLevelDesc NVARCHAR(max)
				) pll
		WHERE ISNULL(pll.LimitLevelCode, '') <> ''
		
		UNION ALL
		
		SELECT hdr.SourceSystemCode
			,pll.DiscountLevelCode AS LevelTypeCode
			,ISNULL(pll.DiscountLevelDesc, '') AS LevelTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (Coverage NVARCHAR(MAX) AS JSON) lob
		CROSS APPLY OPENJSON(lob.Coverage) WITH (PolicyDiscount NVARCHAR(MAX) AS JSON) cov
		CROSS APPLY OPENJSON(cov.PolicyDiscount) WITH (
				DiscountLevelCode NVARCHAR(MAX)
				,DiscountLevelDesc NVARCHAR(max)
				) pll
		WHERE ISNULL(pll.DiscountLevelCode, '') <> ''
		
		UNION ALL
		
		SELECT hdr.SourceSystemCode
			,pll.DiscountLevelCode AS LevelTypeCode
			,ISNULL(pll.DiscountLevelDesc, '') AS LevelTypeName
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
		CROSS APPLY OPENJSON(ino.Coverage) WITH (PolicyDiscount NVARCHAR(MAX) AS JSON) cov
		CROSS APPLY OPENJSON(cov.PolicyDiscount) WITH (
				DiscountLevelCode NVARCHAR(MAX)
				,DiscountLevelDesc NVARCHAR(max)
				) pll
		WHERE ISNULL(pll.DiscountLevelCode, '') <> ''
		
		UNION ALL
		
		SELECT hdr.SourceSystemCode
			,pll.DiscountLevelCode AS LevelTypeCode
			,ISNULL(pll.DiscountLevelDesc, '') AS LevelTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (PolicyDiscount NVARCHAR(MAX) AS JSON) lob
		CROSS APPLY OPENJSON(lob.PolicyDiscount) WITH (
				DiscountLevelCode NVARCHAR(MAX)
				,DiscountLevelDesc NVARCHAR(max)
				) pll
		WHERE ISNULL(pll.DiscountLevelCode, '') <> ''
		
		UNION ALL
		
		SELECT hdr.SourceSystemCode
			,pll.DeductibleLevelCode AS LevelTypeCode
			,ISNULL(pll.DeductibleLevelDesc, '') AS LevelTypeName
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
		CROSS APPLY OPENJSON(cov.PolicyDeductible) WITH (
				DeductibleLevelCode NVARCHAR(MAX)
				,DeductibleLevelDesc NVARCHAR(max)
				) pll
		WHERE ISNULL(pll.DeductibleLevelCode, '') <> ''
		
		UNION ALL
		
		SELECT hdr.SourceSystemCode
			,pll.DeductibleLevelCode AS LevelTypeCode
			,ISNULL(pll.DeductibleLevelDesc, '') AS LevelTypeName
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
		CROSS APPLY OPENJSON(cov.PolicyDeductible) WITH (
				DeductibleLevelCode NVARCHAR(MAX)
				,DeductibleLevelDesc NVARCHAR(max)
				) pll
		WHERE ISNULL(pll.DeductibleLevelCode, '') <> ''
		
		UNION ALL
		
		SELECT hdr.SourceSystemCode
			,pll.DeductibleLevelCode AS LevelTypeCode
			,ISNULL(pll.DeductibleLevelDesc, '') AS LevelTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (PolicyDeductible NVARCHAR(MAX) AS JSON) lob
		CROSS APPLY OPENJSON(lob.PolicyDeductible) WITH (
				DeductibleLevelCode NVARCHAR(MAX)
				,DeductibleLevelDesc NVARCHAR(max)
				) pll
		WHERE ISNULL(pll.DeductibleLevelCode, '') <> ''
		
		UNION ALL
		
		SELECT hdr.SourceSystemCode
			,pll.FeeLevelTypeCode AS LevelTypeCode
			,ISNULL(pll.FeeLevelTypeDesc, '') AS LevelTypeName
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
		CROSS APPLY OPENJSON(cov.PolicyFee) WITH (
				FeeLevelTypeCode NVARCHAR(MAX)
				,FeeLevelTypeDesc NVARCHAR(max)
				) pll
		WHERE ISNULL(pll.FeeLevelTypeCode, '') <> ''
		
		UNION ALL
		
		SELECT hdr.SourceSystemCode
			,plf.FeeLevelTypeCode AS LevelTypeCode
			,ISNULL(plf.FeeLevelTypeDesc, '') AS LevelTypeName
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
		CROSS APPLY OPENJSON(cov.PolicyFee) WITH (
				FeeLevelTypeCode NVARCHAR(MAX)
				,FeeLevelTypeDesc NVARCHAR(max)
				) plf
		WHERE ISNULL(plf.FeeLevelTypeCode, '') <> ''
		
		UNION ALL
		
		SELECT hdr.SourceSystemCode
			,plf.FeeLevelTypeCode AS LevelTypeCode
			,ISNULL(plf.FeeLevelTypeDesc, '') AS LevelTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (PolicyFee NVARCHAR(MAX) AS JSON) lob
		CROSS APPLY OPENJSON(lob.PolicyFee) WITH (
				FeeLevelTypeCode NVARCHAR(MAX)
				,FeeLevelTypeDesc NVARCHAR(max)
				) plf
		WHERE ISNULL(plf.FeeLevelTypeCode, '') <> ''

		UNION ALL
		
		SELECT hdr.SourceSystemCode
			,plf.LimitLevelTypeCode AS LevelTypeCode
			,ISNULL(plf.LimitLevelTypeDesc, '') AS LevelTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (PolicyLimit NVARCHAR(MAX) AS JSON) lob
		CROSS APPLY OPENJSON(lob.PolicyLimit) WITH (
				LimitLevelTypeCode NVARCHAR(MAX)
				,LimitLevelTypeDesc NVARCHAR(max)
				) plf
		WHERE ISNULL(plf.LimitLevelTypeCode, '') <> ''

		UNION ALL
		
		SELECT hdr.SourceSystemCode
			,pll.LimitLevelCode AS LevelTypeCode
			,ISNULL(pll.LimitLevelDesc, '') AS LevelTypeName
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
		CROSS APPLY OPENJSON(grg.InsurableObject) WITH (Coverage	NVARCHAR(MAX) AS JSON) ino
		CROSS APPLY OPENJSON(ino.Coverage) WITH (PolicyLimit NVARCHAR(MAX) AS JSON) cov
		CROSS APPLY OPENJSON(cov.PolicyLimit) WITH (LimitLevelCode	NVARCHAR(MAX)
		,LimitLevelDesc NVARCHAR(MAX)
		) pll
		WHERE ISNULL(pll.LimitLevelCode, '') <> ''

		UNION ALL
		
		SELECT hdr.SourceSystemCode
			,pll.LimitLevelCode AS LevelTypeCode
			,ISNULL(pll.LimitLevelDesc, '') AS LevelTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (Coverage	NVARCHAR(MAX) AS JSON) lob
		CROSS APPLY OPENJSON(lob.Coverage) WITH (PolicyLimit NVARCHAR(MAX) AS JSON) cov
		CROSS APPLY OPENJSON(cov.PolicyLimit) WITH (LimitLevelCode	NVARCHAR(MAX)
		,LimitLevelDesc NVARCHAR(MAX)
		) pll
		WHERE ISNULL(pll.LimitLevelCode, '') <> ''

		UNION ALL
		
		SELECT hdr.SourceSystemCode
			,pll.DiscountLevelCode AS LevelTypeCode
			,ISNULL(pll.DiscountLevelDesc, '') AS LevelTypeName
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
		CROSS APPLY OPENJSON(ino.Coverage) WITH (PolicyDiscount NVARCHAR(MAX) AS JSON) cov
		CROSS APPLY OPENJSON(cov.PolicyDiscount) WITH (
				DiscountLevelCode NVARCHAR(MAX)
				,DiscountLevelDesc NVARCHAR(max)
				) pll
		WHERE ISNULL(pll.DiscountLevelCode, '') <> ''

		) AS tmp
	) AS tpl
WHERE tpl.rn = 1
GO
