USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcLossOccurrenceType]    Script Date: 27.10.2022 12:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcLossOccurrenceType]
AS

SELECT SourceSystemCode
	,LossOccurrenceTypeCode
	,LossOccurrenceTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, LossOccurrenceTypeCode ORDER BY LossOccurrenceTypeName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,loc.LossOccurrenceTypeCode
			,ISNULL(loc.LossOccurrenceTypeDesc, '') AS LossOccurrenceTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (LossOccurrence NVARCHAR(MAX) AS JSON) loe
		CROSS APPLY OPENJSON(loe.LossOccurrence) WITH (LossOccurrenceTypeCode NVARCHAR(MAX), LossOccurrenceTypeDesc NVARCHAR(MAX)) loc

		WHERE ISNULL(loc.LossOccurrenceTypeCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
