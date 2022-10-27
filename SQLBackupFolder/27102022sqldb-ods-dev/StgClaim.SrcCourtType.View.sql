USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcCourtType]    Script Date: 27.10.2022 12:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcCourtType]
AS

SELECT SourceSystemCode
	,CourtTypeCode
	,CourtTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, CourtTypeCode ORDER BY CourtTypeName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,lgt.CourtTypeCode AS CourtTypeCode
			,ISNULL(lgt.CourtTypeDesc, '') AS CourtTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (Litigation NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.Litigation) WITH (CourtTypeCode NVARCHAR(MAX), CourtTypeDesc NVARCHAR(MAX)) lgt
		WHERE ISNULL(lgt.CourtTypeCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
