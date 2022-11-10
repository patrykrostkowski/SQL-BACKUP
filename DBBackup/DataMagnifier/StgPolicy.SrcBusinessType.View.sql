USE [DataMagnifier]
GO
/****** Object:  View [StgPolicy].[SrcBusinessType]    Script Date: 10.11.2022 14:04:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [StgPolicy].[SrcBusinessType]
AS
SELECT SourceSystemCode
	,BusinessTypeCode
	,BusinessTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, BusinessTypeCode ORDER BY BusinessTypeName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,pol.BusinessTypeCode
			,ISNULL(pol.BusinessTypeDesc, '') AS BusinessTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (BusinessTypeCode NVARCHAR(MAX), BusinessTypeDesc NVARCHAR(MAX)) pol
		WHERE ISNULL(pol.BusinessTypeCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,plt.BusinessTypeCode
			,ISNULL(plt.BusinessTypeDesc, '') AS BusinessTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (BusinessTypeCode NVARCHAR(MAX), BusinessTypeDesc NVARCHAR(MAX)) plt
		WHERE ISNULL(plt.BusinessTypeCode, '') <> ''
		) AS tmp
	) AS tpl
GO
