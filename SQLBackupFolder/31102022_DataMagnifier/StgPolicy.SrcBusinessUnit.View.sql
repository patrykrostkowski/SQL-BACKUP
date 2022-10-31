USE [DataMagnifier]
GO
/****** Object:  View [StgPolicy].[SrcBusinessUnit]    Script Date: 31.10.2022 12:09:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [StgPolicy].[SrcBusinessUnit]
AS
SELECT SourceSystemCode
	,BusinessUnitCode
	,BusinessUnitName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, BusinessUnitCode ORDER BY BusinessUnitName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,pol.BusinessUnitCode
			,ISNULL(pol.BusinessUnitDesc, '') AS BusinessUnitName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (BusinessUnitCode NVARCHAR(MAX), BusinessUnitDesc NVARCHAR(MAX)) pol
		WHERE ISNULL(pol.BusinessUnitCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,plt.BusinessUnitCode
			,ISNULL(plt.BusinessUnitDesc, '') AS BusinessUnitName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (BusinessUnitCode NVARCHAR(MAX), BusinessUnitDesc NVARCHAR(MAX)) plt
		WHERE ISNULL(plt.BusinessUnitCode, '') <> ''

		) AS tmp
	) AS tpl
GO
