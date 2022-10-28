USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcLossType]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [StgClaim].[SrcLossType]
AS

SELECT SourceSystemCode
	,LossTypeCode
	,LossTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, LossTypeCode ORDER BY LossTypeName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,clt.LossTypeCode 
			,ISNULL(clt.LossTypeDesc, '') AS LossTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (Claimant NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.Claimant) WITH (LossTypeCode NVARCHAR(MAX), LossTypeDesc NVARCHAR(MAX)) clt
		WHERE ISNULL(clt.LossTypeCode, '') <> ''

	UNION ALL

		SELECT hdr.SourceSystemCode
			,cld.LossTypeCode 
			,ISNULL(cld.LossTypeDesc, '') AS LossTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (Catastrophe NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.Catastrophe) WITH (CatastropheDetail NVARCHAR(MAX) AS JSON) cts
		CROSS APPLY OPENJSON(cts.CatastropheDetail) WITH (LossTypeCode NVARCHAR(MAX), LossTypeDesc NVARCHAR(MAX)) cld
		WHERE ISNULL(cld.LossTypeCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
