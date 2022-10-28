USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcAuditTransaction]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [StgClaim].[SrcAuditTransaction]
AS
SELECT SourceSystemCode
	,AuditTransactionCode
	,AuditTransactionName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, AuditTransactionCode ORDER BY AuditTransactionName DESC) AS rn
	FROM (
	   	SELECT hdr.SourceSystemCode
			,cla.AuditTransactionCode
			,ISNULL(cla.AuditTransactionDesc, '') AS AuditTransactionName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (Claimant NVARCHAR(MAX) AS JSON) clm			
		CROSS APPLY OPENJSON(clm.Claimant) WITH (ClaimAudit NVARCHAR(MAX) AS JSON) clt
		CROSS APPLY OPENJSON(clt.ClaimAudit) WITH (
				AuditTransactionCode NVARCHAR(MAX)
				,AuditTransactionDesc NVARCHAR(MAX)
			) cla
		WHERE ISNULL(cla.AuditTransactionCode, '') <> ''


		) AS tmp
	) AS tpl
	where tpl.rn = 1




GO
