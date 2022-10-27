USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcOtherRecoverableStatus]    Script Date: 27.10.2022 12:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [StgClaim].[SrcOtherRecoverableStatus]
AS

SELECT SourceSystemCode
	,OtherRecoverableStatusCode
	,OtherRecoverableStatusName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, OtherRecoverableStatusCode ORDER BY OtherRecoverableStatusName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,clm.OtherRecoverableStatusCode 
			,ISNULL(clm.OtherRecoverableStatusDesc, '') AS OtherRecoverableStatusName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (OtherRecoverableStatusCode NVARCHAR(MAX), OtherRecoverableStatusDesc NVARCHAR(MAX)) clm
		WHERE ISNULL(clm.OtherRecoverableStatusCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
