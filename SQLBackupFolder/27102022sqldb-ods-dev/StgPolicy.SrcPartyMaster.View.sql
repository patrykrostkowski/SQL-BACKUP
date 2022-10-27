USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcPartyMaster]    Script Date: 27.10.2022 12:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE     VIEW [StgPolicy].[SrcPartyMaster]
AS

SELECT * FROM (
SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (
	SELECT 
		hdr.SourceSystemCode	
		,pti.PartyInfoSourceCode	AS SourceCode
		,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
		,pti.SourceMasterNum
		,pti.PartyTypeCode
		,pti.PartyReferenceDesc
		,pti.FirstName
		,pti.MiddleName
		,pti.LastName
		,pti.FullName
		,pti.GenderCode
		,pti.MaritalStatusCode
		,pti.BirthDate
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
		,'' as AgencySourceCode
		,0 as InsertOnly
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
				) tmp

UNION ALL

SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, AgencySourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (
		SELECT 
			hdr.SourceSystemCode	
			,pti.PartyInfoSourceCode	AS SourceCode
			,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
			,pti.SourceMasterNum
			,pti.PartyTypeCode
			,pti.PartyReferenceDesc
			,pti.FirstName
			,pti.MiddleName
			,pti.LastName
			,pti.FullName
			,pti.GenderCode
			,pti.MaritalStatusCode
			,pti.BirthDate
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
			,agc.AgencySourceCode
			,1 as InsertOnly
			,line.IsValidInd
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
			SourceSystemCode NVARCHAR(MAX)
			,ProcessDateTime NVARCHAR(MAX)
			,Policy NVARCHAR(MAX) AS JSON
			) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (
			Agency NVARCHAR(MAX) AS JSON
			,Insured NVARCHAR(MAX) AS JSON
			) pol
		CROSS APPLY OPENJSON(pol.Agency) WITH (
			PartyInfo NVARCHAR(MAX) AS JSON,
			AgencySourceCode NVARCHAR(MAX)
			) agc
		CROSS APPLY OPENJSON(agc.PartyInfo) WITH (
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
		) tmp

UNION ALL 
SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (

	SELECT 
		hdr.SourceSystemCode	
		,pti.PartyInfoSourceCode	AS SourceCode
		,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
		,pti.SourceMasterNum
		,pti.PartyTypeCode
		,pti.PartyReferenceDesc
		,pti.FirstName
		,pti.MiddleName
		,pti.LastName
		,pti.FullName
		,pti.GenderCode
		,pti.MaritalStatusCode
		,pti.BirthDate
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
		,'' as AgencySourceCode
		,0 as InsertOnly
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
				) tmp

UNION ALL
SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (
	SELECT 
		hdr.SourceSystemCode	
		,pti.PartyInfoSourceCode	AS SourceCode
		,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
		,pti.SourceMasterNum
		,pti.PartyTypeCode
		,pti.PartyReferenceDesc
		,pti.FirstName
		,pti.MiddleName
		,pti.LastName
		,pti.FullName
		,pti.GenderCode
		,pti.MaritalStatusCode
		,pti.BirthDate
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
		,'' as AgencySourceCode
		,0 as InsertOnly
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
				) tmp
-- ----------------------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------------------------

UNION ALL		-- WRITING COMPANY
SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (
    SELECT 
		hdr.SourceSystemCode    
		,wrc.WritingCompanySourceCode    AS SourceCode
		,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)    AS ProcessDateTime
		,null AS SourceMasterNum
		,'Organisation' AS PartyTypeCode 
		,null AS PartyReferenceDesc
		,null AS FirstName
		,null AS MiddleName
		,null AS LastName
		,null AS FullName
		,'string' AS GenderCode
		,'string' AS MartialStatusCode
		,null AS BirthDate
		,null AS SocialSecurityNumber
		,null AS OccuoationDesc
		,null AS DricerLicenseNum
		,null AS DriverLicenseStateCode
		,null AS OrganizationName
		,null AS LegalName
		,null AS FEINNum
		,null AS DBAName
		,null AS ContactfirstName
		,null AS ContactMiddleName
		,null AS ContactLastName
		,null AS ContactFullName
		,null AS TaxIdNum
		,null AS SICCode
		,null AS SICDesc
		,wrc.NorthAmericanIndustryClassificationCode	
		,wrc.NorthAmericanIndustryClassificationDesc
		,null AS OwnershipTypeCode
		,'' as AgencySourceCode
		,1 as InsertOnly
		,line.IsValidInd
	FROM StgPolicy.PolicyData line
	CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(MAX)
		,ProcessDateTime NVARCHAR(MAX)
		,Policy NVARCHAR(MAX) AS JSON
		) hdr
	CROSS APPLY OPENJSON(hdr.Policy) WITH (
		WritingCompany NVARCHAR(MAX) AS JSON
		) pol
	CROSS APPLY OPENJSON(pol.WritingCompany) WITH (
		WritingCompanySourceCode NVARCHAR(max)
		,NorthAmericanIndustryClassificationCode NVARCHAR(max)
		,NorthAmericanIndustryClassificationDesc NVARCHAR(max)
		) wrc
				) tmp

