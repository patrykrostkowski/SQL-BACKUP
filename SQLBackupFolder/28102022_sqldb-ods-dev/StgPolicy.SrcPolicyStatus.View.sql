USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcPolicyStatus]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--/****** Object:  View [StgPolicy].[SrcPolicyStatus]    Script Date: 29.06.2022 16:22:18 ******/
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO



CREATE VIEW [StgPolicy].[SrcPolicyStatus]
AS
SELECT SourceSystemCode
	,PolicyStatusCode
	,PolicyStatusName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, PolicyStatusCode ORDER BY PolicyStatusName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,pol.PolicyStatusCode 
			,ISNULL(pol.PolicyStatusDesc, '') AS PolicyStatusName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyStatusCode NVARCHAR(MAX), PolicyStatusDesc NVARCHAR(MAX)) pol		
		WHERE ISNULL(pol.PolicyStatusCode, '') <> ''
		 union all

		 SELECT hdr.SourceSystemCode
			,trn.policytransstatuscode as PolicyStatusCode 
			,ISNULL(pol.PolicyStatusDesc, '') AS PolicyStatusName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyStatusDesc NVARCHAR(MAX), PolicyTrans nvarchar(max) as json) pol		
		cross apply openjson(pol.policytrans) with (PolicyTransStatusCode nvarchar(max)) trn
		WHERE ISNULL(trn.PolicyTransStatusCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
