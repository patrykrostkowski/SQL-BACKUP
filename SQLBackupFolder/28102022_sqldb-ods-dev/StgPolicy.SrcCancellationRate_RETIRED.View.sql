USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcCancellationRate_RETIRED]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [StgPolicy].[SrcCancellationRate_RETIRED]
AS
SELECT distinct SourceSystemCode
	,CancellationRateCode
	,CancellationRateName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, CancellationRateCode ORDER BY CancellationRateName DESC) AS rn
	FROM (
	    SELECT distinct hdr.SourceSystemCode
			,pol.CancellationRateCode
			,ISNULL(pol.CancellationRateDesc, '') AS CancellationRateName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (CancellationRateCode NVARCHAR(MAX), CancellationRateDesc NVARCHAR(MAX)) pol
		WHERE ISNULL(pol.CancellationRateCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
