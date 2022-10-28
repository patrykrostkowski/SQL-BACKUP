USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcCaseType]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcCaseType]
AS

SELECT SourceSystemCode
	,CaseTypeCode
	,CaseTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, CaseTypeCode ORDER BY CaseTypeName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,cdt.CaseTypeCode
			,ISNULL(cdt.CaseTypeDesc, '') AS CaseTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (Litigation NVARCHAR(MAX) AS JSON) clm	
		CROSS APPLY OPENJSON(clm.Litigation) WITH (CaseDetail NVARCHAR(MAX) AS JSON) lgt
		CROSS APPLY OPENJSON(lgt.CaseDetail) WITH (CaseTypeCode NVARCHAR(MAX), CaseTypeDesc NVARCHAR(MAX)) cdt
		WHERE ISNULL(cdt.CaseTypeCode, '') <> ''
		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
