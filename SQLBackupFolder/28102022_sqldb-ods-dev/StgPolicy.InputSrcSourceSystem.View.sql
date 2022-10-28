USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[InputSrcSourceSystem]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE   VIEW [StgPolicy].[InputSrcSourceSystem]
AS
SELECT SourceSystemCode
	,SourceSystemName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode ORDER BY SourceSystemName DESC) AS rn
	FROM (
	   	SELECT distinct hdr.SourceSystemCode
			,ISNULL(hdr.SourceSystemDesc,hdr.SourceSystemCode) AS SourceSystemName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(255)
				,SourceSystemDesc NVARCHAR(255)
				) hdr

		UNION ALL

	   	SELECT distinct hdr.SourceSystemCode
			,ISNULL(hdr.SourceSystemDesc,hdr.SourceSystemCode) AS SourceSystemName
		FROM StgPolicy.EarningsData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(255)
				,SourceSystemDesc NVARCHAR(255)
				) hdr

		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
