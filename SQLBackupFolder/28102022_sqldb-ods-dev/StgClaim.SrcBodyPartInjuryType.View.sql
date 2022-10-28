USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcBodyPartInjuryType]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [StgClaim].[SrcBodyPartInjuryType]
AS
SELECT SourceSystemCode
	,BodyPartInjuryTypeCode
	,BodyPartInjuryTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, BodyPartInjuryTypeCode ORDER BY BodyPartInjuryTypeName DESC) AS rn
	FROM (
	   	SELECT hdr.SourceSystemCode
			,lei.BodyPartInjuryTypeCode
			,ISNULL(lei.BodyPartInjuryTypeDesc, '') AS BodyPartInjuryTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm	
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (LossEventInjury NVARCHAR(MAX) AS JSON) lev
		CROSS APPLY OPENJSON(lev.LossEventInjury) WITH (BodyPartInjuryTypeDesc NVARCHAR(MAX), BodyPartInjuryTypeCode NVARCHAR(MAX)) lei
		WHERE ISNULL(lei.BodyPartInjuryTypeCode, '') <> ''


		) AS tmp
	) AS tpl
	where tpl.rn = 1




GO
