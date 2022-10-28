USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcPartyContactPointAddress]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE   VIEW [StgClaim].[SrcPartyContactPointAddress]
AS

SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (
SELECT   hdr.SourceSystemCode
        ,Convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
		,pta.PartyAddressSourceCode AS SourceCode
		,ptr.PartyRoleCode
		,pti.PartyInfoSourceCode
		,pta.AddressTypeCode
		,pta.AddressLine1
		,pta.AddressLine2
		,pta.AddressLine3
		,pta.AddressLine4
		,pta.CityName
		,pta.CountyName
		,pta.StateCode
		,pta.CountryCode
		,pta.PostalCode
		,pta.ContactName
		,pta.IsPrimaryInd
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
	) Pti
CROSS APPLY OPENJSON(pti.PartyRole) WITH (
     PartyRoleCode NVARCHAR(max)
     ,PartyAddress NVARCHAR(max) AS JSON 
	) ptr
CROSS APPLY OPENJSON(ptr.PartyAddress) WITH (
    PartyAddressSourceCode NVARCHAR(max)
			,AddressTypeCode NVARCHAR(max)
			,AddressLine1 NVARCHAR(max)
			,AddressLine2 NVARCHAR(max)
			,AddressLine3 NVARCHAR(max)
			,AddressLine4 NVARCHAR(max)
			,CityName NVARCHAR(max)
			,CountyName NVARCHAR(max)
			,StateCode NVARCHAR(max)
			,CountryCode NVARCHAR(max)
			,PostalCode NVARCHAR(max)
			,ContactName NVARCHAR(max)
			,IsPrimaryInd NVARCHAR(max)
			) pta


UNION ALL

SELECT  
		hdr.SourceSystemCode
		,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
		,pta.PartyAddressSourceCode AS SourceCode
		,ptr.PartyRoleCode
		,pti.PartyInfoSourceCode
		,pta.AddressTypeCode
		,pta.AddressLine1
		,pta.AddressLine2
		,pta.AddressLine3
		,pta.AddressLine4
		,pta.CityName
		,pta.CountyName
		,pta.StateCode
		,pta.CountryCode
		,pta.PostalCode
		,pta.ContactName
		,pta.IsPrimaryInd
		,line.IsValidInd
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
     SourceSystemCode NVARCHAR(max)
	,ProcessDateTime  NVARCHAR(max)
	,Claim NVARCHAR(max) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (
     Claimant  NVARCHAR(max) AS JSON
	 )clm
CROSS APPLY OPENJSON(clm.Claimant) WITH (
     PartyInfo NVARCHAR(max) AS JSON  
	 ) cmt
CROSS APPLY OPENJSON(cmt.PartyInfo) WITH (
     PartyInfoSourceCode NVARCHAR(max)
	,PartyRole NVARCHAR(max) AS JSON  
	)pti
CROSS APPLY OPENJSON(pti.PartyRole) WITH (
       PartyRoleCode NVARCHAR(max)
      ,PartyAddress NVARCHAR(max) AS JSON 
	) ptr

CROSS APPLY OPENJSON(ptr.PartyAddress) WITH (
    PartyAddressSourceCode NVARCHAR(max)
			,AddressTypeCode NVARCHAR(max)
			,AddressLine1 NVARCHAR(max)
			,AddressLine2 NVARCHAR(max)
			,AddressLine3 NVARCHAR(max)
			,AddressLine4 NVARCHAR(max)
			,CityName NVARCHAR(max)
			,CountyName NVARCHAR(max)
			,StateCode NVARCHAR(max)
			,CountryCode NVARCHAR(max)
			,PostalCode NVARCHAR(max)
			,ContactName NVARCHAR(max)
			,IsPrimaryInd NVARCHAR(max)
			) pta

UNION ALL

SELECT  
		hdr.SourceSystemCode
		,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
		,pta.PartyAddressSourceCode AS SourceCode
		,ptr.PartyRoleCode
		,pti.PartyInfoSourceCode
		,pta.AddressTypeCode
		,pta.AddressLine1
		,pta.AddressLine2
		,pta.AddressLine3
		,pta.AddressLine4
		,pta.CityName
		,pta.CountyName
		,pta.StateCode
		,pta.CountryCode
		,pta.PostalCode
		,pta.ContactName
		,pta.IsPrimaryInd
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
      ,PartyAddress NVARCHAR(max) AS JSON 
	) ptr
CROSS APPLY OPENJSON(ptr.PartyAddress) WITH (
    PartyAddressSourceCode NVARCHAR(max)
			,AddressTypeCode NVARCHAR(max)
			,AddressLine1 NVARCHAR(max)
			,AddressLine2 NVARCHAR(max)
			,AddressLine3 NVARCHAR(max)
			,AddressLine4 NVARCHAR(max)
			,CityName NVARCHAR(max)
			,CountyName NVARCHAR(max)
			,StateCode NVARCHAR(max)
			,CountryCode NVARCHAR(max)
			,PostalCode NVARCHAR(max)
			,ContactName NVARCHAR(max)
			,IsPrimaryInd NVARCHAR(max)
			) pta


UNION ALL

SELECT  
		hdr.SourceSystemCode
		,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
		,pta.PartyAddressSourceCode AS SourceCode
		,ptr.PartyRoleCode
		,pti.PartyInfoSourceCode
		,pta.AddressTypeCode
		,pta.AddressLine1
		,pta.AddressLine2
		,pta.AddressLine3
		,pta.AddressLine4
		,pta.CityName
		,pta.CountyName
		,pta.StateCode
		,pta.CountryCode
		,pta.PostalCode
		,pta.ContactName
		,pta.IsPrimaryInd
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
      ,PartyAddress NVARCHAR(max) AS JSON 
	) ptr
CROSS APPLY OPENJSON(ptr.PartyAddress) WITH (
    PartyAddressSourceCode NVARCHAR(max)
			,AddressTypeCode NVARCHAR(max)
			,AddressLine1 NVARCHAR(max)
			,AddressLine2 NVARCHAR(max)
			,AddressLine3 NVARCHAR(max)
			,AddressLine4 NVARCHAR(max)
			,CityName NVARCHAR(max)
			,CountyName NVARCHAR(max)
			,StateCode NVARCHAR(max)
			,CountryCode NVARCHAR(max)
			,PostalCode NVARCHAR(max)
			,ContactName NVARCHAR(max)
			,IsPrimaryInd NVARCHAR(max)
			) pta
						)tpl
	)tmp
	where tmp.rn = 1

GO
