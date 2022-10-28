USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcBankAccount]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcBankAccount]
AS

SELECT SourceSystemCode
	,BankAccountCode
	,BankAccountName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, BankAccountCode ORDER BY BankAccountName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,clp.BankAccountCode
			,ISNULL(clp.BankAccountDesc, '') AS BankAccountName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (ClaimTransaction NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.ClaimTransaction) WITH (ClaimPayment NVARCHAR(MAX) AS JSON) clt
		CROSS APPLY OPENJSON(clt.ClaimPayment) WITH (BankAccountCode NVARCHAR(MAX), BankAccountDesc NVARCHAR(MAX)) clp

		WHERE ISNULL(clp.BankAccountCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
