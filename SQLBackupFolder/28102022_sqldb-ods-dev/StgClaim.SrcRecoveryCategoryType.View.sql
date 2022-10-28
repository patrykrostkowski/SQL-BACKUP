USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcRecoveryCategoryType]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE    VIEW [StgClaim].[SrcRecoveryCategoryType]
AS

SELECT SourceSystemCode
	,RecoveryCategoryTypeCode
	,RecoveryCategoryTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, RecoveryCategoryTypeCode ORDER BY RecoveryCategoryTypeName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,clt.RecoveryCategoryTypeCode
			,ISNULL(clt.RecoveryCategoryTypeDesc, '') AS RecoveryCategoryTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (ClaimTransaction NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.ClaimTransaction) WITH (RecoveryCategoryTypeCode NVARCHAR(MAX), RecoveryCategoryTypeDesc NVARCHAR(MAX)) clt

		WHERE ISNULL(clt.RecoveryCategoryTypeCode, '') <> ''


		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
