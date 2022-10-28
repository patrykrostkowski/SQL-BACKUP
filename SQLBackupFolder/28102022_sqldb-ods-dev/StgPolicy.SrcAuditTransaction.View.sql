USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcAuditTransaction]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




create     VIEW [StgPolicy].[SrcAuditTransaction]
AS
SELECT distinct SourceSystemCode
	,AuditTransactionCode
	,AuditTransactionName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (
			PARTITION BY SourceSystemCode
			,AuditTransactionCode ORDER BY AuditTransactionName DESC
			) AS rn
	FROM (
		SELECT distinct pol.SourceSystemCode
			,pol.AuditTransactionCode
			,ISNULL(pol.AuditTransactionDesc, '') AS AuditTransactionName
		FROM StgPolicy.SrcPolicy pol
		WHERE 1 = 1
			AND ISNULL(pol.AuditTransactionCode, '') <> ''
		) tpl
	) trn
WHERE rn = 1

GO
