USE [DataMagnifier]
GO
/****** Object:  View [StgPolicy].[SrcCancellationType]    Script Date: 10.11.2022 14:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[StgPolicy].[SrcCancellationType]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [StgPolicy].[SrcCancellationType]
AS
SELECT SourceSystemCode
	,CancellationTypeCode
	,CancellationTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, CancellationTypeCode ORDER BY CancellationTypeName DESC) AS rn
	FROM (
	    SELECT hdr.SourceSystemCode
			,pol.CancellationTypeCode
			,ISNULL(pol.CancellationTypeDesc, '''') AS CancellationTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (CancellationTypeCode NVARCHAR(MAX), CancellationTypeDesc NVARCHAR(MAX)) pol
		WHERE ISNULL(pol.CancellationTypeCode, '''') <> ''''
		) AS tmp
	) AS tpl' 
GO