UNION ALL
SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (
    SELECT 
		hdr.SourceSystemCode    
		,wrc.WritingCompanySourceCode    AS SourceCode
		,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)    AS ProcessDateTime
		,null AS SourceMasterNum
		,'Organisation' AS PartyTypeCode 
		,null AS PartyReferenceDesc
		,null AS FirstName
		,null AS MiddleName
		,null AS LastName
		,null AS FullName
		,'string' AS GenderCode
		,'string' AS MartialStatusCode
		,null AS BirthDate
		,null AS SocialSecurityNumber
		,null AS OccuoationDesc
		,null AS DricerLicenseNum
		,null AS DriverLicenseStateCode
		,null AS OrganizationName
		,null AS LegalName
		,null AS FEINNum
		,null AS DBAName
		,null AS ContactfirstName
		,null AS ContactMiddleName
		,null AS ContactLastName
		,null AS ContactFullName
		,null AS TaxIdNum
		,null AS SICCode
		,null AS SICDesc
		,wrc.NorthAmericanIndustryClassificationCode
		,wrc.NorthAmericanIndustryClassificationDesc
		,null AS OwnershipTypeCode
		,'' as AgencySourceCode
		,1 as InsertOnly
		,line.IsValidInd
	FROM StgPolicy.PolicyData line
	CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(MAX)
		,ProcessDateTime NVARCHAR(MAX)
		,Policy NVARCHAR(MAX) AS JSON
		) hdr
	CROSS APPLY OPENJSON(hdr.Policy) WITH (
		PolicyTrans NVARCHAR(MAX) AS JSON
		) pol
	CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (
		WritingCompany NVARCHAR(max) AS JSON
		) ptr
	CROSS APPLY OPENJSON(ptr.WritingCompany) WITH (
		WritingCompanySourceCode NVARCHAR(max)
		,NorthAmericanIndustryClassificationCode NVARCHAR(max)
		,NorthAmericanIndustryClassificationDesc NVARCHAR(max)
		) wrc
				) tmp

UNION ALL		-- FRONTING COMPANY
SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (
    SELECT 
		hdr.SourceSystemCode    
		,frc.FrontingCompanySourceCode    AS SourceCode
		,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)    AS ProcessDateTime
		,null AS SourceMasterNum
		,'Organisation' AS PartyTypeCode 
		,null AS PartyReferenceDesc
		,null AS FirstName
		,null AS MiddleName
		,null AS LastName
		,null AS FullName
		,'string' AS GenderCode
		,'string' AS MartialStatusCode
		,null AS BirthDate
		,null AS SocialSecurityNumber
		,null AS OccuoationDesc
		,null AS DricerLicenseNum
		,null AS DriverLicenseStateCode
		,null AS OrganizationName
		,null AS LegalName
		,null AS FEINNum
		,null AS DBAName
		,null AS ContactfirstName
		,null AS ContactMiddleName
		,null AS ContactLastName
		,null AS ContactFullName
		,null AS TaxIdNum
		,null AS SICCode
		,null AS SICDesc
		,null AS NorthAmericanIndustryClassificationCode
		,null AS NorthAmericanIndustryClassificationDesc
		,null AS OwnershipTypeCode
		,'' as AgencySourceCode
		,1 as InsertOnly
		,line.IsValidInd
	FROM StgPolicy.PolicyData line
	CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(MAX)
		,ProcessDateTime NVARCHAR(MAX)
		,Policy NVARCHAR(MAX) AS JSON
		) hdr
	CROSS APPLY OPENJSON(hdr.Policy) WITH (
		PolicyTrans NVARCHAR(MAX) AS JSON
		) pol
	CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (
		FrontingCompany NVARCHAR(max) AS JSON
		) ptr
	CROSS APPLY OPENJSON(ptr.FrontingCompany) WITH (
		FrontingCompanySourceCode NVARCHAR(max)
		) frc
				) tmp

UNION ALL		
SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (
    SELECT 
		hdr.SourceSystemCode    
		,frc.FrontingCompanySourceCode    AS SourceCode
		,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)    AS ProcessDateTime
		,null AS SourceMasterNum
		,'Organisation' AS PartyTypeCode 
		,null AS PartyReferenceDesc
		,null AS FirstName
		,null AS MiddleName
		,null AS LastName
		,null AS FullName
		,'string' AS GenderCode
		,'string' AS MartialStatusCode
		,null AS BirthDate
		,null AS SocialSecurityNumber
		,null AS OccuoationDesc
		,null AS DricerLicenseNum
		,null AS DriverLicenseStateCode
		,null AS OrganizationName
		,null AS LegalName
		,null AS FEINNum
		,null AS DBAName
		,null AS ContactfirstName
		,null AS ContactMiddleName
		,null AS ContactLastName
		,null AS ContactFullName
		,null AS TaxIdNum
		,null AS SICCode
		,null AS SICDesc
		,null AS NorthAmericanIndustryClassificationCode
		,null AS NorthAmericanIndustryClassificationDesc
		,null AS OwnershipTypeCode
		,'' as AgencySourceCode
		,1 as InsertOnly
		,line.IsValidInd
	FROM StgPolicy.PolicyData line
	CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(MAX)
		,ProcessDateTime NVARCHAR(MAX)
		,Policy NVARCHAR(MAX) AS JSON
		) hdr
	CROSS APPLY OPENJSON(hdr.Policy) WITH (
		FrontingCompany NVARCHAR(MAX) AS JSON
		) pol
	CROSS APPLY OPENJSON(pol.FrontingCompany) WITH (
		FrontingCompanySourceCode NVARCHAR(max)
		) frc
				) tmp

