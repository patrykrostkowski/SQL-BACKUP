USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcNorthAmericanIndustryClassification]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcNorthAmericanIndustryClassification]
AS

SELECT SourceSystemCode
	,NorthAmericanIndustryClassificationCode
	,NorthAmericanIndustryClassificationName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, NorthAmericanIndustryClassificationCode ORDER BY NorthAmericanIndustryClassificationName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,clm.NorthAmericanIndustryClassificationCode 
			,ISNULL(clm.NorthAmericanIndustryClassificationDesc, '') AS NorthAmericanIndustryClassificationName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (NorthAmericanIndustryClassificationCode NVARCHAR(MAX), NorthAmericanIndustryClassificationDesc NVARCHAR(MAX)) clm
		WHERE ISNULL(clm.NorthAmericanIndustryClassificationCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
