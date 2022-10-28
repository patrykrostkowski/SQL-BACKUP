USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcContactPointEmail]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE    VIEW [StgPolicy].[SrcContactPointEmail]
AS

SELECT 
	hdr.SourceSystemCode	
	,pte.PartyEmailSourceCode	AS SourceCode
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,pti.PartyInfoSourceCode
	,ptr.PartyRoleCode
	,pte.EmailAddress
	,pte.IsPrimaryInd
	,line.IsValidInd
FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(MAX)
	,ProcessDateTime NVARCHAR(MAX)
	,Policy NVARCHAR(MAX) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (
	Account NVARCHAR(MAX) AS JSON
	) pol
CROSS APPLY OPENJSON(pol.Account) WITH (
	PartyInfo NVARCHAR(MAX) AS JSON
	) acc
CROSS APPLY OPENJSON(acc.PartyInfo) WITH (
	PartyRole NVARCHAR(MAX) AS JSON
	,PartyInfoSourceCode NVARCHAR(MAX)
	) pti
CROSS APPLY OPENJSON(pti.PartyRole) WITH (
	PartyEmail NVARCHAR(MAX) AS JSON
	,PartyRoleCode NVARCHAR(MAX)
	) ptr
CROSS APPLY OPENJSON(ptr.PartyEmail) WITH (
	PartyEmailSourceCode NVARCHAR(MAX)
	,ContactPointSK int
	,EmailAddress NVARCHAR(MAX)
	,IsPrimaryInd tinyint
	) pte

UNION ALL

SELECT 
	hdr.SourceSystemCode	
	,pte.PartyEmailSourceCode	AS SourceCode
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,pti.PartyInfoSourceCode
	,ptr.PartyRoleCode
	,pte.EmailAddress
	,pte.IsPrimaryInd
	,line.IsValidInd
FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(MAX)
	,ProcessDateTime NVARCHAR(MAX)
	,Policy NVARCHAR(MAX) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (
	Agency NVARCHAR(MAX) AS JSON
	) pol
CROSS APPLY OPENJSON(pol.Agency) WITH (
	PartyInfo NVARCHAR(MAX) AS JSON
	) agc
CROSS APPLY OPENJSON(agc.PartyInfo) WITH (
	PartyRole NVARCHAR(MAX) AS JSON
	,PartyInfoSourceCode NVARCHAR(MAX)
	) pti
CROSS APPLY OPENJSON(pti.PartyRole) WITH (
	PartyEmail NVARCHAR(MAX) AS JSON
	,PartyRoleCode NVARCHAR(MAX)
	) ptr
CROSS APPLY OPENJSON(ptr.PartyEmail) WITH (
	PartyEmailSourceCode NVARCHAR(MAX)
	,ContactPointSK int
	,EmailAddress NVARCHAR(MAX)
	,IsPrimaryInd tinyint
	) pte

UNION ALL

SELECT 
	hdr.SourceSystemCode	
	,pte.PartyEmailSourceCode	AS SourceCode
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,pti.PartyInfoSourceCode
	,ptr.PartyRoleCode
	,pte.EmailAddress
	,pte.IsPrimaryInd
	,line.IsValidInd
FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(MAX)
	,ProcessDateTime NVARCHAR(MAX)
	,Policy NVARCHAR(MAX) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (
	Insured NVARCHAR(MAX) AS JSON
	) pol
CROSS APPLY OPENJSON(pol.Insured) WITH (
	PartyInfo NVARCHAR(MAX) AS JSON
	) ins
CROSS APPLY OPENJSON(ins.PartyInfo) WITH (
	PartyRole NVARCHAR(MAX) AS JSON
	,PartyInfoSourceCode NVARCHAR(MAX)
	) pti
CROSS APPLY OPENJSON(pti.PartyRole) WITH (
	PartyEmail NVARCHAR(MAX) AS JSON
	,PartyRoleCode NVARCHAR(MAX)
	) ptr
CROSS APPLY OPENJSON(ptr.PartyEmail) WITH (
	PartyEmailSourceCode NVARCHAR(MAX)
	,ContactPointSK int
	,EmailAddress NVARCHAR(MAX)
	,IsPrimaryInd tinyint
	) pte

UNION ALL

SELECT 
	hdr.SourceSystemCode	
	,pte.PartyEmailSourceCode	AS SourceCode
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,pti.PartyInfoSourceCode
	,ptr.PartyRoleCode
	,pte.EmailAddress
	,pte.IsPrimaryInd
	,line.IsValidInd
FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(MAX)
	,ProcessDateTime NVARCHAR(MAX)
	,Policy NVARCHAR(MAX) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (
	MiscParty NVARCHAR(MAX) AS JSON
	) pol
CROSS APPLY OPENJSON(pol.MiscParty) WITH (
	PartyInfo NVARCHAR(MAX) AS JSON
	) msp
CROSS APPLY OPENJSON(msp.PartyInfo) WITH (
	PartyRole NVARCHAR(MAX) AS JSON
	,PartyInfoSourceCode NVARCHAR(MAX)
	) pti
CROSS APPLY OPENJSON(pti.PartyRole) WITH (
	PartyEmail NVARCHAR(MAX) AS JSON
	,PartyRoleCode NVARCHAR(MAX)
	) ptr
CROSS APPLY OPENJSON(ptr.PartyEmail) WITH (
	PartyEmailSourceCode NVARCHAR(MAX)
	,ContactPointSK int
	,EmailAddress NVARCHAR(MAX)
	,IsPrimaryInd tinyint
	) pte
GO
