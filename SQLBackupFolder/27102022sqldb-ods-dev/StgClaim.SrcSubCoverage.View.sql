USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcSubCoverage]    Script Date: 27.10.2022 12:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [StgClaim].[SrcSubCoverage]
AS

SELECT SourceSystemCode
	,SubCoverageCode
	,SubCoverageName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SubCoverageCode ORDER BY SubCoverageName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,ccv.SubCoverageCode
			,ISNULL(ccv.SubCoverageDesc, '') AS SubCoverageName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (ClaimPolicy NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.ClaimPolicy) WITH (ClaimCoverage NVARCHAR(MAX) AS JSON) clp
		CROSS APPLY OPENJSON(clp.ClaimCoverage) WITH (SubCoverageCode NVARCHAR(MAX), SubCoverageDesc NVARCHAR(MAX)) ccv
		WHERE ISNULL(ccv.SubCoverageCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
