USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcCoverageTrigger]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE    VIEW [StgClaim].[SrcCoverageTrigger]
AS


SELECT SourceSystemCode
	,CoverageTriggerCode
	,CoverageTriggerName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, CoverageTriggerCode ORDER BY CoverageTriggerName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,clm.CoverageTriggerCode 
			,ISNULL(clm.CoverageTriggerDesc, '') AS CoverageTriggerName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (CoverageTriggerCode NVARCHAR(MAX), CoverageTriggerDesc NVARCHAR(MAX)) clm
		WHERE ISNULL(clm.CoverageTriggerCode, '') <> ''

UNION ALL

		SELECT hdr.SourceSystemCode
			,clp.CoverageTriggerCode 
			,ISNULL(clp.CoverageTriggerDesc, '') AS CoverageTriggerName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (ClaimPolicy NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.ClaimPolicy) WITH (CoverageTriggerCode NVARCHAR(MAX), CoverageTriggerDesc NVARCHAR(MAX)) clp
		WHERE ISNULL(clp.CoverageTriggerCode, '') <> ''

UNION ALL

		SELECT hdr.SourceSystemCode
			,clc.CoverageTriggerCode 
			,ISNULL(clc.CoverageTriggerDesc, '') AS CoverageTriggerName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (ClaimPolicy NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.ClaimPolicy) WITH (ClaimCoverage NVARCHAR(MAX) AS JSON) clp
		CROSS APPLY OPENJSON(clp.ClaimCoverage) WITH (CoverageTriggerCode NVARCHAR(MAX), CoverageTriggerDesc NVARCHAR(MAX)) clc
		WHERE ISNULL(clc.CoverageTriggerCode, '') <> ''
		

		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
