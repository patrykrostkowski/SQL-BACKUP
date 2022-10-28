USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcPolicyType]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE   VIEW [StgPolicy].[SrcPolicyType]
AS
SELECT SourceSystemCode
	,PolicyTypeCode
	,PolicyTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, PolicyTypeCode ORDER BY PolicyTypeName DESC) AS rn
	FROM (
		SELECT distinct pol.SourceSystemCode
			,pol.PolicyTypeCode 
			,ISNULL(pol.PolicyTypeDesc, '') AS PolicyTypeName
		FROM StgPolicy.SrcPolicy pol		
		WHERE ISNULL(pol.PolicyTypeCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
