USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcPaymentMethod]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcPaymentMethod]
AS

SELECT SourceSystemCode
	,PaymentMethodCode
	,PaymentMethodName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, PaymentMethodCode ORDER BY PaymentMethodName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,clp.PaymentMethodCode
			,ISNULL(clp.PaymentMethodDesc, '') AS PaymentMethodName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (ClaimTransaction NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.ClaimTransaction) WITH (ClaimPayment NVARCHAR(MAX) AS JSON) clt
		CROSS APPLY OPENJSON(clt.ClaimPayment) WITH (PaymentMethodCode NVARCHAR(MAX), PaymentMethodDesc NVARCHAR(MAX)) clp

		WHERE ISNULL(clp.PaymentMethodCode, '') <> ''


		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
