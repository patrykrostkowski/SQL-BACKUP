USE [DataMagnifier]
GO
/****** Object:  View [StgPolicy].[SrcStandardIndustryCode]    Script Date: 10.11.2022 14:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[StgPolicy].[SrcStandardIndustryCode]'))
EXEC dbo.sp_executesql @statement = N'
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
			,ISNULL(plt.StandardIndustryCodeDesc, '''') AS StandardIndustryCodeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (StandardIndustryCode NVARCHAR(MAX), StandardIndustryCodeDesc NVARCHAR(MAX)) plt		
		WHERE ISNULL(plt.StandardIndustryCode, '''') <> ''''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,pol.StandardIndustryCode 
			,ISNULL(pol.StandardIndustryCodeDesc, '''') AS StandardIndustryCodeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (StandardIndustryCode NVARCHAR(MAX), StandardIndustryCodeDesc NVARCHAR(MAX)) pol		
		WHERE ISNULL(pol.StandardIndustryCode, '''') <> ''''

		) AS tmp
	) AS tpl' 
GO
