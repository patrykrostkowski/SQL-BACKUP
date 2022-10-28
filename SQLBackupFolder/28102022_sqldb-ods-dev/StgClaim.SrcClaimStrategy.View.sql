USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcClaimStrategy]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [StgClaim].[SrcClaimStrategy]
AS

SELECT SourceSystemCode
	,ClaimStrategyCode
	,ClaimStrategyName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, ClaimStrategyCode ORDER BY ClaimStrategyName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,loc.ClaimStrategyCode 
			,ISNULL(loc.ClaimStrategyDesc, '') AS ClaimStrategyName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (LossOccurrence NVARCHAR(MAX) AS JSON) lev
		CROSS APPLY OPENJSON(lev.LossOccurrence) WITH (ClaimStrategyCode NVARCHAR(MAX), ClaimStrategyDesc NVARCHAR(MAX)) loc
		WHERE ISNULL(loc.ClaimStrategyCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
