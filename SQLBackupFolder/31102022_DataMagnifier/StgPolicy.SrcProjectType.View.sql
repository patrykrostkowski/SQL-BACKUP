USE [DataMagnifier]
GO
/****** Object:  View [StgPolicy].[SrcProjectType]    Script Date: 31.10.2022 11:55:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [StgPolicy].[SrcProjectType]
AS
SELECT SourceSystemCode
	,ProjectTypeCode
	,ProjectTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, ProjectTypeCode ORDER BY ProjectTypeName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,plt.ProjectTypeCode 
			,ISNULL(plt.ProjectTypeDesc, '') AS ProjectTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (ProjectTypeCode NVARCHAR(MAX), ProjectTypeDesc NVARCHAR(MAX)) plt		
		WHERE ISNULL(plt.ProjectTypeCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,pol.ProjectTypeCode 
			,ISNULL(pol.ProjectTypeDesc, '') AS ProjectTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (ProjectTypeCode NVARCHAR(MAX), ProjectTypeDesc NVARCHAR(MAX)) pol		
		WHERE ISNULL(pol.ProjectTypeCode, '') <> ''

		) AS tmp
	) AS tpl
GO
