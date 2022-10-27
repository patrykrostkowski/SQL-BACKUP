USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcCoverage]    Script Date: 27.10.2022 12:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcCoverage]
AS

SELECT SourceSystemCode
	,CoverageCode
	,CoverageName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, CoverageCode ORDER BY CoverageName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,ccv.CoverageCode 
			,ISNULL(ccv.CoverageDesc, '') AS CoverageName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (ClaimPolicy NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.ClaimPolicy) WITH (ClaimCoverage NVARCHAR(MAX) AS JSON) clp
		CROSS APPLY OPENJSON(clp.ClaimCoverage) WITH (CoverageCode NVARCHAR(MAX), CoverageDesc NVARCHAR(MAX)) ccv
		WHERE ISNULL(ccv.CoverageCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
