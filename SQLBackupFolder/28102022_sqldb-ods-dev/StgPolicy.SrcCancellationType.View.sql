USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcCancellationType]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create   VIEW [StgPolicy].[SrcCancellationType]
AS
SELECT distinct SourceSystemCode
	,CancellationTypeCode
	,CancellationTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, CancellationTypeCode ORDER BY CancellationTypeName DESC) AS rn
	FROM (
	    SELECT distinct pol.SourceSystemCode
			,pol.CancellationTypeCode
			,ISNULL(pol.CancellationTypeDesc, '') AS CancellationTypeName
		FROM StgPolicy.SrcPolicy pol
		WHERE ISNULL(pol.CancellationTypeCode, '') <> ''
		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
