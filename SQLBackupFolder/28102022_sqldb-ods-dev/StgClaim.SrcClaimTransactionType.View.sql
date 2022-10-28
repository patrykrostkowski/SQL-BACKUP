USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcClaimTransactionType]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcClaimTransactionType]
AS

SELECT SourceSystemCode
	,ClaimTransactionTypeCode
	,ClaimTransactionTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, ClaimTransactionTypeCode ORDER BY ClaimTransactionTypeName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,clt.ClaimTransactionTypeCode
			,ISNULL(clt.ClaimTransactionTypeDesc, '') AS ClaimTransactionTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (ClaimTransaction NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.ClaimTransaction) WITH (ClaimTransactionTypeCode NVARCHAR(MAX), ClaimTransactionTypeDesc NVARCHAR(MAX)) clt

		WHERE ISNULL(clt.ClaimTransactionTypeCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
