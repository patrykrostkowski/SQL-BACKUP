USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcCostType]    Script Date: 27.10.2022 12:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE    VIEW [StgClaim].[SrcCostType]
AS

SELECT SourceSystemCode
	,CostTypeCode
	,CostTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, CostTypeCode ORDER BY CostTypeName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,clt.CostTypeCode
			,ISNULL(clt.CostTypeDesc, '') AS CostTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (ClaimTransaction NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.ClaimTransaction) WITH (CostTypeCode NVARCHAR(MAX), CostTypeDesc NVARCHAR(MAX)) clt

		WHERE ISNULL(clt.CostTypeCode, '') <> ''


		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
