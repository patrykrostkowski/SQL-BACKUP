USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcContactPointPhone]    Script Date: 27.10.2022 12:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE    VIEW [StgClaim].[SrcContactPointPhone]
AS
SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (

SELECT  
	hdr.SourceSystemCode
	,convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,ptp.PartyPhoneSourceCode AS SourceCode
	,ptr.PartyRoleCode--field needed to match with ContactPoin table(ContactPointSK)typelist.partyRole
	,pti.PartyInfoSourceCode--field needed to match with ContactPoin table(ContactPointSK)partyMaster
	,ptp.PhoneNum
	,ptp.PhoneExtension
	,ptp.PhoneTypeCode
	,ptp.IsPrimaryInd
	,line.IsValidInd

	FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Claim NVARCHAR(max) AS JSON
		) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (
		Claimant NVARCHAR(max) AS JSON
		) clm
		CROSS APPLY OPENJSON(clm.Claimant) WITH (
		PartyInfo NVARCHAR(max) AS JSON
		) cmt
		CROSS APPLY OPENJSON(cmt.PartyInfo) WITH (
		PartyInfoSourceCode NVARCHAR(max)
		,PartyRole NVARCHAR(max) AS JSON
		) pti
		CROSS APPLY OPENJSON(pti.PartyRole) WITH (
		PartyRoleCode NVARCHAR(max)
		,PartyPhone NVARCHAR(max) AS JSON
		) ptr
		CROSS APPLY OPENJSON(ptr.PartyPhone) WITH (
		PartyPhoneSourceCode NVARCHAR(max)
		,PhoneNum NVARCHAR(max)
		,PhoneExtension NVARCHAR(max)
		,PhoneTypeCode NVARCHAR(max)
		,IsPrimaryInd INT
		) ptp

UNION ALL

SELECT    
	hdr.SourceSystemCode
        ,Convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
		,ptp.PartyPhoneSourceCode AS SourceCode
	,ptr.PartyRoleCode--field needed to match with ContactPoin table(ContactPointSK)typelist.partyRole
	,pti.PartyInfoSourceCode--field needed to match with ContactPoin table(ContactPointSK)partyMaster
	,ptp.PhoneNum
	,ptp.PhoneExtension
	,ptp.PhoneTypeCode
	,ptp.IsPrimaryInd
	,line.IsValidInd
	FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
     SourceSystemCode NVARCHAR(max)
	,ProcessDateTime  NVARCHAR(max)
	,Claim NVARCHAR(max) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (
     MiscParty NVARCHAR(max) AS JSON 
	 ) clm
CROSS APPLY OPENJSON(clm.MiscParty) WITH (
     PartyInfo NVARCHAR(max) AS JSON  
	 ) msp
CROSS APPLY OPENJSON(msp.PartyInfo) WITH (
    PartyInfoSourceCode NVARCHAR(max)
	,PartyRole NVARCHAR(max) AS JSON  
	) pti
CROSS APPLY OPENJSON(pti.PartyRole) WITH (
		PartyRoleCode NVARCHAR(max)
		,PartyPhone NVARCHAR(max) AS JSON
		) ptr
		CROSS APPLY OPENJSON(ptr.PartyPhone) WITH (
		PartyPhoneSourceCode NVARCHAR(max)
		,PhoneNum NVARCHAR(max)
		,PhoneExtension NVARCHAR(max)
		,PhoneTypeCode NVARCHAR(max)
		,IsPrimaryInd INT
		) ptp

UNION ALL 

SELECT   hdr.SourceSystemCode
        ,Convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,ptp.PartyPhoneSourceCode AS SourceCode
	,ptr.PartyRoleCode--field needed to match with ContactPoin table(ContactPointSK)typelist.partyRole
	,pti.PartyInfoSourceCode--field needed to match with ContactPoin table(ContactPointSK)partyMaster
	,ptp.PhoneNum
	,ptp.PhoneExtension
	,ptp.PhoneTypeCode
	,ptp.IsPrimaryInd
	,line.IsValidInd
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
     SourceSystemCode NVARCHAR(max)
	,ProcessDateTime  NVARCHAR(max)
	,Claim NVARCHAR(max) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (
     LossEvent NVARCHAR(max) AS JSON
    )clm
CROSS APPLY OPENJSON(clm.LossEvent) WITH (
    MiscParty NVARCHAR(max) AS JSON
	) loe
CROSS APPLY OPENJSON(loe.MiscParty) WITH (
   PartyInfo NVARCHAR(max) AS JSON 
   )msp
CROSS APPLY OPENJSON(msp.PartyInfo) WITH (
   PartyInfoSourceCode NVARCHAR(max) 
    ,PartyRole NVARCHAR(max) AS JSON  
	) pti
CROSS APPLY OPENJSON(pti.PartyRole) WITH (
		PartyRoleCode NVARCHAR(max)
		,PartyPhone NVARCHAR(max) AS JSON
		) ptr
		CROSS APPLY OPENJSON(ptr.PartyPhone) WITH (
		PartyPhoneSourceCode NVARCHAR(max)
		,PhoneNum NVARCHAR(max)
		,PhoneExtension NVARCHAR(max)
		,PhoneTypeCode NVARCHAR(max)
		,IsPrimaryInd INT
		) ptp

UNION ALL

SELECT   hdr.SourceSystemCode
        ,Convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
		,ptp.PartyPhoneSourceCode AS SourceCode
	,ptr.PartyRoleCode--field needed to match with ContactPoin table(ContactPointSK)typelist.partyRole
	,pti.PartyInfoSourceCode--field needed to match with ContactPoin table(ContactPointSK)partyMaster
	,ptp.PhoneNum
	,ptp.PhoneExtension
	,ptp.PhoneTypeCode
	,ptp.IsPrimaryInd
	,line.IsValidInd
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
     SourceSystemCode NVARCHAR(max)
	,ProcessDateTime  NVARCHAR(max)
	,Claim NVARCHAR(max) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (
     LossEvent NVARCHAR(max) AS JSON
    )clm
CROSS APPLY OPENJSON(clm.LossEvent) WITH (
     LossOccurrence  NVARCHAR(max) AS JSON
	 ) loe
CROSS APPLY OPENJSON(loe.LossOccurrence) WITH (
     MiscParty NVARCHAR(max) AS JSON
	 )loc
CROSS APPLY OPENJSON(loc.MiscParty) WITH (
    PartyInfo NVARCHAR(max) AS JSON 
	)msp
CROSS APPLY OPENJSON(msp.PartyInfo) WITH (
   PartyInfoSourceCode NVARCHAR(max) 
    ,PartyRole NVARCHAR(max) AS JSON  
	) pti
CROSS APPLY OPENJSON(pti.PartyRole) WITH (
		PartyRoleCode NVARCHAR(max)
		,PartyPhone NVARCHAR(max) AS JSON
		) ptr
		CROSS APPLY OPENJSON(ptr.PartyPhone) WITH (
		PartyPhoneSourceCode NVARCHAR(max)
		,PhoneNum NVARCHAR(max)
		,PhoneExtension NVARCHAR(max)
		,PhoneTypeCode NVARCHAR(max)
		,IsPrimaryInd INT
		) ptp
			)tpl
	)tmp
	where tmp.rn = 1
		


GO
