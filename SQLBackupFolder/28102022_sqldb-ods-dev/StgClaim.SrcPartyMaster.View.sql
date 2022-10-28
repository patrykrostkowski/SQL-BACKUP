USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcPartyMaster]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--/****** Object:  View [StgClaim].[SrcPartyMaster]    Script Date: 10.08.2022 15:02:41 ******/
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO


CREATE       VIEW [StgClaim].[SrcPartyMaster]
AS
SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (

SELECT 
	hdr.SourceSystemCode	
	,pti.PartyInfoSourceCode	AS SourceCode
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime --2022-03-30T11:43:34.850
	,pti.SourceMasterNum
	,pti.PartyTypeCode 
	,pti.PartyReferenceDesc
	,pti.FirstName 
	,pti.MiddleName 
	,pti.LastName  
	,pti.FullName 
	,pti.GenderCode 
	,pti.MaritalStatusCode
	,TRY_CONVERT(DATETIME, pti.BirthDate, 127) AS BirthDate 
	,pti.SocialSecurityNum
	,pti.OccupationDesc 
	,pti.DriverLicenseNum 
	,pti.DriverLicenseStateCode 
	,pti.OrganizationName
	,pti.LegalName 
	,pti.FEINNum 
	,pti.DBAName 
	,pti.ContactFirstName
	,pti.ContactMiddleName
	,pti.ContactLastName
	,pti.ContactFullName
	,pti.TaxIdNum
	,pti.SICCode 
	,pti.SICDesc 
	,pti.NorthAmericanIndustryClassificationCode 
	,pti.NorthAmericanIndustryClassificationDesc 
	,pti.OwnershipTypeCode 
	,line.IsValidInd
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(MAX)
	,ProcessDateTime NVARCHAR(MAX)
	,Claim NVARCHAR(MAX) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (
	NorthAmericanIndustryClassificationCode NVARCHAR(max)
	,Claimant NVARCHAR(MAX) AS JSON
	) clm
CROSS APPLY OPENJSON(clm.Claimant) WITH (
OccupationDesc NVARCHAR(max)
	,PartyInfo NVARCHAR(MAX) AS JSON
	) clt
CROSS APPLY OPENJSON(clt.PartyInfo) WITH (
	SourceMasterNum NVARCHAR(MAX)
	,PartyInfoSourceCode NVARCHAR(MAX)
	,PartyReferenceDesc NVARCHAR(MAX)
	,FirstName NVARCHAR(MAX)
	,MiddleName NVARCHAR(MAX)
	,LastName NVARCHAR(MAX)
	,FullName NVARCHAR(MAX)
	,GenderCode NVARCHAR(MAX)
	,MaritalStatusCode NVARCHAR(MAX)
	,BirthDate date
	,SocialSecurityNum NVARCHAR(MAX)
	,OccupationDesc NVARCHAR(MAX)
	,DriverLicenseNum NVARCHAR(MAX)
	,DriverLicenseStateCode NVARCHAR(MAX)
	,OrganizationName NVARCHAR(MAX)
	,LegalName NVARCHAR(MAX)
	,FEINNum NVARCHAR(MAX)
	,DBAName NVARCHAR(MAX)
	,ContactFirstName NVARCHAR(MAX)
	,ContactMiddleName NVARCHAR(MAX)
	,ContactLastName NVARCHAR(MAX)
	,ContactFullName NVARCHAR(MAX)
	,PartyTypeCode NVARCHAR(MAX)
	,TaxIdNum NVARCHAR(MAX)
	,SICCode NVARCHAR(MAX)
	,SICDesc NVARCHAR(MAX)
	,NorthAmericanIndustryClassificationCode NVARCHAR(MAX)
	,NorthAmericanIndustryClassificationDesc NVARCHAR(MAX)
	,OwnershipTypeCode NVARCHAR(MAX)
	) pti


UNION ALL


SELECT 
	hdr.SourceSystemCode	
	,pti.PartyInfoSourceCode	AS SourceCode
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime --2022-03-30T11:43:34.850
	,pti.SourceMasterNum
	,pti.PartyTypeCode 
	,pti.PartyReferenceDesc
	,pti.FirstName 
	,pti.MiddleName 
	,pti.LastName  
	,pti.FullName 
	,pti.GenderCode 
	,pti.MaritalStatusCode
	,TRY_CONVERT(DATETIME, pti.BirthDate, 127) AS BirthDate 
	,pti.SocialSecurityNum
	,pti.OccupationDesc 
	,pti.DriverLicenseNum 
	,pti.DriverLicenseStateCode 
	,pti.OrganizationName
	,pti.LegalName 
	,pti.FEINNum 
	,pti.DBAName 
	,pti.ContactFirstName
	,pti.ContactMiddleName
	,pti.ContactLastName
	,pti.ContactFullName
	,pti.TaxIdNum
	,pti.SICCode 
	,pti.SICDesc 
	,pti.NorthAmericanIndustryClassificationCode 
	,pti.NorthAmericanIndustryClassificationDesc 
	,pti.OwnershipTypeCode 
	,line.IsValidInd
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(MAX)
	,ProcessDateTime NVARCHAR(MAX)
	,Claim NVARCHAR(MAX) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (
	NorthAmericanIndustryClassificationCode NVARCHAR(max)
	,LossEvent NVARCHAR(MAX) AS JSON
	) clm
CROSS APPLY OPENJSON(clm.LossEvent) WITH (
	LossOccurrence NVARCHAR(MAX) AS JSON
	) los
CROSS APPLY OPENJSON(los.LossOccurrence) WITH (
	MiscParty NVARCHAR(MAX) AS JSON
	)lso
CROSS APPLY OPENJSON(lso.MiscParty) WITH (
	PartyInfo NVARCHAR(max) AS JSON
	)msp
CROSS APPLY OPENJSON(msp.PartyInfo) WITH (
	SourceMasterNum NVARCHAR(MAX)
	,PartyInfoSourceCode NVARCHAR(MAX)
	,PartyReferenceDesc NVARCHAR(MAX)
	,FirstName NVARCHAR(MAX)
	,MiddleName NVARCHAR(MAX)
	,LastName NVARCHAR(MAX)
	,FullName NVARCHAR(MAX)
	,GenderCode NVARCHAR(MAX)
	,MaritalStatusCode NVARCHAR(MAX)
	,BirthDate date
	,SocialSecurityNum NVARCHAR(MAX)
	,OccupationDesc NVARCHAR(MAX)
	,DriverLicenseNum NVARCHAR(MAX)
	,DriverLicenseStateCode NVARCHAR(MAX)
	,OrganizationName NVARCHAR(MAX)
	,LegalName NVARCHAR(MAX)
	,FEINNum NVARCHAR(MAX)
	,DBAName NVARCHAR(MAX)
	,ContactFirstName NVARCHAR(MAX)
	,ContactMiddleName NVARCHAR(MAX)
	,ContactLastName NVARCHAR(MAX)
	,ContactFullName NVARCHAR(MAX)
	,PartyTypeCode NVARCHAR(MAX)
	,TaxIdNum NVARCHAR(MAX)
	,SICCode NVARCHAR(MAX)
	,SICDesc NVARCHAR(MAX)
	,NorthAmericanIndustryClassificationCode NVARCHAR(MAX)
	,NorthAmericanIndustryClassificationDesc NVARCHAR(MAX)
	,OwnershipTypeCode NVARCHAR(MAX)
	) pti




UNION ALL


SELECT 
	hdr.SourceSystemCode	
	,pti.PartyInfoSourceCode	AS SourceCode
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime --2022-03-30T11:43:34.850
	,pti.SourceMasterNum
	,pti.PartyTypeCode 
	,pti.PartyReferenceDesc
	,pti.FirstName 
	,pti.MiddleName 
	,pti.LastName  
	,pti.FullName 
	,pti.GenderCode 
	,pti.MaritalStatusCode
	,TRY_CONVERT(DATETIME, pti.BirthDate, 127) AS BirthDate 
	,pti.SocialSecurityNum
	,pti.OccupationDesc 
	,pti.DriverLicenseNum 
	,pti.DriverLicenseStateCode 
	,pti.OrganizationName
	,pti.LegalName 
	,pti.FEINNum 
	,pti.DBAName 
	,pti.ContactFirstName
	,pti.ContactMiddleName
	,pti.ContactLastName
	,pti.ContactFullName
	,pti.TaxIdNum
	,pti.SICCode 
	,pti.SICDesc 
	,pti.NorthAmericanIndustryClassificationCode 
	,pti.NorthAmericanIndustryClassificationDesc  
	,pti.OwnershipTypeCode
	,line.IsValidInd
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(MAX)
	,ProcessDateTime NVARCHAR(MAX)
	,Claim NVARCHAR(MAX) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (
	NorthAmericanIndustryClassificationCode NVARCHAR(max)
	,LossEvent NVARCHAR(MAX) AS JSON
	) clm
CROSS APPLY OPENJSON(clm.LossEvent) WITH (
	MiscParty NVARCHAR(MAX) AS JSON
	) los
CROSS APPLY OPENJSON(los.MiscParty) WITH (
	PartyInfo NVARCHAR(max) AS JSON
	)msp
CROSS APPLY OPENJSON(msp.PartyInfo) WITH (
	SourceMasterNum NVARCHAR(MAX)
	,PartyInfoSourceCode NVARCHAR(MAX)
	,PartyReferenceDesc NVARCHAR(MAX)
	,FirstName NVARCHAR(MAX)
	,MiddleName NVARCHAR(MAX)
	,LastName NVARCHAR(MAX)
	,FullName NVARCHAR(MAX)
	,GenderCode NVARCHAR(MAX)
	,MaritalStatusCode NVARCHAR(MAX)
	,BirthDate date
	,SocialSecurityNum NVARCHAR(MAX)
	,OccupationDesc NVARCHAR(MAX)
	,DriverLicenseNum NVARCHAR(MAX)
	,DriverLicenseStateCode NVARCHAR(MAX)
	,OrganizationName NVARCHAR(MAX)
	,LegalName NVARCHAR(MAX)
	,FEINNum NVARCHAR(MAX)
	,DBAName NVARCHAR(MAX)
	,ContactFirstName NVARCHAR(MAX)
	,ContactMiddleName NVARCHAR(MAX)
	,ContactLastName NVARCHAR(MAX)
	,ContactFullName NVARCHAR(MAX)
	,PartyTypeCode NVARCHAR(MAX)
	,TaxIdNum NVARCHAR(MAX)
	,SICCode NVARCHAR(MAX)
	,SICDesc NVARCHAR(MAX)
	,NorthAmericanIndustryClassificationCode NVARCHAR(MAX)
	,NorthAmericanIndustryClassificationDesc NVARCHAR(MAX)
	,OwnershipTypeCode NVARCHAR(MAX)
	) pti


UNION ALL



SELECT 
	hdr.SourceSystemCode	
	,pti.PartyInfoSourceCode	AS SourceCode
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime --2022-03-30T11:43:34.850
	,pti.SourceMasterNum
	,pti.PartyTypeCode 
	,pti.PartyReferenceDesc
	,pti.FirstName 
	,pti.MiddleName 
	,pti.LastName  
	,pti.FullName 
	,pti.GenderCode 
	,pti.MaritalStatusCode
	,TRY_CONVERT(DATETIME, pti.BirthDate, 127) AS BirthDate 
	,pti.SocialSecurityNum
	,pti.OccupationDesc 
	,pti.DriverLicenseNum 
	,pti.DriverLicenseStateCode 
	,pti.OrganizationName
	,pti.LegalName 
	,pti.FEINNum 
	,pti.DBAName 
	,pti.ContactFirstName
	,pti.ContactMiddleName
	,pti.ContactLastName
	,pti.ContactFullName
	,pti.TaxIdNum
	,pti.SICCode 
	,pti.SICDesc 
	,pti.NorthAmericanIndustryClassificationCode 
	,pti.NorthAmericanIndustryClassificationDesc 
	,pti.OwnershipTypeCode 
	,line.IsValidInd
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(MAX)
	,ProcessDateTime NVARCHAR(MAX)
	,Claim NVARCHAR(MAX) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (
	NorthAmericanIndustryClassificationCode NVARCHAR(max)
	,MiscParty NVARCHAR(MAX) AS JSON
	) clm
CROSS APPLY OPENJSON(clm.MiscParty) WITH (
	PartyInfo NVARCHAR(MAX) AS JSON
	) msp
CROSS APPLY OPENJSON(msp.PartyInfo) WITH (
	SourceMasterNum NVARCHAR(MAX)
	,PartyInfoSourceCode NVARCHAR(MAX)
	,PartyReferenceDesc NVARCHAR(MAX)
	,FirstName NVARCHAR(MAX)
	,MiddleName NVARCHAR(MAX)
	,LastName NVARCHAR(MAX)
	,FullName NVARCHAR(MAX)
	,GenderCode NVARCHAR(MAX)
	,MaritalStatusCode NVARCHAR(MAX)
	,BirthDate date
	,SocialSecurityNum NVARCHAR(MAX)
	,OccupationDesc NVARCHAR(MAX)
	,DriverLicenseNum NVARCHAR(MAX)
	,DriverLicenseStateCode NVARCHAR(MAX)
	,OrganizationName NVARCHAR(MAX)
	,LegalName NVARCHAR(MAX)
	,FEINNum NVARCHAR(MAX)
	,DBAName NVARCHAR(MAX)
	,ContactFirstName NVARCHAR(MAX)
	,ContactMiddleName NVARCHAR(MAX)
	,ContactLastName NVARCHAR(MAX)
	,ContactFullName NVARCHAR(MAX)
	,PartyTypeCode NVARCHAR(MAX)
	,TaxIdNum NVARCHAR(MAX)
	,SICCode NVARCHAR(MAX)
	,SICDesc NVARCHAR(MAX)
	,NorthAmericanIndustryClassificationCode NVARCHAR(MAX)
	,NorthAmericanIndustryClassificationDesc NVARCHAR(MAX)
	,OwnershipTypeCode NVARCHAR(MAX)
	) pti
	)tpl
	)tmp
	where tmp.rn = 1





GO