UNION ALL			-- DRIVER
SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (
    SELECT 
		hdr.SourceSystemCode    
		,drv.DriverSourceCode    AS SourceCode
		,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)    AS ProcessDateTime
		,null AS SourceMasterNum
		,'Organisation' AS PartyTypeCode 
		,null AS PartyReferenceDesc
		,null AS FirstName
		,null AS MiddleName
		,null AS LastName
		,null AS FullName
		,'string' AS GenderCode
		,'string' AS MartialStatusCode
		,null AS BirthDate
		,null AS SocialSecurityNumber
		,null AS OccuoationDesc
		,null AS DricerLicenseNum
		,null AS DriverLicenseStateCode
		,null AS OrganizationName
		,null AS LegalName
		,null AS FEINNum
		,null AS DBAName
		,null AS ContactfirstName
		,null AS ContactMiddleName
		,null AS ContactLastName
		,null AS ContactFullName
		,null AS TaxIdNum
		,null AS SICCode
		,null AS SICDesc
		,null AS NorthAmericanIndustryClassificationCode
		,null AS NorthAmericanIndustryClassificationDesc
		,null AS OwnershipTypeCode
		,'' as AgencySourceCode
		,0 as InsertOnly
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
		PartyInfo NVARCHAR(max) AS JSON
		) msp
	CROSS APPLY OPENJSON(msp.PartyInfo) WITH (
		PartyRole NVARCHAR(max) AS JSON
		) pti
	CROSS APPLY OPENJSON(pti.PartyRole) WITH (
		Driver NVARCHAR(max) AS JSON
		) ptr
	CROSS APPLY OPENJSON(ptr.Driver) WITH (
		DriverSourceCode NVARCHAR(max)
		) drv
				) tmp

--UNION ALL	

--    SELECT 
--		hdr.SourceSystemCode    
--		,vhd.DriverSourceCode    AS SourceCode
--		,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)    AS ProcessDateTime
--		,null AS SourceMasterNum
--		,'Organisation' AS PartyTypeCode 
--		,null AS PartyReferenceDesc
--		,null AS FirstName
--		,null AS MiddleName
--		,null AS LastName
--		,null AS FullName
--		,'string' AS GenderCode
--		,'string' AS MartialStatusCode
--		,null AS BirthDate
--		,null AS SocialSecurityNumber
--		,null AS OccuoationDesc
--		,null AS DricerLicenseNum
--		,null AS DriverLicenseStateCode
--		,null AS OrganizationName
--		,null AS LegalName
--		,null AS FEINNum
--		,null AS DBAName
--		,null AS ContactfirstName
--		,null AS ContactMiddleName
--		,null AS ContactLastName
--		,null AS ContactFullName
--		,null AS TaxIdNum
--		,null AS SICCode
--		,null AS SICDesc
--		,null AS NorthAmericanIndustryClassificationCode
--		,null AS NorthAmericanIndustryClassificationDesc
--		,null AS OwnershipTypeCode
--		,'' as AgencySourceCode
--		,1 as rn

--	FROM StgPolicy.PolicyData line
--	CROSS APPLY OPENJSON(line.JsonLine) WITH (
--		SourceSystemCode NVARCHAR(MAX)
--		,ProcessDateTime NVARCHAR(MAX)
--		,Policy NVARCHAR(MAX) AS JSON
--		) hdr
--	CROSS APPLY OPENJSON(hdr.Policy) WITH (
--		PolicyTrans NVARCHAR(MAX) AS JSON
--		) pol
--	CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (
--		LineOfBusiness NVARCHAR(max) AS JSON
--		) plt
--	CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (
--		Geography NVARCHAR(max) AS JSON
--		) lob
--	CROSS APPLY OPENJSON(lob.Geography) WITH (
--		InsurableObject NVARCHAR(max) AS JSON
--		) grg
--	CROSS APPLY OPENJSON(grg.InsurableObject) WITH (
--		Vehicle NVARCHAR(max) AS JSON
--		) ino
--	CROSS APPLY OPENJSON(ino.Vehicle) WITH (
--		VehicleDriver NVARCHAR(max) AS JSON
--		) vhc
--	CROSS APPLY OPENJSON(vhc.VehicleDriver) WITH (
--		DriverSourceCode NVARCHAR(max)
--		) vhd

) tpl
WHERE tpl.rn = 1

GO
