USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcPolicyStatus]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcPolicyStatus]
AS

SELECT SourceSystemCode
	,PolicyStatusCode
	,PolicyStatusName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, PolicyStatusCode ORDER BY PolicyStatusName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,clm.PolicyStatusCode 
			,ISNULL(clm.PolicyStatusDesc, '') AS PolicyStatusName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (ClaimPolicy NVARCHAR(MAX) AS JSON) clp
		CROSS APPLY OPENJSON(clp.ClaimPolicy) WITH (PolicyStatusCode NVARCHAR(MAX), PolicyStatusDesc NVARCHAR(MAX)) clm
		WHERE ISNULL(clm.PolicyStatusCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
