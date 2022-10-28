USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcCheckType]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcCheckType]
AS

SELECT SourceSystemCode
	,CheckTypeCode
	,CheckTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, CheckTypeCode ORDER BY CheckTypeName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,clp.CheckTypeCode
			,ISNULL(clp.CheckTypeDesc, '') AS CheckTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (ClaimTransaction NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.ClaimTransaction) WITH (ClaimPayment NVARCHAR(MAX) AS JSON) clt
		CROSS APPLY OPENJSON(clt.ClaimPayment) WITH (CheckTypeCode NVARCHAR(MAX), CheckTypeDesc NVARCHAR(MAX)) clp

		WHERE ISNULL(clp.CheckTypeCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
