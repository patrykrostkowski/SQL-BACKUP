USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcLineofBusiness]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [StgPolicy].[SrcLineofBusiness]
AS
SELECT SourceSystemCode
	,LineofBusinessCode
	,LineofBusinessName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, LineofBusinessCode ORDER BY LineofBusinessName DESC) AS rn
	FROM (		
		SELECT hdr.SourceSystemCode
			,lob.LineOfBusinessCode
			,ISNULL(lob.LineOfBusinessDesc, '') AS LineofBusinessName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (LineOfBusinessCode NVARCHAR(MAX), LineOfBusinessDesc NVARCHAR(MAX)) lob
		WHERE ISNULL(lob.LineOfBusinessCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
