USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcStandardIndustryCode]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE    VIEW [StgClaim].[SrcStandardIndustryCode]
AS

SELECT SourceSystemCode
	,StandardIndustryCode
	,StandardIndustryName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, StandardIndustryCode ORDER BY StandardIndustryName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,clm.StandardIndustryCode 
			,ISNULL(clm.StandardIndustryCodeDesc, '') AS StandardIndustryName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (StandardIndustryCode NVARCHAR(MAX), StandardIndustryCodeDesc NVARCHAR(MAX)) clm
		WHERE ISNULL(clm.StandardIndustryCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
