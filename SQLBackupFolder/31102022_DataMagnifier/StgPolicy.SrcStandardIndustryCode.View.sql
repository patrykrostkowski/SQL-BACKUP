USE [DataMagnifier]
GO
/****** Object:  View [StgPolicy].[SrcStandardIndustryCode]    Script Date: 31.10.2022 12:03:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [StgPolicy].[SrcStandardIndustryCode]
AS
SELECT SourceSystemCode
	,StandardIndustryCode
	,StandardIndustryCodeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, StandardIndustryCode ORDER BY StandardIndustryCodeName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,plt.StandardIndustryCode 
			,ISNULL(plt.StandardIndustryCodeDesc, '') AS StandardIndustryCodeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (StandardIndustryCode NVARCHAR(MAX), StandardIndustryCodeDesc NVARCHAR(MAX)) plt		
		WHERE ISNULL(plt.StandardIndustryCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,pol.StandardIndustryCode 
			,ISNULL(pol.StandardIndustryCodeDesc, '') AS StandardIndustryCodeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (StandardIndustryCode NVARCHAR(MAX), StandardIndustryCodeDesc NVARCHAR(MAX)) pol		
		WHERE ISNULL(pol.StandardIndustryCode, '') <> ''

		) AS tmp
	) AS tpl
GO
