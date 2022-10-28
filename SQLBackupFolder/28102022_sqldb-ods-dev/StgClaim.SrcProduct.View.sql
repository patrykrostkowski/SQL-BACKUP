USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcProduct]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcProduct]
AS

SELECT SourceSystemCode
	,ProductCode
	,ProductName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, ProductCode ORDER BY ProductName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,clm.ProductCode 
			,ISNULL(clm.ProductDesc, '') AS ProductName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (ProductCode NVARCHAR(MAX), ProductDesc NVARCHAR(MAX)) clm
		WHERE ISNULL(clm.ProductCode, '') <> ''

UNION ALL

		SELECT hdr.SourceSystemCode
			,clp.ProductCode 
			,ISNULL(clp.ProductDesc, '') AS ProductName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (ClaimPolicy NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.ClaimPolicy) WITH (ProductCode NVARCHAR(MAX), ProductDesc NVARCHAR(MAX)) clp
		WHERE ISNULL(clp.ProductCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
