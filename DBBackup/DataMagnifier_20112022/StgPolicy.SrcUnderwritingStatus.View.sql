USE [DataMagnifier]
GO
/****** Object:  View [StgPolicy].[SrcUnderwritingStatus]    Script Date: 20.11.2022 19:02:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [StgPolicy].[SrcUnderwritingStatus]
AS
SELECT SourceSystemCode
	,UnderwritingStatusCode
	,UnderwritingStatusName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, UnderwritingStatusCode ORDER BY UnderwritingStatusName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,plt.UnderwritingStatusCode 
			,ISNULL(plt.UnderwritingStatusDesc, '') AS UnderwritingStatusName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (UnderwritingStatusCode NVARCHAR(MAX), UnderwritingStatusDesc NVARCHAR(MAX)) plt		
		WHERE ISNULL(plt.UnderwritingStatusCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,pol.UnderwritingStatusCode 
			,ISNULL(pol.UnderwritingStatusDesc, '') AS UnderwritingStatusName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (UnderwritingStatusCode NVARCHAR(MAX), UnderwritingStatusDesc NVARCHAR(MAX)) pol
		WHERE ISNULL(pol.UnderwritingStatusCode, '') <> ''

		) AS tmp
	) AS tpl
GO
