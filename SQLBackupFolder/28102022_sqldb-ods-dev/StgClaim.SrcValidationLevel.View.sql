USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcValidationLevel]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE    VIEW [StgClaim].[SrcValidationLevel]
AS

SELECT SourceSystemCode
	,ValidationLevelCode
	,ValidationLevelName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, ValidationLevelCode ORDER BY ValidationLevelName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,loc.ValidationLevelCode
			,ISNULL(loc.ValidationLevelDesc, '') AS ValidationLevelName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm	
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (LossOccurrence NVARCHAR(MAX) AS JSON) lev
		CROSS APPLY OPENJSON(lev.LossOccurrence) WITH (ValidationLevelCode NVARCHAR(MAX), ValidationLevelDesc NVARCHAR(MAX)) loc
		WHERE ISNULL(loc.ValidationLevelCode, '') <> ''
		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
