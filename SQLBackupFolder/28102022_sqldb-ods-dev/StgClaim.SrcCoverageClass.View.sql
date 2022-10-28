USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcCoverageClass]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcCoverageClass]
AS

SELECT SourceSystemCode
	,CoverageClassCode
	,CoverageClassName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, CoverageClassCode ORDER BY CoverageClassName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,ccv.CoverageClassCode 
			,ISNULL(ccv.CoverageClassDesc, '') AS CoverageClassName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (ClaimPolicy NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.ClaimPolicy) WITH (ClaimCoverage NVARCHAR(MAX) AS JSON) cts
		CROSS APPLY OPENJSON(cts.ClaimCoverage) WITH (CoverageClassCode NVARCHAR(MAX), CoverageClassDesc NVARCHAR(MAX)) ccv
		WHERE ISNULL(ccv.CoverageClassCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
