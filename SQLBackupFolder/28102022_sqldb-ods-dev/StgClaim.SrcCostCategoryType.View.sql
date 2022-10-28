USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcCostCategoryType]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE   VIEW [StgClaim].[SrcCostCategoryType]
AS

SELECT SourceSystemCode
	,CostCategoryTypeCode
	,CostCategoryTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, CostCategoryTypeCode ORDER BY CostCategoryTypeName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,clt.CostCategoryTypeCode
			,ISNULL(clt.CostCategoryTypeDesc, '') AS CostCategoryTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (ClaimTransaction NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.ClaimTransaction) WITH (CostCategoryTypeCode NVARCHAR(MAX), CostCategoryTypeDesc NVARCHAR(MAX)) clt

		WHERE ISNULL(clt.CostCategoryTypeCode, '') <> ''


		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
