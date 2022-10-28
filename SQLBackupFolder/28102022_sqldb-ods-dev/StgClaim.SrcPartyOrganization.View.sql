USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcPartyOrganization]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE    VIEW [StgClaim].[SrcPartyOrganization]
AS

SELECT 
	tbl.SourceSystemCode
	,tbl.PartySKCode
	,tbl.SourceCode
	,CAST(tbl.ProcessDateTime AS DATETIME) AS ProcessDateTime
	,tbl.OwnershipTypeCode
	,cpt.PartyType
	,IsValidInd
FROM (
	SELECT hdr.SourceSystemCode
		,pti.PartyInfoSourceCode AS PartySKCode
		,pti.PartyInfoSourceCode AS SourceCode
		,hdr.ProcessDateTime
		,pti.OwnershipTypeCode
		,pti.PartyTypeCode
		,line.IsValidInd
	FROM StgClaim.ClaimData line
	CROSS APPLY OPENJSON(line.JsonLine) WITH (
			ProcessDateTime NVARCHAR(MAX)
			,Claim NVARCHAR(MAX) AS JSON
			,SourceSystemCode NVARCHAR(MAX)
			,SourceSystemDesc NVARCHAR(MAX)
			) hdr
	CROSS APPLY OPENJSON(hdr.Claim) WITH (
	Claimant NVARCHAR(MAX) AS JSON) clm
	CROSS APPLY OPENJSON(clm.Claimant) WITH (
	PartyInfo NVARCHAR(MAX) AS JSON) cmt
	CROSS APPLY OPENJSON(cmt.PartyInfo) WITH (
			PartyInfoSourceCode NVARCHAR(MAX)
			,PartyTypeCode NVARCHAR(MAX)
			,OwnershipTypeCode NVARCHAR(MAX)
			) pti

UNION ALL 

SELECT hdr.SourceSystemCode
		,pti.PartyInfoSourceCode AS PartySKCode
		,pti.PartyInfoSourceCode AS SourceCode
		,hdr.ProcessDateTime
		,pti.OwnershipTypeCode
		,pti.PartyTypeCode
		,line.IsValidInd
	FROM StgClaim.ClaimData line
	CROSS APPLY OPENJSON(line.JsonLine) WITH (
			ProcessDateTime NVARCHAR(MAX)
			,Claim NVARCHAR(MAX) AS JSON
			,SourceSystemCode NVARCHAR(MAX)
			,SourceSystemDesc NVARCHAR(MAX)
			) hdr
 CROSS APPLY OPENJSON(hdr.Claim) WITH (
 LossEvent NVARCHAR(MAX) AS JSON) clm
 CROSS APPLY OPENJSON(clm.LossEvent ) WITH (
 MiscParty NVARCHAR(MAX) AS JSON) loe
CROSS APPLY OPENJSON(loe.MiscParty ) WITH (
PartyInfo  NVARCHAR(MAX) AS JSON) mis
 CROSS APPLY OPENJSON(mis.PartyInfo ) WITH (
			PartyInfoSourceCode NVARCHAR(MAX)
			,PartyTypeCode NVARCHAR(MAX)
			,OwnershipTypeCode NVARCHAR(MAX)
			) pti

UNION ALL

SELECT hdr.SourceSystemCode
		,pti.PartyInfoSourceCode AS PartySKCode
		,pti.PartyInfoSourceCode AS SourceCode
		,hdr.ProcessDateTime
		,pti.OwnershipTypeCode
		,pti.PartyTypeCode
		,line.IsValidInd
	FROM StgClaim.ClaimData line
	CROSS APPLY OPENJSON(line.JsonLine) WITH (
			ProcessDateTime NVARCHAR(MAX)
			,Claim NVARCHAR(MAX) AS JSON
			,SourceSystemCode NVARCHAR(MAX)
			,SourceSystemDesc NVARCHAR(MAX)
			) hdr
 CROSS APPLY OPENJSON(hdr.Claim) WITH (
 LossEvent NVARCHAR(MAX) AS JSON) clm
 CROSS APPLY OPENJSON(clm.LossEvent ) WITH (
 LossOccurrence NVARCHAR(MAX) AS JSON) loe
 CROSS APPLY OPENJSON(loe.LossOccurrence) WITH (
 MiscParty NVARCHAR(MAX) AS JSON) loc
CROSS APPLY OPENJSON(loc.MiscParty ) WITH (
PartyInfo  NVARCHAR(MAX) AS JSON) mis
 CROSS APPLY OPENJSON(mis.PartyInfo ) WITH (
			PartyInfoSourceCode NVARCHAR(MAX)
			,PartyTypeCode NVARCHAR(MAX)
			,OwnershipTypeCode NVARCHAR(MAX)
			) pti
 UNION ALL 
  
  SELECT hdr.SourceSystemCode
		,pti.PartyInfoSourceCode AS PartySKCode
		,pti.PartyInfoSourceCode AS SourceCode
		,hdr.ProcessDateTime
		,pti.OwnershipTypeCode
		,pti.PartyTypeCode
		,line.IsValidInd
	FROM StgClaim.ClaimData line
	CROSS APPLY OPENJSON(line.JsonLine) WITH (
			ProcessDateTime NVARCHAR(MAX)
			,Claim NVARCHAR(MAX) AS JSON
			,SourceSystemCode NVARCHAR(MAX)
			,SourceSystemDesc NVARCHAR(MAX)
			) hdr
 CROSS APPLY OPENJSON(hdr.Claim) WITH (
 MiscParty NVARCHAR(MAX) AS JSON) clm
 CROSS APPLY OPENJSON(clm.MiscParty) WITH (
 PartyInfo  NVARCHAR(MAX) AS JSON) mis
 CROSS APPLY OPENJSON(mis.PartyInfo ) WITH (
			PartyInfoSourceCode NVARCHAR(MAX)
			,PartyTypeCode NVARCHAR(MAX)
			,OwnershipTypeCode NVARCHAR(MAX)
			) pti


	) tbl
JOIN Config.PartyType cpt ON cpt.sourcesystemcode = tbl.sourcesystemcode
	AND cpt.partytypecode = tbl.partytypecode
WHERE cpt.PartyType = 'Organisation' 
GO
