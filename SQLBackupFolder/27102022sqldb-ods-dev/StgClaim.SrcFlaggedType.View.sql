USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcFlaggedType]    Script Date: 27.10.2022 12:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcFlaggedType]
AS

SELECT SourceSystemCode
	,FlaggedTypeCode
	,FlaggedTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, FlaggedTypeCode ORDER BY FlaggedTypeName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,clm.FlaggedTypeCode 
			,ISNULL(clm.FlaggedTypeDesc, '') AS FlaggedTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (FlaggedTypeCode NVARCHAR(MAX), FlaggedTypeDesc NVARCHAR(MAX)) clm
		WHERE ISNULL(clm.FlaggedTypeCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
