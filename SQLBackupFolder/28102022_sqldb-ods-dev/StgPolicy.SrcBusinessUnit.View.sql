USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcBusinessUnit]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create VIEW [StgPolicy].[SrcBusinessUnit]
AS
SELECT SourceSystemCode
	,BusinessUnitCode
	,BusinessUnitName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, BusinessUnitCode ORDER BY BusinessUnitName DESC) AS rn
	FROM (
		SELECT distinct pol.SourceSystemCode
			,pol.BusinessUnitCode
			,ISNULL(pol.BusinessUnitDesc, '') AS BusinessUnitName
		FROM StgPolicy.SrcPolicy pol
		WHERE ISNULL(pol.BusinessUnitCode, '') <> ''

		UNION ALL

		SELECT distinct pol.SourceSystemCode
			,pol.BusinessUnitCode
			,ISNULL(pol.BusinessUnitDesc, '') AS BusinessUnitName
		FROM StgPolicy.SrcPolicyTrans pol
		WHERE ISNULL(pol.BusinessUnitCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
