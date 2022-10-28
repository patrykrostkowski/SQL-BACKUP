USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcSourceSystem]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcSourceSystem]
AS

SELECT SourceSystemCode
	,SourceSystemName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode ORDER BY SourceSystemName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,ISNULL(hdr.SourceSystemDesc, '') AS SourceSystemName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		WHERE ISNULL(hdr.SourceSystemCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
