USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcSalvageDetailType]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcSalvageDetailType]
AS

SELECT SourceSystemCode
	,SalvageDetailTypeCode
	,SalvageDetailTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SalvageDetailTypeCode ORDER BY SalvageDetailTypeName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,les.SalvageDetailTypeCode
			,ISNULL(les.SalvageDetailTypeDesc, '') AS SalvageDetailTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (LossEventSalvage NVARCHAR(max) AS JSON) loe
		CROSS APPLY OPENJSON(loe.LossEventSalvage) WITH (SalvageDetailTypeCode NVARCHAR(max), SalvageDetailTypeDesc NVARCHAR(MAX)) les
		WHERE ISNULL(les.SalvageDetailTypeCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
