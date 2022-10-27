USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcCurrency]    Script Date: 27.10.2022 12:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE   VIEW [StgPolicy].[SrcCurrency]
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
			,ISNULL(pol.BaseCurrencyDesc, '') AS CurrencyName
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
		WHERE ISNULL(pol.BaseCurrencyCode, '') <> ''
		
		UNION ALL
		
		SELECT hdr.SourceSystemCode
			,pol.OriginalCurrencyCode AS CurrencyCode
			,ISNULL(pol.OriginalCurrencyDesc, '') AS CurrencyName
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
		WHERE ISNULL(pol.OriginalCurrencyCode, '') <> ''
		
		UNION ALL
		
		SELECT hdr.SourceSystemCode
			,plt.BaseCurrencyCode AS CurrencyCode
			,ISNULL(plt.BaseCurrencyDesc, '') AS CurrencyName
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
		WHERE ISNULL(plt.BaseCurrencyCode, '') <> ''
		
		UNION ALL
		
		SELECT hdr.SourceSystemCode
			,plt.OriginalCurrencyCode AS CurrencyCode
			,ISNULL(plt.OriginalCurrencyDesc, '') AS CurrencyName
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
		WHERE ISNULL(plt.OriginalCurrencyCode, '') <> ''
		
		UNION ALL
		
		SELECT hdr.SourceSystemCode
			,plt.ReportingCurrencyCode AS CurrencyCode
			,ISNULL(plt.ReportingCurrencyDesc, '') AS CurrencyName
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
		WHERE ISNULL(plt.ReportingCurrencyCode, '') <> ''
		
		UNION ALL
		
		SELECT hdr.SourceSystemCode
			,pol.ReportingCurrencyCode AS CurrencyCode
			,ISNULL(pol.ReportingCurrencyDesc, '') AS CurrencyName
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
		WHERE ISNULL(pol.ReportingCurrencyCode, '') <> ''

		UNION ALL
		
		SELECT hdr.SourceSystemCode
			,psp.BaseCurrencyCode AS CurrencyCode
			,ISNULL(psp.BaseCurrencyDesc, '') AS CurrencyName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
			Policy NVARCHAR(MAX) AS JSON
			,SourceSystemCode NVARCHAR(MAX)
			,SourceSystemDesc NVARCHAR(MAX)
			) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (
			PolicyTrans NVARCHAR(MAX) AS JSON
			) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (
			LineOfBusiness NVARCHAR(MAX) AS JSON
			) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (
			Geography NVARCHAR(MAX) AS JSON
			) lob
		CROSS APPLY OPENJSON(lob.Geography) WITH (
			InsurableObject NVARCHAR(MAX) AS JSON
			) grg
		CROSS APPLY OPENJSON(grg.InsurableObject) WITH (
			PersonalProperty NVARCHAR(MAX) AS JSON
			) ino
		CROSS APPLY OPENJSON(ino.PersonalProperty) WITH (
			BaseCurrencyCode NVARCHAR(MAX)
			,BaseCurrencyDesc NVARCHAR(MAX)
			) psp
		WHERE ISNULL(psp.BaseCurrencyCode, '') <> ''

		UNION ALL

		SELECT 
			hdr.SourceSystemCode
			,lsh.BaseCurrencyCode AS CurrencyCode
			,ISNULL(lsh.BaseCurrencyDesc, '') AS CurrencyName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				SourceSystemCode NVARCHAR(max)
				,ProcessDateTime NVARCHAR(max)
				,Policy NVARCHAR(max) AS JSON
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (
				LossHistory NVARCHAR(max) AS JSON
				) pol
		cross APPLY OPENJSON(pol.LossHistory) WITH (
				BaseCurrencyCode NVARCHAR(MAX)
				,BaseCurrencyDesc NVARCHAR(MAX)
				) lsh
		WHERE ISNULL(lsh.BaseCurrencyCode, '') <> ''



		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
