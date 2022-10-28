USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcSubrogationType]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [StgClaim].[SrcSubrogationType]
AS

SELECT SourceSystemCode
	,SubrogationTypeCode
	,SubrogationTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SubrogationTypeCode ORDER BY SubrogationTypeName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,sub.SubrogationTypeCode
			,ISNULL(sub.SubrogationTypeDesc, '') AS SubrogationTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (Subrogation NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.Subrogation) WITH (SubrogationTypeCode NVARCHAR(MAX), SubrogationTypeDesc NVARCHAR(max)) sub
		WHERE ISNULL(sub.SubrogationTypeCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
