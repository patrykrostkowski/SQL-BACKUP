USE [DataMagnifier]
GO
/****** Object:  View [StgPolicy].[SrcExposureType]    Script Date: 18.11.2022 16:40:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [StgPolicy].[SrcExposureType]
AS
SELECT SourceSystemCode
	,ExposureTypeCode
	,ExposureTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, ExposureTypeCode ORDER BY ExposureTypeName DESC) AS rn
	FROM (
	   	SELECT hdr.SourceSystemCode
			,ple.ExposureTypeCode
			,ISNULL(ple.ExposureTypeDesc, '') AS ExposureTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt	
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (Coverage NVARCHAR(MAX) AS JSON) lob
		CROSS APPLY OPENJSON(lob.Coverage) WITH (PolicyExposure NVARCHAR(MAX) AS JSON) cov
		CROSS APPLY OPENJSON(cov.PolicyExposure) WITH (ExposureTypeCode NVARCHAR(MAX), ExposureTypeDesc NVARCHAR(MAX)) ple
		WHERE ISNULL(ple.ExposureTypeCode, '') <> ''

		UNION ALL

	   	SELECT hdr.SourceSystemCode
			,ple.ExposureTypeCode
			,ISNULL(ple.ExposureTypeDesc, '') AS ExposureTypeName
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
		CROSS APPLY OPENJSON(ino.Coverage) WITH (PolicyExposure NVARCHAR(MAX) AS JSON) cov
		CROSS APPLY OPENJSON(cov.PolicyExposure) WITH (ExposureTypeCode NVARCHAR(MAX), ExposureTypeDesc NVARCHAR(MAX)) ple
		WHERE ISNULL(ple.ExposureTypeCode, '') <> ''

		UNION ALL

	   	SELECT hdr.SourceSystemCode
			,ple.ExposureTypeCode
			,ISNULL(ple.ExposureTypeDesc, '') AS ExposureTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt	
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (PolicyExposure NVARCHAR(MAX) AS JSON) lob
		CROSS APPLY OPENJSON(lob.PolicyExposure) WITH (ExposureTypeCode NVARCHAR(MAX), ExposureTypeDesc NVARCHAR(MAX)) ple
		WHERE ISNULL(ple.ExposureTypeCode, '') <> ''

		UNION ALL

	   	SELECT hdr.SourceSystemCode
			,ple.ExposureTypeCode
			,ISNULL(ple.ExposureTypeDesc, '') AS ExposureTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (RatingIntegrationPlan NVARCHAR(MAX) AS JSON) plt	
		CROSS APPLY OPENJSON(plt.RatingIntegrationPlan) WITH (RatingPlan NVARCHAR(MAX) AS JSON) rip
		CROSS APPLY OPENJSON(rip.RatingPlan) WITH (ExposureTypeCode NVARCHAR(MAX), ExposureTypeDesc NVARCHAR(MAX)) ple
		WHERE ISNULL(ple.ExposureTypeCode, '') <> ''

		) AS tmp
	) AS tpl
GO
