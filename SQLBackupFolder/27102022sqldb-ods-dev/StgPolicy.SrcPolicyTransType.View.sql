USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcPolicyTransType]    Script Date: 27.10.2022 12:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [StgPolicy].[SrcPolicyTransType]
AS
SELECT SourceSystemCode
	,PolicyTransTypeCode
	,PolicyTransTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, PolicyTransTypeCode ORDER BY PolicyTransTypeName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,plt.PolicyTransTypeCode 
			,ISNULL(plt.PolicyTransTypeDesc, '') AS PolicyTransTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (PolicyTransTypeCode NVARCHAR(MAX), PolicyTransTypeDesc NVARCHAR(MAX)) plt		
		WHERE ISNULL(plt.PolicyTransTypeCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
