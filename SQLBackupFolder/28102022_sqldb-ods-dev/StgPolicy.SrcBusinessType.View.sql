USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcBusinessType]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create   VIEW [StgPolicy].[SrcBusinessType]
AS
SELECT SourceSystemCode
	,BusinessTypeCode
	,BusinessTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, BusinessTypeCode ORDER BY BusinessTypeName DESC) AS rn
	FROM (
		SELECT DISTINCT pol.SourceSystemCode
			,pol.BusinessTypeCode
			,ISNULL(pol.BusinessTypeDesc, '') AS BusinessTypeName
		FROM StgPolicy.SrcPolicy pol
		WHERE ISNULL(pol.BusinessTypeCode, '') <> ''

		UNION ALL

		SELECT DISTINCT pol.SourceSystemCode
			,pol.BusinessTypeCode
			,ISNULL(pol.BusinessTypeDesc, '') AS BusinessTypeName
		FROM StgPolicy.SrcPolicyTrans pol
		WHERE ISNULL(pol.BusinessTypeCode, '') <> ''
		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
