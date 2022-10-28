USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcCancellationType_RETIRED]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [StgPolicy].[SrcCancellationType_RETIRED]
AS
SELECT distinct SourceSystemCode
	,CancellationTypeCode
	,CancellationTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, CancellationTypeCode ORDER BY CancellationTypeName DESC) AS rn
	FROM (
	    SELECT distinct hdr.SourceSystemCode
			,pol.CancellationTypeCode
			,ISNULL(pol.CancellationTypeDesc, '') AS CancellationTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (CancellationTypeCode NVARCHAR(MAX), CancellationTypeDesc NVARCHAR(MAX)) pol
		WHERE ISNULL(pol.CancellationTypeCode, '') <> ''
		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
