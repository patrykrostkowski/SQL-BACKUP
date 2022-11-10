USE [DataMagnifier]
GO
/****** Object:  View [StgPolicy].[SrcCancellationRate]    Script Date: 10.11.2022 14:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[StgPolicy].[SrcCancellationRate]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [StgPolicy].[SrcCancellationRate]
AS
SELECT SourceSystemCode
	,CancellationRateCode
	,CancellationRateName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, CancellationRateCode ORDER BY CancellationRateName DESC) AS rn
	FROM (
	    SELECT hdr.SourceSystemCode
			,pol.CancellationRateCode
			,ISNULL(pol.CancellationRateDesc, '''') AS CancellationRateName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (CancellationRateCode NVARCHAR(MAX), CancellationRateDesc NVARCHAR(MAX)) pol
		WHERE ISNULL(pol.CancellationRateCode, '''') <> ''''

		) AS tmp
	) AS tpl' 
GO
