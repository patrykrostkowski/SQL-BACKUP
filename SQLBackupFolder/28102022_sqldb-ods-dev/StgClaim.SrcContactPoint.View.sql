USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcContactPoint]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE      VIEW [StgClaim].[SrcContactPoint]
AS

--LossEvent  ->  LossOccurrence -> MiscParty -> PartyInfo
-- phone
SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (

SELECT 
	hdr.SourceSystemCode	
	,pta.PartyPhoneSourceCode	AS SourceCode	
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,ptr.PartyRoleCode	
	,pti.PartyInfoSourceCode	
	,'Phone'	AS ContactPointTypeCode			
	,1 AS IsContactActiveInd
	,line.IsValidInd
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(MAX)
	,ProcessDateTime NVARCHAR(MAX)
	,Claim NVARCHAR(MAX) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (							
	LossEvent NVARCHAR(MAX) AS JSON
	) clm
CROSS APPLY OPENJSON(clm.LossEvent) WITH (
	LossOccurrence NVARCHAR(MAX) AS JSON
	) lse
CROSS APPLY OPENJSON(lse.LossOccurrence) WITH (
	MiscParty NVARCHAR(MAX) AS JSON
	) lso
CROSS APPLY OPENJSON(lso.MiscParty) WITH (
	PartyInfo NVARCHAR(MAX) AS JSON
)msp
CROSS APPLY OPENJSON(msp.PartyInfo) WITH (
	PartyRole NVARCHAR(MAX) AS JSON
	,PartyInfoSourceCode NVARCHAR(MAX)
	) pti
CROSS APPLY OPENJSON(pti.PartyRole) WITH (
	PartyRoleCode NVARCHAR(MAX)
	,PartyEmail NVARCHAR(MAX) AS JSON
	,PartyPhone NVARCHAR(MAX) AS JSON
	,PartyAddress NVARCHAR(MAX) AS JSON
	,PartyWeb NVARCHAR(MAX) AS JSON
	) ptr
CROSS APPLY OPENJSON(ptr.PartyPhone) WITH (
	PartyPhoneSourceCode NVARCHAR(MAX)
	) pta

UNION ALL

--Address
SELECT 
	hdr.SourceSystemCode	
	,pta.PartyAddressSourceCode	AS SourceCode	
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,ptr.PartyRoleCode	
	,pti.PartyInfoSourceCode	
	,'Address'	AS ContactPointTypeCode			
	,1 AS IsContactActiveInd
	,line.IsValidInd
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(MAX)
	,ProcessDateTime NVARCHAR(MAX)
	,Claim NVARCHAR(MAX) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (							
	LossEvent NVARCHAR(MAX) AS JSON
	) clm
CROSS APPLY OPENJSON(clm.LossEvent) WITH (
	LossOccurrence NVARCHAR(MAX) AS JSON
	) lse
CROSS APPLY OPENJSON(lse.LossOccurrence) WITH (
	MiscParty NVARCHAR(MAX) AS JSON
	) lso
CROSS APPLY OPENJSON(lso.MiscParty) WITH (
	PartyInfo NVARCHAR(MAX) AS JSON
)msp
CROSS APPLY OPENJSON(msp.PartyInfo) WITH (
	PartyRole NVARCHAR(MAX) AS JSON
	,PartyInfoSourceCode NVARCHAR(MAX)
	) pti
CROSS APPLY OPENJSON(pti.PartyRole) WITH (
	PartyRoleCode NVARCHAR(MAX)
	,PartyEmail NVARCHAR(MAX) AS JSON
	,PartyPhone NVARCHAR(MAX) AS JSON
	,PartyAddress NVARCHAR(MAX) AS JSON
	,PartyWeb NVARCHAR(MAX) AS JSON
	) ptr
CROSS APPLY OPENJSON(ptr.PartyAddress) WITH (
	PartyAddressSourceCode NVARCHAR(MAX)
	) pta

UNION ALL

--Email
SELECT 
	hdr.SourceSystemCode	
	,pta.PartyEmailSourceCode	AS SourceCode	
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,ptr.PartyRoleCode	
	,pti.PartyInfoSourceCode	
	,'Email'	AS ContactPointTypeCode			
	,1 AS IsContactActiveInd
	,line.IsValidInd
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(MAX)
	,ProcessDateTime NVARCHAR(MAX)
	,Claim NVARCHAR(MAX) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (							
	LossEvent NVARCHAR(MAX) AS JSON
	) clm
CROSS APPLY OPENJSON(clm.LossEvent) WITH (
	LossOccurrence NVARCHAR(MAX) AS JSON
	) lse
CROSS APPLY OPENJSON(lse.LossOccurrence) WITH (
	MiscParty NVARCHAR(MAX) AS JSON
	) lso
CROSS APPLY OPENJSON(lso.MiscParty) WITH (
	PartyInfo NVARCHAR(MAX) AS JSON
)msp
CROSS APPLY OPENJSON(msp.PartyInfo) WITH (
	PartyRole NVARCHAR(MAX) AS JSON
	,PartyInfoSourceCode NVARCHAR(MAX)
	) pti
CROSS APPLY OPENJSON(pti.PartyRole) WITH (
	PartyRoleCode NVARCHAR(MAX)
	,PartyEmail NVARCHAR(MAX) AS JSON
	,PartyPhone NVARCHAR(MAX) AS JSON
	,PartyAddress NVARCHAR(MAX) AS JSON
	,PartyWeb NVARCHAR(MAX) AS JSON
	) ptr
CROSS APPLY OPENJSON(ptr.PartyEmail) WITH (
	PartyEmailSourceCode NVARCHAR(MAX)
	) pta



UNION ALL

--Web
SELECT 
	hdr.SourceSystemCode	
	,pta.PartyWebSourceCode	AS SourceCode	
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,ptr.PartyRoleCode	
	,pti.PartyInfoSourceCode	
	,'Web'	AS ContactPointTypeCode			
	,1 AS IsContactActiveInd
	,line.IsValidInd
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(MAX)
	,ProcessDateTime NVARCHAR(MAX)
	,Claim NVARCHAR(MAX) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (							
	LossEvent NVARCHAR(MAX) AS JSON
	) clm
CROSS APPLY OPENJSON(clm.LossEvent) WITH (
	LossOccurrence NVARCHAR(MAX) AS JSON
	) lse
CROSS APPLY OPENJSON(lse.LossOccurrence) WITH (
	MiscParty NVARCHAR(MAX) AS JSON
	) lso
CROSS APPLY OPENJSON(lso.MiscParty) WITH (
	PartyInfo NVARCHAR(MAX) AS JSON
)msp
CROSS APPLY OPENJSON(msp.PartyInfo) WITH (
	PartyRole NVARCHAR(MAX) AS JSON
	,PartyInfoSourceCode NVARCHAR(MAX)
	) pti
CROSS APPLY OPENJSON(pti.PartyRole) WITH (
	PartyRoleCode NVARCHAR(MAX)
	,PartyEmail NVARCHAR(MAX) AS JSON
	,PartyPhone NVARCHAR(MAX) AS JSON
	,PartyAddress NVARCHAR(MAX) AS JSON
	,PartyWeb NVARCHAR(MAX) AS JSON
	) ptr
CROSS APPLY OPENJSON(ptr.PartyWeb) WITH (
	PartyWebSourceCode NVARCHAR(MAX)
	) pta





--------------------------------------------- 
--LossEvent -> MiscParty -> PartyInfo
UNION ALL

--PartyAddress
SELECT 
	hdr.SourceSystemCode	
	,pta.PartyAddressSourceCode	AS SourceCode	
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,ptr.PartyRoleCode	
	,pti.PartyInfoSourceCode	
	,'Address'	AS ContactPointTypeCode			
	,1 AS IsContactActiveInd
	,line.IsValidInd
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(MAX)
	,ProcessDateTime NVARCHAR(MAX)
	,Claim NVARCHAR(MAX) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (							
	LossEvent NVARCHAR(MAX) AS JSON
	) clm
CROSS APPLY OPENJSON(clm.LossEvent) WITH (
	MiscParty NVARCHAR(MAX) AS JSON
	) lse
CROSS APPLY OPENJSON(lse.MiscParty) WITH (
	PartyInfo NVARCHAR(MAX) AS JSON
)msp
CROSS APPLY OPENJSON(msp.PartyInfo) WITH (
	PartyRole NVARCHAR(MAX) AS JSON
	,PartyInfoSourceCode NVARCHAR(MAX)
	) pti
CROSS APPLY OPENJSON(pti.PartyRole) WITH (
	PartyRoleCode NVARCHAR(MAX)
	,PartyEmail NVARCHAR(MAX) AS JSON
	,PartyPhone NVARCHAR(MAX) AS JSON
	,PartyAddress NVARCHAR(MAX) AS JSON
	,PartyWeb NVARCHAR(MAX) AS JSON
	) ptr
CROSS APPLY OPENJSON(ptr.PartyAddress) WITH (
	PartyAddressSourceCode NVARCHAR(MAX)
	) pta


UNION ALL

--PartyEmail
SELECT 
	hdr.SourceSystemCode	
	,pta.PartyEmailSourceCode	AS SourceCode	
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,ptr.PartyRoleCode	
	,pti.PartyInfoSourceCode	
	,'Email'	AS ContactPointTypeCode			
	,1 AS IsContactActiveInd
	,line.IsValidInd
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(MAX)
	,ProcessDateTime NVARCHAR(MAX)
	,Claim NVARCHAR(MAX) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (							
	LossEvent NVARCHAR(MAX) AS JSON
	) clm
CROSS APPLY OPENJSON(clm.LossEvent) WITH (
	MiscParty NVARCHAR(MAX) AS JSON
	) lse
CROSS APPLY OPENJSON(lse.MiscParty) WITH (
	PartyInfo NVARCHAR(MAX) AS JSON
)msp
CROSS APPLY OPENJSON(msp.PartyInfo) WITH (
	PartyRole NVARCHAR(MAX) AS JSON
	,PartyInfoSourceCode NVARCHAR(MAX)
	) pti
CROSS APPLY OPENJSON(pti.PartyRole) WITH (
	PartyRoleCode NVARCHAR(MAX)
	,PartyEmail NVARCHAR(MAX) AS JSON
	,PartyPhone NVARCHAR(MAX) AS JSON
	,PartyAddress NVARCHAR(MAX) AS JSON
	,PartyWeb NVARCHAR(MAX) AS JSON
	) ptr
CROSS APPLY OPENJSON(ptr.PartyEmail) WITH (
	PartyEmailSourceCode NVARCHAR(MAX)
	) pta



UNION ALL


--PartyPhone
SELECT 
	hdr.SourceSystemCode	
	,pta.PartyPhoneSourceCode	AS SourceCode	
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,ptr.PartyRoleCode	
	,pti.PartyInfoSourceCode	
	,'Phone'	AS ContactPointTypeCode			
	,1 AS IsContactActiveInd
	,line.IsValidInd
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(MAX)
	,ProcessDateTime NVARCHAR(MAX)
	,Claim NVARCHAR(MAX) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (							
	LossEvent NVARCHAR(MAX) AS JSON
	) clm
CROSS APPLY OPENJSON(clm.LossEvent) WITH (
	MiscParty NVARCHAR(MAX) AS JSON
	) lse
CROSS APPLY OPENJSON(lse.MiscParty) WITH (
	PartyInfo NVARCHAR(MAX) AS JSON
)msp
CROSS APPLY OPENJSON(msp.PartyInfo) WITH (
	PartyRole NVARCHAR(MAX) AS JSON
	,PartyInfoSourceCode NVARCHAR(MAX)
	) pti
CROSS APPLY OPENJSON(pti.PartyRole) WITH (
	PartyRoleCode NVARCHAR(MAX)
	,PartyEmail NVARCHAR(MAX) AS JSON
	,PartyPhone NVARCHAR(MAX) AS JSON
	,PartyAddress NVARCHAR(MAX) AS JSON
	,PartyWeb NVARCHAR(MAX) AS JSON
	) ptr
CROSS APPLY OPENJSON(ptr.PartyPhone) WITH (
	PartyPhoneSourceCode NVARCHAR(MAX)
	) pta



UNION ALL

--PartyWeb
SELECT 
	hdr.SourceSystemCode	
	,pta.PartyWebSourceCode	AS SourceCode	
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,ptr.PartyRoleCode	
	,pti.PartyInfoSourceCode	
	,'Web'	AS ContactPointTypeCode			
	,1 AS IsContactActiveInd
	,line.IsValidInd
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(MAX)
	,ProcessDateTime NVARCHAR(MAX)
	,Claim NVARCHAR(MAX) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (							
	LossEvent NVARCHAR(MAX) AS JSON
	) clm
CROSS APPLY OPENJSON(clm.LossEvent) WITH (
	MiscParty NVARCHAR(MAX) AS JSON
	) lse
CROSS APPLY OPENJSON(lse.MiscParty) WITH (
	PartyInfo NVARCHAR(MAX) AS JSON
)msp
CROSS APPLY OPENJSON(msp.PartyInfo) WITH (
	PartyRole NVARCHAR(MAX) AS JSON
	,PartyInfoSourceCode NVARCHAR(MAX)
	) pti
CROSS APPLY OPENJSON(pti.PartyRole) WITH (
	PartyRoleCode NVARCHAR(MAX)
	,PartyEmail NVARCHAR(MAX) AS JSON
	,PartyPhone NVARCHAR(MAX) AS JSON
	,PartyAddress NVARCHAR(MAX) AS JSON
	,PartyWeb NVARCHAR(MAX) AS JSON
	) ptr
CROSS APPLY OPENJSON(ptr.PartyWeb) WITH (
	PartyWebSourceCode NVARCHAR(MAX)
	) pta



UNION ALL
---------------------------------------
-- Claimant -> PartyInfo

--PartyPhone
SELECT 
	hdr.SourceSystemCode	
	,pta.PartyPhoneSourceCode	AS SourceCode	
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,ptr.PartyRoleCode	
	,pti.PartyInfoSourceCode	
	,'Phone'	AS ContactPointTypeCode	
	,1 AS IsContactActiveInd
	,line.IsValidInd
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(MAX)
	,ProcessDateTime NVARCHAR(MAX)
	,Claim NVARCHAR(MAX) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (							
	Claimant NVARCHAR(MAX) AS JSON
	) clm
CROSS APPLY OPENJSON(clm.Claimant) WITH (
	PartyInfo NVARCHAR(MAX) AS JSON
	) clt
CROSS APPLY OPENJSON(clt.PartyInfo) WITH (
	PartyRole NVARCHAR(MAX) AS JSON
	,PartyInfoSourceCode NVARCHAR(MAX)
	) pti
CROSS APPLY OPENJSON(pti.PartyRole) WITH (
	PartyRoleCode NVARCHAR(MAX)
	,PartyEmail NVARCHAR(MAX) AS JSON
	,PartyPhone NVARCHAR(MAX) AS JSON
	,PartyAddress NVARCHAR(MAX) AS JSON
	,PartyWeb NVARCHAR(MAX) AS JSON
	) ptr
CROSS APPLY OPENJSON(ptr.PartyPhone) WITH (
	PartyPhoneSourceCode NVARCHAR(MAX)
	) pta



UNION ALL

--PartyAddress
SELECT 
	hdr.SourceSystemCode	
	,pta.PartyAddressSourceCode	AS SourceCode	
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,ptr.PartyRoleCode	
	,pti.PartyInfoSourceCode	
	,'Address'	AS ContactPointTypeCode	
	,1 AS IsContactActiveInd
	,line.IsValidInd
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(MAX)
	,ProcessDateTime NVARCHAR(MAX)
	,Claim NVARCHAR(MAX) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (							
	Claimant NVARCHAR(MAX) AS JSON
	) clm
CROSS APPLY OPENJSON(clm.Claimant) WITH (
	PartyInfo NVARCHAR(MAX) AS JSON
	) clt
CROSS APPLY OPENJSON(clt.PartyInfo) WITH (
	PartyRole NVARCHAR(MAX) AS JSON
	,PartyInfoSourceCode NVARCHAR(MAX)
	) pti
CROSS APPLY OPENJSON(pti.PartyRole) WITH (
	PartyRoleCode NVARCHAR(MAX)
	,PartyEmail NVARCHAR(MAX) AS JSON
	,PartyPhone NVARCHAR(MAX) AS JSON
	,PartyAddress NVARCHAR(MAX) AS JSON
	,PartyWeb NVARCHAR(MAX) AS JSON
	) ptr
CROSS APPLY OPENJSON(ptr.PartyAddress) WITH (
	PartyAddressSourceCode NVARCHAR(MAX)
	) pta


UNION ALL

--PartyEmail
SELECT 
	hdr.SourceSystemCode	
	,pta.PartyEmailSourceCode	AS SourceCode	
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,ptr.PartyRoleCode	
	,pti.PartyInfoSourceCode	
	,'Email'	AS ContactPointTypeCode	
	,1 AS IsContactActiveInd
	,line.IsValidInd
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(MAX)
	,ProcessDateTime NVARCHAR(MAX)
	,Claim NVARCHAR(MAX) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (							
	Claimant NVARCHAR(MAX) AS JSON
	) clm
CROSS APPLY OPENJSON(clm.Claimant) WITH (
	PartyInfo NVARCHAR(MAX) AS JSON
	) clt
CROSS APPLY OPENJSON(clt.PartyInfo) WITH (
	PartyRole NVARCHAR(MAX) AS JSON
	,PartyInfoSourceCode NVARCHAR(MAX)
	) pti
CROSS APPLY OPENJSON(pti.PartyRole) WITH (
	PartyRoleCode NVARCHAR(MAX)
	,PartyEmail NVARCHAR(MAX) AS JSON
	,PartyPhone NVARCHAR(MAX) AS JSON
	,PartyAddress NVARCHAR(MAX) AS JSON
	,PartyWeb NVARCHAR(MAX) AS JSON
	) ptr
CROSS APPLY OPENJSON(ptr.PartyEmail) WITH (
	PartyEmailSourceCode NVARCHAR(MAX)
	) pta


UNION ALL


--PartyWeb
SELECT 
	hdr.SourceSystemCode	
	,pta.PartyWebSourceCode	AS SourceCode	
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,ptr.PartyRoleCode	
	,pti.PartyInfoSourceCode	
	,'Web'	AS ContactPointTypeCode	
	,1 AS IsContactActiveInd
	,line.IsValidInd
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(MAX)
	,ProcessDateTime NVARCHAR(MAX)
	,Claim NVARCHAR(MAX) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (							
	Claimant NVARCHAR(MAX) AS JSON
	) clm
CROSS APPLY OPENJSON(clm.Claimant) WITH (
	PartyInfo NVARCHAR(MAX) AS JSON
	) clt
CROSS APPLY OPENJSON(clt.PartyInfo) WITH (
	PartyRole NVARCHAR(MAX) AS JSON
	,PartyInfoSourceCode NVARCHAR(MAX)
	) pti
CROSS APPLY OPENJSON(pti.PartyRole) WITH (
	PartyRoleCode NVARCHAR(MAX)
	,PartyEmail NVARCHAR(MAX) AS JSON
	,PartyPhone NVARCHAR(MAX) AS JSON
	,PartyAddress NVARCHAR(MAX) AS JSON
	,PartyWeb NVARCHAR(MAX) AS JSON
	) ptr
CROSS APPLY OPENJSON(ptr.PartyWeb) WITH (
	PartyWebSourceCode NVARCHAR(MAX)
	) pta


UNION ALL
---------------------------------------
-- MiscParty -> PartyInfo

--PartyPhone
SELECT 
	hdr.SourceSystemCode	
	,pta.PartyPhoneSourceCode	AS SourceCode	
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,ptr.PartyRoleCode	
	,pti.PartyInfoSourceCode	
	,'Phone'	AS ContactPointTypeCode
	,1 AS IsContactActiveInd
	,line.IsValidInd
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(MAX)
	,ProcessDateTime NVARCHAR(MAX)
	,Claim NVARCHAR(MAX) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (							
	MiscParty NVARCHAR(MAX) AS JSON
	) clm
CROSS APPLY OPENJSON(clm.MiscParty) WITH (
	PartyInfo NVARCHAR(MAX) AS JSON
	) msc
CROSS APPLY OPENJSON(msc.PartyInfo) WITH (
	PartyRole NVARCHAR(MAX) AS JSON
	,PartyInfoSourceCode NVARCHAR(MAX)
	) pti
CROSS APPLY OPENJSON(pti.PartyRole) WITH (
	PartyRoleCode NVARCHAR(MAX)
	,PartyEmail NVARCHAR(MAX) AS JSON
	,PartyPhone NVARCHAR(MAX) AS JSON
	,PartyAddress NVARCHAR(MAX) AS JSON
	,PartyWeb NVARCHAR(MAX) AS JSON
	) ptr
CROSS APPLY OPENJSON(ptr.PartyPhone) WITH (
	PartyPhoneSourceCode NVARCHAR(MAX)
	) pta

UNION ALL

--PartyAddress
SELECT 
	hdr.SourceSystemCode	
	,pta.PartyAddressSourceCode	AS SourceCode	
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,ptr.PartyRoleCode	
	,pti.PartyInfoSourceCode	
	,'Address'	AS ContactPointTypeCode
	,1 AS IsContactActiveInd
	,line.IsValidInd
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(MAX)
	,ProcessDateTime NVARCHAR(MAX)
	,Claim NVARCHAR(MAX) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (							
	MiscParty NVARCHAR(MAX) AS JSON
	) clm
CROSS APPLY OPENJSON(clm.MiscParty) WITH (
	PartyInfo NVARCHAR(MAX) AS JSON
	) msc
CROSS APPLY OPENJSON(msc.PartyInfo) WITH (
	PartyRole NVARCHAR(MAX) AS JSON
	,PartyInfoSourceCode NVARCHAR(MAX)
	) pti
CROSS APPLY OPENJSON(pti.PartyRole) WITH (
	PartyRoleCode NVARCHAR(MAX)
	,PartyEmail NVARCHAR(MAX) AS JSON
	,PartyPhone NVARCHAR(MAX) AS JSON
	,PartyAddress NVARCHAR(MAX) AS JSON
	,PartyWeb NVARCHAR(MAX) AS JSON
	) ptr
CROSS APPLY OPENJSON(ptr.PartyAddress) WITH (
	PartyAddressSourceCode NVARCHAR(MAX)
	) pta

UNION ALL

--PartyEmail
SELECT 
	hdr.SourceSystemCode	
	,pta.PartyEmailSourceCode	AS SourceCode	
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,ptr.PartyRoleCode	
	,pti.PartyInfoSourceCode	
	,'Email'	AS ContactPointTypeCode
	,1 AS IsContactActiveInd
	,line.IsValidInd
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(MAX)
	,ProcessDateTime NVARCHAR(MAX)
	,Claim NVARCHAR(MAX) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (							
	MiscParty NVARCHAR(MAX) AS JSON
	) clm
CROSS APPLY OPENJSON(clm.MiscParty) WITH (
	PartyInfo NVARCHAR(MAX) AS JSON
	) msc
CROSS APPLY OPENJSON(msc.PartyInfo) WITH (
	PartyRole NVARCHAR(MAX) AS JSON
	,PartyInfoSourceCode NVARCHAR(MAX)
	) pti
CROSS APPLY OPENJSON(pti.PartyRole) WITH (
	PartyRoleCode NVARCHAR(MAX)
	,PartyEmail NVARCHAR(MAX) AS JSON
	,PartyPhone NVARCHAR(MAX) AS JSON
	,PartyAddress NVARCHAR(MAX) AS JSON
	,PartyWeb NVARCHAR(MAX) AS JSON
	) ptr
CROSS APPLY OPENJSON(ptr.PartyEmail) WITH (
	PartyEmailSourceCode NVARCHAR(MAX)
	) pta

UNION ALL

--PartyWeb
SELECT 
	hdr.SourceSystemCode	
	,pta.PartyWebSourceCode	AS SourceCode	
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,ptr.PartyRoleCode	
	,pti.PartyInfoSourceCode	
	,'Web'	AS ContactPointTypeCode
	,1 AS IsContactActiveInd
	,line.IsValidInd
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(MAX)
	,ProcessDateTime NVARCHAR(MAX)
	,Claim NVARCHAR(MAX) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (							
	MiscParty NVARCHAR(MAX) AS JSON
	) clm
CROSS APPLY OPENJSON(clm.MiscParty) WITH (
	PartyInfo NVARCHAR(MAX) AS JSON
	) msc
CROSS APPLY OPENJSON(msc.PartyInfo) WITH (
	PartyRole NVARCHAR(MAX) AS JSON
	,PartyInfoSourceCode NVARCHAR(MAX)
	) pti
CROSS APPLY OPENJSON(pti.PartyRole) WITH (
	PartyRoleCode NVARCHAR(MAX)
	,PartyEmail NVARCHAR(MAX) AS JSON
	,PartyPhone NVARCHAR(MAX) AS JSON
	,PartyAddress NVARCHAR(MAX) AS JSON
	,PartyWeb NVARCHAR(MAX) AS JSON
	) ptr
CROSS APPLY OPENJSON(ptr.PartyWeb) WITH (
	PartyWebSourceCode NVARCHAR(MAX)
	) pta
		)tpl
	)tmp
	where tmp.rn = 1


GO
