USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcBankAccountType]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcBankAccountType]
AS

SELECT SourceSystemCode
	,BankAccountTypeCode
	,BankAccountTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, BankAccountTypeCode ORDER BY BankAccountTypeName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,clp.BankAccountTypeCode
			,ISNULL(clp.BankAccountTypeDesc, '') AS BankAccountTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (ClaimTransaction NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.ClaimTransaction) WITH (ClaimPayment NVARCHAR(MAX) AS JSON) clt
		CROSS APPLY OPENJSON(clt.ClaimPayment) WITH (BankAccountTypeCode NVARCHAR(MAX), BankAccountTypeDesc NVARCHAR(MAX)) clp

		WHERE ISNULL(clp.BankAccountTypeCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
