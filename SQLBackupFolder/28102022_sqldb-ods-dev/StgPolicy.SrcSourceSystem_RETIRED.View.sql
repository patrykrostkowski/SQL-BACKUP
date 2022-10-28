USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcSourceSystem_RETIRED]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [StgPolicy].[SrcSourceSystem_RETIRED]
AS
SELECT SourceSystemCode
	,SourceSystemName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode ORDER BY SourceSystemName DESC) AS rn
	FROM (
	   	SELECT hdr.SourceSystemCode
			,ISNULL(hdr.SourceSystemDesc,hdr.SourceSystemCode) AS SourceSystemName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr

		) AS tmp

	UNION ALL

	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode ORDER BY SourceSystemName DESC) AS rn
	FROM (
	   	SELECT hdr.SourceSystemCode
			,ISNULL(hdr.SourceSystemDesc,hdr.SourceSystemCode) AS SourceSystemName
		FROM StgPolicy.EarningsData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr

		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
