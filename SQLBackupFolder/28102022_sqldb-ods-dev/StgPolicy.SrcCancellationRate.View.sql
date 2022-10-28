USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcCancellationRate]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create   VIEW [StgPolicy].[SrcCancellationRate]
AS
SELECT distinct SourceSystemCode
	,CancellationRateCode
	,CancellationRateName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, CancellationRateCode ORDER BY CancellationRateName DESC) AS rn
	FROM (
	    SELECT distinct pol.SourceSystemCode
			,pol.CancellationRateCode
			,ISNULL(pol.CancellationRateDesc, '') AS CancellationRateName
		FROM StgPolicy.SrcPolicy pol
		WHERE ISNULL(pol.CancellationRateCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
