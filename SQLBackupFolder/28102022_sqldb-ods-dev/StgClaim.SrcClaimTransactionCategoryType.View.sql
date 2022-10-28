USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcClaimTransactionCategoryType]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE   VIEW [StgClaim].[SrcClaimTransactionCategoryType]
AS

SELECT SourceSystemCode
	,ClaimTransactionCategoryTypeCode
	,ClaimTransactionCategoryTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, ClaimTransactionCategoryTypeCode ORDER BY ClaimTransactionCategoryTypeName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,clt.ClaimTransactionCategoryTypeCode
			,ISNULL(clt.ClaimTransactionCategoryTypeDesc, '') AS ClaimTransactionCategoryTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (ClaimTransaction NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.ClaimTransaction) WITH (ClaimTransactionCategoryTypeCode NVARCHAR(MAX), ClaimTransactionCategoryTypeDesc NVARCHAR(MAX)) clt

		WHERE ISNULL(clt.ClaimTransactionCategoryTypeCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
