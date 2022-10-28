USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcLossPartyType]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [StgClaim].[SrcLossPartyType]
AS

SELECT SourceSystemCode
	,LossPartyTypeCode
	,LossPartyTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, LossPartyTypeCode ORDER BY LossPartyTypeName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,loc.LossPartyTypeCode 
			,ISNULL(loc.LossPartyTypeDesc, '') AS LossPartyTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (LossOccurrence NVARCHAR(MAX) AS JSON) lev
		CROSS APPLY OPENJSON(lev.LossOccurrence) WITH (LossPartyTypeCode NVARCHAR(MAX), LossPartyTypeDesc NVARCHAR(MAX)) loc
		WHERE ISNULL(loc.LossPartyTypeCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
