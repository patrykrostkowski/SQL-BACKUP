USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcAuditTransaction]    Script Date: 27.10.2022 12:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE   VIEW [StgPolicy].[SrcAuditTransaction]
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
		SELECT hdr.SourceSystemCode
			,pol.AuditTransactionCode
			,ISNULL(pol.AuditTransactionDesc, '') AS AuditTransactionName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				SourceSystemCode NVARCHAR(max)
				,Policy NVARCHAR(max) AS JSON
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (
				AuditTransactionCode NVARCHAR(max)
				,AuditTransactionDesc NVARCHAR(max)
				) pol
		WHERE 1 = 1
			AND ISNULL(pol.AuditTransactionCode, '') <> ''
		) tpl
	) trn
WHERE rn = 1

GO
