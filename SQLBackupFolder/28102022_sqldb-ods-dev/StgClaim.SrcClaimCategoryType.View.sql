USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcClaimCategoryType]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [StgClaim].[SrcClaimCategoryType]
AS
SELECT SourceSystemCode
	,ClaimCategoryTypeCode
	,ClaimCategoryTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, ClaimCategoryTypeCode ORDER BY ClaimCategoryTypeName DESC) AS rn
	FROM (
	   	SELECT hdr.SourceSystemCode
			,clm.ClaimCategoryTypeCode
			,ISNULL(clm.ClaimCategoryTypeDesc, '') AS ClaimCategoryTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (ClaimCategoryTypeCode NVARCHAR(MAX), ClaimCategoryTypeDesc NVARCHAR(MAX)) clm
		WHERE ISNULL(clm.ClaimCategoryTypeCode, '') <> ''


		) AS tmp
	) AS tpl
	where tpl.rn = 1



GO
