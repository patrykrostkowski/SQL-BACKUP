USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcLossAreaType]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [StgClaim].[SrcLossAreaType]
AS

SELECT SourceSystemCode
	,LossAreaTypeCode
	,LossAreaTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, LossAreaTypeCode ORDER BY LossAreaTypeName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,lep.LossAreaTypeCode
			,ISNULL(lep.LossAreaTypeDesc, '') AS LossAreaTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH 
				(
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (LossEventProperty NVARCHAR(MAX) AS JSON) lev
		CROSS APPLY OPENJSON(lev.LossEventProperty) WITH (LossAreaTypeDesc NVARCHAR(MAX), LossAreaTypeCode NVARCHAR(MAX)) lep
		WHERE ISNULL(lep.LossAreaTypeCode, '') <> ''
		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
