USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcPayeeType]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcPayeeType]
AS

SELECT SourceSystemCode
	,PayeeTypeCode
	,PayeeTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, PayeeTypeCode ORDER BY PayeeTypeName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,clp.PayeeTypeCode
			,ISNULL(clp.PayeeTypeDesc, '') AS PayeeTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (ClaimTransaction NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.ClaimTransaction) WITH (ClaimPayment NVARCHAR(MAX) AS JSON) clt
		CROSS APPLY OPENJSON(clt.ClaimPayment) WITH (PayeeTypeCode NVARCHAR(MAX), PayeeTypeDesc NVARCHAR(MAX)) clp

		WHERE ISNULL(clp.PayeeTypeCode, '') <> ''


		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
