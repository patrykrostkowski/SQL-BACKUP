USE [DataMagnifier]
GO
/****** Object:  View [StgPolicy].[SrcPolicyStatus]    Script Date: 10.11.2022 14:04:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

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

		) AS tmp
	) AS tpl
GO
