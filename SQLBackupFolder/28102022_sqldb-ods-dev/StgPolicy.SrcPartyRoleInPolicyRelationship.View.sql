USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcPartyRoleInPolicyRelationship]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE     View [StgPolicy].[SrcPartyRoleInPolicyRelationship]
AS
SELECT hdr.SourceSystemCode
	,convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,pti.PartyInfoSourceCode AS SourceCode 
	,pti.PartyInfoSourceCode 
	,ptr.PartyRoleCode 
	,pol.PolicySourceCode 
	,'' AS PolicyTransSourceCode--not found in the path in JSON 
	,null AS IsPrimaryObligeeInd --not found in JSON 
	,1 AS IsActiveInd--always true
	,convert(DATETIME, '3000-01-01', 127) AS ExpirationDate--need  to find expiration and effective date to party role relationship
	,convert(DATETIME, '1900-01-01', 127) AS EffectiveDate--needy to find expiration and effective date to party role relationship
	,line.IsValidInd
FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Policy NVARCHAR(max) AS JSON
		) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (
		PolicySourceCode NVARCHAR(MAX)
		,Account NVARCHAR(max) AS JSON
		) pol
CROSS APPLY OPENJSON(pol.Account) WITH (
		PartyInfo NVARCHAR(MAX) AS JSON
		) acc
CROSS APPLY OPENJSON(acc.PartyInfo) WITH (
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
	,pti.PartyInfoSourceCode 
	,ptr.PartyRoleCode
	,pol.PolicySourceCode
	,'' AS PolicyTransSourceCode--not found in the path in JSON 
	,null AS IsPrimaryObligeeInd --not found in JSON 
	,1 AS IsActiveInd--always true
	,convert(DATETIME, '3000-01-01', 127) AS ExpirationDate--need to find the way to find expiration and effective date to party role relationship
	,convert(DATETIME, '1900-01-01', 127) AS EffectiveDate--need to find the way to find expiration and effective date to party role relationship
	,line.IsValidInd
FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Policy NVARCHAR(max) AS JSON
		) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (
		PolicySourceCode NVARCHAR(MAX)
		,Agency NVARCHAR(max) AS JSON
		) pol
CROSS APPLY OPENJSON(pol.Agency) WITH (
		PartyInfo NVARCHAR(MAX) AS JSON
		) egc
CROSS APPLY OPENJSON(egc.PartyInfo) WITH (
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
	,pti.PartyInfoSourceCode 
	,ptr.PartyRoleCode 
	,pol.PolicySourceCode 
	,'' AS PolicyTransSourceCode--not found in the path in JSON 
	,null AS IsPrimaryObligeeInd --not found in JSON 
	,1 AS IsActiveInd--always true
	,convert(DATETIME, '3000-01-01', 127) AS ExpirationDate--need to find the way to find expiration and effective date to party role relationship
	,convert(DATETIME, '1900-01-01', 127) AS EffectiveDate--need to find the way to find expiration and effective date to party role relationship
	,line.IsValidInd
FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Policy NVARCHAR(max) AS JSON
		) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (
		PolicySourceCode NVARCHAR(MAX)
		,Insured NVARCHAR(max) AS JSON
		) pol
CROSS APPLY OPENJSON(pol.Insured) WITH (
		PartyInfo NVARCHAR(MAX) AS JSON
		) ins
CROSS APPLY OPENJSON(ins.PartyInfo) WITH (
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
	,pti.PartyInfoSourceCode 
	,ptr.PartyRoleCode
	,pol.PolicySourceCode
	,'' AS PolicyTransSourceCode--not found in the path in JSON 
	,null AS IsPrimaryObligeeInd --not found in JSON 
	,1 AS IsActiveInd--always true
	,convert(DATETIME, '3000-01-01', 127) AS ExpirationDate--need to find the way to find expiration and effective date to party role relationship
	,convert(DATETIME, '1900-01-01', 127) AS EffectiveDate--need to find the way to find expiration and effective date to party role relationship
	,line.IsValidInd
FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Policy NVARCHAR(max) AS JSON
		) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (
		PolicySourceCode NVARCHAR(MAX)
		,MiscParty NVARCHAR(max) AS JSON
		) pol
CROSS APPLY OPENJSON(pol.MiscParty) WITH (
		PartyInfo NVARCHAR(MAX) AS JSON
		) msp
CROSS APPLY OPENJSON(msp.PartyInfo) WITH (
		PartyInfoSourceCode NVARCHAR(MAX)
		,PartyRole NVARCHAR(MAX) AS JSON
		) pti
CROSS APPLY OPENJSON(pti.PartyRole) WITH (
		PartyRoleCode NVARCHAR(MAX)
		) ptr


		
GO
