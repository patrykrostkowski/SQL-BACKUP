USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcClaimPolicyAssociation]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE    VIEW [StgClaim].[SrcClaimPolicyAssociation]
AS
SELECT  
	hdr.SourceSystemCode
	,clm.ClaimSourceCode AS SourceCode
	,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,clp.ClaimPolicySourceCode
	,clp.PolicyNum
	,ssr.PolicySourceSystemCode
	,line.IsValidInd
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(max)
	,ProcessDateTime NVARCHAR(max)
	,Claim NVARCHAR(max) AS JSON
	) hdr
	CROSS APPLY OPENJSON(hdr.Claim) WITH (
	ClaimSourceCode NVARCHAR(max)
	,ClaimPolicy NVARCHAR(max)  AS JSON
	) clm
	CROSS APPLY OPENJSON(clm.ClaimPolicy) WITH (
	ClaimPolicySourceCode NVARCHAR(MAX)
	,PolicyNum NVARCHAR(MAX)
	)clp
	JOIN Config.SourceSystemRelationshipConfig ssr on ssr.ClaimSourceSystemCode = hdr.SourceSystemCode
GO
