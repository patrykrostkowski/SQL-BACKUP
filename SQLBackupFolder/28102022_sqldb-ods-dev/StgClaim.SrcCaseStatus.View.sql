USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcCaseStatus]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcCaseStatus]
AS

SELECT SourceSystemCode
	,CaseStatusCode
	,CaseStatusName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, CaseStatusCode ORDER BY CaseStatusName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,cdt.CaseStatusCode
			,ISNULL(cdt.CaseStatusDesc, '') AS CaseStatusName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (Litigation NVARCHAR(MAX) AS JSON) clm	
		CROSS APPLY OPENJSON(clm.Litigation) WITH (CaseDetail NVARCHAR(MAX) AS JSON) lgt
		CROSS APPLY OPENJSON(lgt.CaseDetail) WITH (CaseStatusCode NVARCHAR(MAX), CaseStatusDesc NVARCHAR(MAX)) cdt
		WHERE ISNULL(cdt.CaseStatusCode, '') <> ''
		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
