USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcPartyPerson]    Script Date: 27.10.2022 12:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE   VIEW [StgClaim].[SrcPartyPerson]
AS

SELECT 
	tbl.SourceSystemCode
	,tbl.PartySKCode
	,tbl.SourceCode
	,CAST(tbl.ProcessDateTime AS DATETIME) AS ProcessDateTime
	,tbl.DriverLicenseStateCode
	,cpt.PartyType
	,IsValidInd
FROM (
	SELECT hdr.SourceSystemCode
		,pti.PartyInfoSourceCode AS PartySKCode
		,pti.PartyInfoSourceCode AS SourceCode
		,hdr.ProcessDateTime
		,pti.DriverLicenseStateCode
		,pti.PartyTypeCode
		,line.IsValidInd
	FROM StgClaim.ClaimData line
	CROSS APPLY OPENJSON(line.JsonLine) WITH (
			ProcessDateTime NVARCHAR(MAX)
			,Claim NVARCHAR(MAX) AS JSON
			,SourceSystemCode NVARCHAR(MAX)
			,SourceSystemDesc NVARCHAR(MAX)
			) hdr
	CROSS APPLY OPENJSON(hdr.Claim) WITH (Claimant NVARCHAR(MAX) AS JSON) pol
	CROSS APPLY OPENJSON(pol.Claimant) WITH (PartyInfo NVARCHAR(MAX) AS JSON) agc
	CROSS APPLY OPENJSON(agc.PartyInfo) WITH (
			PartyInfoSourceCode NVARCHAR(MAX)
			,PartyTypeCode NVARCHAR(MAX)
			,DriverLicenseStateCode NVARCHAR(MAX)
			) pti
	) tbl
JOIN Config.PartyType cpt ON cpt.sourcesystemcode = tbl.sourcesystemcode
	AND cpt.partytypecode = tbl.partytypecode
WHERE cpt.PartyType = 'Person'
GO
