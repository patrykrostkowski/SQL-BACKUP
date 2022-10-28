USE [sqldb-ods-dev]
GO
/****** Object:  View [StgDM].[SrcDIMPolicyChangeType]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [StgDM].[SrcDIMPolicyChangeType]
AS

SELECT SourceSystemCode
	,PolicyChangeTypeCode
	,PolicyChangeTypeName
	,PolicyChangeTypeAbrv
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, PolicyChangeTypeCode ORDER BY PolicyChangeTypeName DESC) AS rn
	FROM (
		SELECT sst.SourceSystemCode
			,ptt.PolicyTransTypeCode AS PolicyChangeTypeCode						  
			,ISNULL(ptt.PolicyTransTypeName, '') AS PolicyChangeTypeName	
			,CAST(ptt.PolicyTransTypeCode AS VARCHAR(20)) AS PolicyChangeTypeAbrv
		FROM Typelist.PolicyTransType ptt												  
		JOIN Typelist.SourceSystem sst on sst.SourceSystemSK = ptt.SourceSystemSK
		WHERE ISNULL(ptt.PolicyTransTypeCode, '') <> ''
		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
