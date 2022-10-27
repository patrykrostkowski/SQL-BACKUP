USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcCostCategory]    Script Date: 27.10.2022 12:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE   VIEW [StgClaim].[SrcCostCategory]
AS

SELECT SourceSystemCode
	,CostCategoryCode
	,CostCategoryName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, CostCategoryCode ORDER BY CostCategoryName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,clt.CostCategoryCode
			,ISNULL(clt.CostCategoryDesc, '') AS CostCategoryName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (ClaimTransaction NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.ClaimTransaction) WITH (CostCategoryCode NVARCHAR(MAX), CostCategoryDesc NVARCHAR(MAX)) clt

		WHERE ISNULL(clt.CostCategoryCode, '') <> ''


		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
