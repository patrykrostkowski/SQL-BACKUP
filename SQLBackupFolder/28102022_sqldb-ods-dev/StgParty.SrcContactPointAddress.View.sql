USE [sqldb-ods-dev]
GO
/****** Object:  View [StgParty].[SrcContactPointAddress]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [StgParty].[SrcContactPointAddress]
AS

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
			,PartyAddress NVARCHAR(max) AS JSON
			) ptr
	CROSS APPLY OPENJSON(ptr.PartyAddress) WITH (
			PartyAddressSourceCode NVARCHAR(max)
			--, NVARCHAR(max)
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
			,PartyAddress NVARCHAR(max) AS JSON
			) ptr
	CROSS APPLY OPENJSON(ptr.PartyAddress) WITH (
			PartyAddressSourceCode NVARCHAR(max)
			--, NVARCHAR(max)
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
			,PartyAddress NVARCHAR(max) AS JSON
			) ptr
	CROSS APPLY OPENJSON(ptr.PartyAddress) WITH (
			PartyAddressSourceCode NVARCHAR(max)
			--, NVARCHAR(max)
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


GO
