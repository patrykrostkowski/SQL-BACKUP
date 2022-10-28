USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcContactPointPhone]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE    VIEW [StgPolicy].[SrcContactPointPhone]
AS

SELECT  
	hdr.SourceSystemCode
	,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,ptp.PartyPhoneSourceCode AS SourceCode
	,ptr.PartyRoleCode--field needed to match with ContactPoin table(ContactPointSK)typelist.partyRole
	,pti.PartyInfoSourceCode--field needed to match with ContactPoin table(ContactPointSK)partyMaster
	,ptp.PhoneNum
	,ptp.PhoneExtension
	,ptp.PhoneTypeCode
	,ptp.IsPrimaryInd
	,line.IsValidInd
FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Policy NVARCHAR(max) AS JSON
		) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (Account NVARCHAR(max) AS JSON) pol
CROSS APPLY OPENJSON(pol.Account) WITH (
		PartyInfo NVARCHAR(max) AS JSON
)acc
CROSS APPLY OPENJSON(acc.PartyInfo) WITH (
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
		,IsPrimaryInd NVARCHAR(max)
		) ptp
	
UNION ALL

SELECT  
	hdr.SourceSystemCode
	,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,ptp.PartyPhoneSourceCode AS SourceCode
	,ptr.PartyRoleCode--field needed to match with ContactPoin table(ContactPointSK)
	,pti.PartyInfoSourceCode--field needed to match with ContactPoin table(ContactPointSK)
	,ptp.PhoneNum
	,ptp.PhoneExtension
	,ptp.PhoneTypeCode
	,ptp.IsPrimaryInd
	,line.IsValidInd
FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Policy NVARCHAR(max) AS JSON
		) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (
		Agency NVARCHAR(max) AS JSON
) pol
CROSS APPLY OPENJSON(pol.Agency) WITH (
		PartyInfo NVARCHAR(max) AS JSON
)agc
CROSS APPLY OPENJSON(agc.PartyInfo) WITH (
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
		,IsPrimaryInd NVARCHAR(max)
		) ptp
	
UNION ALL

SELECT  
	hdr.SourceSystemCode
	,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,ptp.PartyPhoneSourceCode AS SourceCode
	,ptr.PartyRoleCode--field needed to match with ContactPoin table(ContactPointSK)
	,pti.PartyInfoSourceCode--field needed to match with ContactPoin table(ContactPointSK)
	,ptp.PhoneNum
	,ptp.PhoneExtension
	,ptp.PhoneTypeCode
	,ptp.IsPrimaryInd
	,line.IsValidInd
FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Policy NVARCHAR(max) AS JSON
		) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (
		Insured NVARCHAR(max) AS JSON
) pol
CROSS APPLY OPENJSON(pol.Insured) WITH (
		PartyInfo NVARCHAR(max) AS JSON
)ins
CROSS APPLY OPENJSON(ins.PartyInfo) WITH (
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
		,IsPrimaryInd NVARCHAR(max)
		) ptp

UNION ALL

SELECT  
		hdr.SourceSystemCode
		,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
		,ptp.PartyPhoneSourceCode AS SourceCode
		,ptr.PartyRoleCode--field needed to match with ContactPoin table(ContactPointSK)
		,pti.PartyInfoSourceCode--field needed to match with ContactPoin table(ContactPointSK)
		,ptp.PhoneNum
		,ptp.PhoneExtension
		,ptp.PhoneTypeCode
		,ptp.IsPrimaryInd
		,line.IsValidInd
FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Policy NVARCHAR(max) AS JSON
		) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (
		MiscParty NVARCHAR(max) AS JSON
) pol
CROSS APPLY OPENJSON(pol.MiscParty) WITH (
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
		,IsPrimaryInd NVARCHAR(max)
		) ptp


GO
