USE [DataMagnifier]
GO
/****** Object:  View [StgPolicy].[SrcCurrency]    Script Date: 10.11.2022 14:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[StgPolicy].[SrcCurrency]'))
EXEC dbo.sp_executesql @statement = N'
-- view without PersonalProperty Table

CREATE VIEW [StgPolicy].[SrcCurrency]
AS

SELECT SourceSystemCode
	,CurrencyCode
	,CurrencyName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, CurrencyCode ORDER BY CurrencyName DESC
			) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,pol.BaseCurrencyCode AS CurrencyCode
			,ISNULL(pol.BaseCurrencyDesc, '''') AS CurrencyName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (
				BaseCurrencyCode NVARCHAR(MAX)
				,BaseCurrencyDesc NVARCHAR(MAX)
				) pol
		WHERE ISNULL(pol.BaseCurrencyCode, '''') <> ''''
		
		UNION ALL
		
		SELECT hdr.SourceSystemCode
			,pol.OriginalCurrencyCode AS CurrencyCode
			,ISNULL(pol.OriginalCurrencyDesc, '''') AS CurrencyName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (
				OriginalCurrencyCode NVARCHAR(MAX)
				,OriginalCurrencyDesc NVARCHAR(MAX)
				) pol
		WHERE ISNULL(pol.OriginalCurrencyCode, '''') <> ''''
		
		UNION ALL
		
		SELECT hdr.SourceSystemCode
			,plt.BaseCurrencyCode AS CurrencyCode
			,ISNULL(plt.BaseCurrencyDesc, '''') AS CurrencyName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (
				BaseCurrencyCode NVARCHAR(MAX)
				,BaseCurrencyDesc NVARCHAR(MAX)
				) plt
		WHERE ISNULL(plt.BaseCurrencyCode, '''') <> ''''
		
		UNION ALL
		
		SELECT hdr.SourceSystemCode
			,plt.OriginalCurrencyCode AS CurrencyCode
			,ISNULL(plt.OriginalCurrencyDesc, '''') AS CurrencyName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (
				OriginalCurrencyCode NVARCHAR(MAX)
				,OriginalCurrencyDesc NVARCHAR(MAX)
				) plt
		WHERE ISNULL(plt.OriginalCurrencyCode, '''') <> ''''
		
		UNION ALL
		
		SELECT hdr.SourceSystemCode
			,plt.ReportingCurrencyCode AS CurrencyCode
			,ISNULL(plt.ReportingCurrencyDesc, '''') AS CurrencyName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (
				ReportingCurrencyCode NVARCHAR(MAX)
				,ReportingCurrencyDesc NVARCHAR(MAX)
				) plt
		WHERE ISNULL(plt.ReportingCurrencyCode, '''') <> ''''
		
		UNION ALL
		
		SELECT hdr.SourceSystemCode
			,pol.ReportingCurrencyCode AS CurrencyCode
			,ISNULL(pol.ReportingCurrencyDesc, '''') AS CurrencyName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (
				ReportingCurrencyCode NVARCHAR(MAX)
				,ReportingCurrencyDesc NVARCHAR(MAX)
				) pol
		WHERE ISNULL(pol.ReportingCurrencyCode, '''') <> ''''
		) AS tmp
	) AS tpl
' 
GO
