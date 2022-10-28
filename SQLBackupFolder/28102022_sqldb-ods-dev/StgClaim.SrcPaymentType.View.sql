USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcPaymentType]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcPaymentType]
AS

SELECT SourceSystemCode
	,PaymentTypeCode
	,PaymentTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, PaymentTypeCode ORDER BY PaymentTypeName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,clt.PaymentTypeCode
			,ISNULL(clt.PaymentTypeDesc, '') AS PaymentTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (ClaimTransaction NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.ClaimTransaction) WITH (PaymentTypeCode NVARCHAR(MAX), PaymentTypeDesc NVARCHAR(MAX)) clt

		WHERE ISNULL(clt.PaymentTypeCode, '') <> ''


		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
