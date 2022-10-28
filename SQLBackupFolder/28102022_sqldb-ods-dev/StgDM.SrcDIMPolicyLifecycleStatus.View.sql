USE [sqldb-ods-dev]
GO
/****** Object:  View [StgDM].[SrcDIMPolicyLifecycleStatus]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [StgDM].[SrcDIMPolicyLifecycleStatus]
AS

SELECT SourceSystemCode
	,PolicyLifecycleStatusCode
	,PolicyLifecycleStatusName
	,PolicyLifeCycleStatusAbrv
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, PolicyLifeCycleStatusCode ORDER BY PolicyLifeCycleStatusName DESC) AS rn
	FROM (
		SELECT sst.SourceSystemCode
			,pst.PolicyStatusCode AS PolicyLifeCycleStatusCode
			,ISNULL(pst.PolicyStatusName, '') AS PolicyLifeCycleStatusName
			,CAST(pst.PolicyStatusCode AS VARCHAR(20)) AS PolicyLifeCycleStatusAbrv
		FROM Typelist.PolicyStatus pst
		JOIN Typelist.SourceSystem sst on sst.SourceSystemSK = pst.SourceSystemSK
		WHERE ISNULL(pst.PolicyStatusCode, '') <> ''
		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
