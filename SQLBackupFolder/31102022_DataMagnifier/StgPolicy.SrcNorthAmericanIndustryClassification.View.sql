USE [DataMagnifier]
GO
/****** Object:  View [StgPolicy].[SrcNorthAmericanIndustryClassification]    Script Date: 31.10.2022 12:03:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [StgPolicy].[SrcNorthAmericanIndustryClassification]
AS
SELECT SourceSystemCode
	,NorthAmericanIndustryClassificationCode
	,NorthAmericanIndustryClassificationName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, NorthAmericanIndustryClassificationCode ORDER BY NorthAmericanIndustryClassificationName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,pti.NorthAmericanIndustryClassificationCode 
			,ISNULL(pti.NorthAmericanIndustryClassificationDesc, '') AS NorthAmericanIndustryClassificationName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (Account NVARCHAR(MAX) AS JSON) pol	
		CROSS APPLY OPENJSON(pol.Account) WITH (PartyInfo NVARCHAR(MAX) AS JSON) acc
		CROSS APPLY OPENJSON(acc.PartyInfo) WITH (NorthAmericanIndustryClassificationCode NVARCHAR(MAX), NorthAmericanIndustryClassificationDesc NVARCHAR(MAX)) pti
		WHERE ISNULL(pti.NorthAmericanIndustryClassificationCode, '') <> ''

		UNION ALL 

		SELECT hdr.SourceSystemCode
			,pti.NorthAmericanIndustryClassificationCode 
			,ISNULL(pti.NorthAmericanIndustryClassificationDesc, '') AS NorthAmericanIndustryClassificationName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (Agency NVARCHAR(MAX) AS JSON) pol	
		CROSS APPLY OPENJSON(pol.Agency) WITH (PartyInfo NVARCHAR(MAX) AS JSON) agc
		CROSS APPLY OPENJSON(agc.PartyInfo) WITH (NorthAmericanIndustryClassificationCode NVARCHAR(MAX), NorthAmericanIndustryClassificationDesc NVARCHAR(MAX)) pti
		WHERE ISNULL(pti.NorthAmericanIndustryClassificationCode, '') <> ''

		UNION ALL 

		SELECT hdr.SourceSystemCode
			,ins.NorthAmericanIndustryClassificationCode 
			,ISNULL(ins.NorthAmericanIndustryClassificationDesc, '') AS NorthAmericanIndustryClassificationName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (Insured NVARCHAR(MAX) AS JSON) pol	
		CROSS APPLY OPENJSON(pol.Insured) WITH (NorthAmericanIndustryClassificationCode NVARCHAR(MAX), NorthAmericanIndustryClassificationDesc NVARCHAR(MAX)) ins
		WHERE ISNULL(ins.NorthAmericanIndustryClassificationCode, '') <> ''

		UNION ALL 

		SELECT hdr.SourceSystemCode
			,pti.NorthAmericanIndustryClassificationCode 
			,ISNULL(pti.NorthAmericanIndustryClassificationDesc, '') AS NorthAmericanIndustryClassificationName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (Insured NVARCHAR(MAX) AS JSON) pol	
		CROSS APPLY OPENJSON(pol.Insured) WITH (PartyInfo NVARCHAR(MAX) AS JSON) ins
		CROSS APPLY OPENJSON(ins.PartyInfo) WITH (NorthAmericanIndustryClassificationCode NVARCHAR(MAX), NorthAmericanIndustryClassificationDesc NVARCHAR(MAX)) pti
		WHERE ISNULL(pti.NorthAmericanIndustryClassificationCode, '') <> ''

		UNION ALL 

		SELECT hdr.SourceSystemCode
			,pti.NorthAmericanIndustryClassificationCode 
			,ISNULL(pti.NorthAmericanIndustryClassificationDesc, '') AS NorthAmericanIndustryClassificationName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (MiscParty NVARCHAR(MAX) AS JSON) pol	
		CROSS APPLY OPENJSON(pol.MiscParty) WITH (PartyInfo NVARCHAR(MAX) AS JSON) msp
		CROSS APPLY OPENJSON(msp.PartyInfo) WITH (NorthAmericanIndustryClassificationCode NVARCHAR(MAX), NorthAmericanIndustryClassificationDesc NVARCHAR(MAX)) pti
		WHERE ISNULL(pti.NorthAmericanIndustryClassificationCode, '') <> ''

		UNION ALL 

		SELECT hdr.SourceSystemCode
			,pol.NorthAmericanIndustryClassificationCode 
			,ISNULL(pol.NorthAmericanIndustryClassificationDesc, '') AS NorthAmericanIndustryClassificationName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (NorthAmericanIndustryClassificationCode NVARCHAR(MAX), NorthAmericanIndustryClassificationDesc NVARCHAR(MAX)) pol
		WHERE ISNULL(pol.NorthAmericanIndustryClassificationCode, '') <> ''

		UNION ALL 

		SELECT hdr.SourceSystemCode
			,plt.NorthAmericanIndustryClassificationCode 
			,ISNULL(plt.NorthAmericanIndustryClassificationDesc, '') AS NorthAmericanIndustryClassificationName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (NorthAmericanIndustryClassificationCode NVARCHAR(MAX), NorthAmericanIndustryClassificationDesc NVARCHAR(MAX)) plt
		WHERE ISNULL(plt.NorthAmericanIndustryClassificationCode, '') <> ''

		) AS tmp
	) AS tpl
GO
