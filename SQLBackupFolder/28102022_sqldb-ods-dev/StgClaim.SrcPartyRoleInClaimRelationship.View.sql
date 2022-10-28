USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcPartyRoleInClaimRelationship]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE     View [StgClaim].[SrcPartyRoleInClaimRelationship]
AS

SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (
SELECT hdr.SourceSystemCode
	,convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,pti.PartyInfoSourceCode AS SourceCode
	,clm.ClaimSourceCode
	,null AS LossEventSourceCode
	,null AS LossOccurrenceSourceCode
	,ptr.PartyRoleCode
	,pti.PartyInfoSourceCode
	,1 AS IsActiveInd--always true
	,convert(DATETIME, '3000-01-01', 127) AS ExpirationDate--need  to find expiration and effective date to party role relationship
	,convert(DATETIME, '1900-01-01', 127) AS EffectiveDate--need to find expiration and effective date to party role relationship
	,line.IsValidInd

FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Claim NVARCHAR(max) AS JSON
		) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (		
		ClaimSourceCode NVARCHAR(MAX)
		,Claimant NVARCHAR(max) AS JSON
		) clm
CROSS APPLY OPENJSON(clm.Claimant) WITH (
		PartyInfo NVARCHAR(MAX) AS JSON
		) clt
CROSS APPLY OPENJSON(clt.PartyInfo) WITH (
		PartyInfoSourceCode NVARCHAR(MAX)
		,PartyRole NVARCHAR(MAX) AS JSON
		) pti
CROSS APPLY OPENJSON(pti.PartyRole) WITH (
		PartyRoleCode NVARCHAR(MAX)
		) ptr


UNION ALL


SELECT hdr.SourceSystemCode
	,convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,pti.PartyInfoSourceCode AS SourceCode
	,clm.ClaimSourceCode
	,loe.LossEventSourceCode AS LossEventSourceCode
	,loo.LossOccurrenceSourceCode AS LossOccurrenceSourceCode
	,ptr.PartyRoleCode
	,pti.PartyInfoSourceCode
	,1 AS IsActiveInd--always true
	,convert(DATETIME, '3000-01-01', 127) AS ExpirationDate--need  to find expiration and effective date to party role relationship
	,convert(DATETIME, '1900-01-01', 127) AS EffectiveDate--need to find expiration and effective date to party role relationship
	,line.IsValidInd

FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Claim NVARCHAR(max) AS JSON
		) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (		
		ClaimSourceCode NVARCHAR(MAX)
		,LossEvent NVARCHAR(max) AS JSON
		) clm
CROSS APPLY OPENJSON(clm.LossEvent) WITH (
		LossEventSourceCode NVARCHAR(MAX)
		,LossOccurrence NVARCHAR(MAX) AS JSON
		) loe
CROSS APPLY OPENJSON(loe.LossOccurrence) WITH (
		LossOccurrenceSourceCode NVARCHAR(MAX)
		,MiscParty NVARCHAR(MAX) AS JSON
		) loo
CROSS APPLY OPENJSON(loo.MiscParty) WITH (
		PartyInfo NVARCHAR(MAX) AS JSON
		) msc
CROSS APPLY OPENJSON(msc.PartyInfo) WITH (
		PartyInfoSourceCode NVARCHAR(MAX)
		,PartyRole NVARCHAR(MAX) AS JSON
		) pti
CROSS APPLY OPENJSON(pti.PartyRole) WITH (
		PartyRoleCode NVARCHAR(MAX)
		) ptr
		
UNION ALL

SELECT hdr.SourceSystemCode
	,convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,pti.PartyInfoSourceCode AS SourceCode
	,clm.ClaimSourceCode
	,loe.LossEventSourceCode AS LossEventSourceCode
	,null AS LossOccurrenceSourceCode
	,ptr.PartyRoleCode
	,pti.PartyInfoSourceCode
	,1 AS IsActiveInd--always true
	,convert(DATETIME, '3000-01-01', 127) AS ExpirationDate--need  to find expiration and effective date to party role relationship
	,convert(DATETIME, '1900-01-01', 127) AS EffectiveDate--need to find expiration and effective date to party role relationship
	,line.IsValidInd

FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Claim NVARCHAR(max) AS JSON
		) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (		
		ClaimSourceCode NVARCHAR(MAX)
		,LossEvent NVARCHAR(max) AS JSON
		) clm
CROSS APPLY OPENJSON(clm.LossEvent) WITH (
		LossEventSourceCode NVARCHAR(MAX)
		,MiscParty NVARCHAR(MAX) AS JSON
		) loe
CROSS APPLY OPENJSON(loe.MiscParty) WITH (
		PartyInfo NVARCHAR(MAX) AS JSON
		) msc
CROSS APPLY OPENJSON(msc.PartyInfo) WITH (
		PartyInfoSourceCode NVARCHAR(MAX)
		,PartyRole NVARCHAR(MAX) AS JSON
		) pti
CROSS APPLY OPENJSON(pti.PartyRole) WITH (
		PartyRoleCode NVARCHAR(MAX)
		) ptr

UNION ALL 

SELECT hdr.SourceSystemCode
	,convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,pti.PartyInfoSourceCode AS SourceCode
	,clm.ClaimSourceCode
	,null AS LossEventSourceCode
	,null AS LossOccurrenceSourceCode
	,ptr.PartyRoleCode
	,pti.PartyInfoSourceCode
	,1 AS IsActiveInd--always true
	,convert(DATETIME, '3000-01-01', 127) AS ExpirationDate--need  to find expiration and effective date to party role relationship
	,convert(DATETIME, '1900-01-01', 127) AS EffectiveDate--need to find expiration and effective date to party role relationship
	,line.IsValidInd

FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Claim NVARCHAR(max) AS JSON
		) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (		
		ClaimSourceCode NVARCHAR(MAX)
		,MiscParty NVARCHAR(max) AS JSON
		) clm
CROSS APPLY OPENJSON(clm.MiscParty) WITH (
		PartyInfo NVARCHAR(MAX) AS JSON
		) msc
CROSS APPLY OPENJSON(msc.PartyInfo) WITH (
		PartyInfoSourceCode NVARCHAR(MAX)
		,PartyRole NVARCHAR(MAX) AS JSON
		) pti
CROSS APPLY OPENJSON(pti.PartyRole) WITH (
		PartyRoleCode NVARCHAR(MAX)
		) ptr
	) AS tmp
		) AS tpl
	where tpl.rn = 1

GO
