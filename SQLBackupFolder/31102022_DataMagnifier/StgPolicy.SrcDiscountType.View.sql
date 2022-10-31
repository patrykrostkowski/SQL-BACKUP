USE [DataMagnifier]
GO
/****** Object:  View [StgPolicy].[SrcDiscountType]    Script Date: 31.10.2022 12:06:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [StgPolicy].[SrcDiscountType]
AS
SELECT SourceSystemCode
	,DiscountTypeCode
	,DiscountTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, DiscountTypeCode ORDER BY DiscountTypeName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,pld.DiscountTypeCode
			,ISNULL(pld.DiscountTypeDesc, '') AS DiscountTypeName
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
		CROSS APPLY OPENJSON(cov.PolicyDiscount) WITH (DiscountTypeCode NVARCHAR(MAX), DiscountTypeDesc NVARCHAR(MAX)) pld
		WHERE ISNULL(pld.DiscountTypeCode, '') <> ''

		UNION ALL 

		SELECT hdr.SourceSystemCode
			,pld.DiscountTypeCode
			,ISNULL(pld.DiscountTypeDesc, '') AS DiscountTypeName
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
		CROSS APPLY OPENJSON(cov.PolicyDiscount) WITH (DiscountTypeCode NVARCHAR(MAX), DiscountTypeDesc NVARCHAR(MAX)) pld
		WHERE ISNULL(pld.DiscountTypeCode, '') <> ''

		UNION ALL 

		SELECT hdr.SourceSystemCode
			,pld.DiscountTypeCode
			,ISNULL(pld.DiscountTypeDesc, '') AS DiscountTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol	
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (PolicyDiscount NVARCHAR(MAX) AS JSON) lob
		CROSS APPLY OPENJSON(lob.PolicyDiscount) WITH (DiscountTypeCode NVARCHAR(MAX), DiscountTypeDesc NVARCHAR(MAX)) pld
		WHERE ISNULL(pld.DiscountTypeCode, '') <> ''

		) AS tmp
	) AS tpl
GO
