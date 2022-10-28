USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcPolicyType]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [StgClaim].[SrcPolicyType]
AS

SELECT SourceSystemCode
	,PolicyTypeCode
	,PolicyTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, PolicyTypeCode ORDER BY PolicyTypeName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,clp.PolicyTypeCode 
			,ISNULL(clp.PolicyTypeDesc, '') AS PolicyTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (ClaimPolicy NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.ClaimPolicy) WITH (PolicyTypeCode NVARCHAR(MAX), PolicyTypeDesc NVARCHAR(MAX)) clp
		WHERE ISNULL(clp.PolicyTypeCode, '') <> ''

	UNION ALL

		SELECT hdr.SourceSystemCode
			,clp.PolicyTypeCode 
			,ISNULL(clp.PolicyTypeDesc, '') AS PolicyTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (Claimant NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.Claimant) WITH (PolicyTypeCode NVARCHAR(MAX), PolicyTypeDesc NVARCHAR(MAX)) clp
		WHERE ISNULL(clp.PolicyTypeCode, '') <> ''



		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
