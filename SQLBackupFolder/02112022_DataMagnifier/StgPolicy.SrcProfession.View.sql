USE [DataMagnifier]
GO
/****** Object:  View [StgPolicy].[SrcProfession]    Script Date: 02.11.2022 14:07:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [StgPolicy].[SrcProfession]
AS
SELECT SourceSystemCode
	,ProfessionCode
	,ProfessionName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, ProfessionCode ORDER BY ProfessionName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,plt.ProfessionCode 
			,ISNULL(plt.ProfessionDesc, '') AS ProfessionName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (ProfessionCode NVARCHAR(MAX), ProfessionDesc NVARCHAR(MAX)) plt		
		WHERE ISNULL(plt.ProfessionCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,pol.ProfessionCode 
			,ISNULL(pol.ProfessionDesc, '') AS ProfessionName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (ProfessionCode NVARCHAR(MAX), ProfessionDesc NVARCHAR(MAX)) pol		
		WHERE ISNULL(pol.ProfessionCode, '') <> ''

		) AS tmp
	) AS tpl
GO
