USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcTransactionStatus]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcTransactionStatus]
AS

SELECT SourceSystemCode
	,TransactionStatusCode
	,TransactionStatusName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, TransactionStatusCode ORDER BY TransactionStatusName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,clp.TransactionStatusCode
			,ISNULL(clp.TransactionStatusDesc, '') AS TransactionStatusName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (ClaimTransaction NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.ClaimTransaction) WITH (ClaimPayment NVARCHAR(MAX) AS JSON) clt
		CROSS APPLY OPENJSON(clt.ClaimPayment) WITH (TransactionStatusCode NVARCHAR(MAX), TransactionStatusDesc NVARCHAR(MAX)) clp


		WHERE ISNULL(clp.TransactionStatusCode, '') <> ''


		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
