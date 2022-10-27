USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcLossEventType]    Script Date: 27.10.2022 12:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE   VIEW [StgClaim].[SrcLossEventType]
AS

SELECT SourceSystemCode
	,LossEventTypeCode
	,LossEventTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, LossEventTypeCode ORDER BY LossEventTypeName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,lev.LossEventTypeCode AS LossEventTypeCode
			,ISNULL(lev.LossEventTypeDesc, '') AS LossEventTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (LossEventTypeCode NVARCHAR(MAX), LossEventTypeDesc NVARCHAR(MAX)) lev
		WHERE ISNULL(lev.LossEventTypeCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
