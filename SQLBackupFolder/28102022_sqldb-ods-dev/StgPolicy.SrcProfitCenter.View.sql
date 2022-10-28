USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcProfitCenter]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [StgPolicy].[SrcProfitCenter]
AS
SELECT SourceSystemCode
	,ProfitCenterCode
	,ProfitCenterName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, ProfitCenterCode ORDER BY ProfitCenterName DESC) AS rn
	FROM (
	   	SELECT hdr.SourceSystemCode
			,lob.ProfitCenterCode
			,ISNULL(lob.ProfitCenterDesc, '') AS ProfitCenterName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol	
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (ProfitCenterCode NVARCHAR(MAX), ProfitCenterDesc NVARCHAR(MAX)) lob
		WHERE ISNULL(lob.ProfitCenterCode, '') <> ''


		) AS tmp
	) AS tpl
	where tpl.rn = 1



GO
