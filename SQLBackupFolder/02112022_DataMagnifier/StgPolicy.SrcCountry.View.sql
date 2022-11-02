USE [DataMagnifier]
GO
/****** Object:  View [StgPolicy].[SrcCountry]    Script Date: 02.11.2022 14:07:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* FOR 
	DomicileCountrySK
	CountrySK
	RegistrationCountrySK
*/

CREATE VIEW [StgPolicy].[SrcCountry]
AS
SELECT SourceSystemCode
	,CountryCode
	,CountryName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, CountryCode ORDER BY CountryName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,pta.CountryCode
			,ISNULL(pta.CountryDesc, '') AS CountryName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (Account NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.Account) WITH (PartyInfo NVARCHAR(MAX) AS JSON) acc
		CROSS APPLY OPENJSON(acc.PartyInfo) WITH (PartyRole NVARCHAR(MAX) AS JSON) pti
		CROSS APPLY OPENJSON(pti.PartyRole) WITH (PartyAddress NVARCHAR(MAX) AS JSON) ptr
		CROSS APPLY OPENJSON(ptr.PartyAddress) WITH (CountryCode NVARCHAR(MAX), CountryDesc NVARCHAR(MAX)) pta
		WHERE ISNULL(pta.CountryCode, '') <> ''
-- ------------------------------------------------------------------------------------------------------------------------------
		UNION ALL

		SELECT hdr.SourceSystemCode
			,pta.CountryCode
			,ISNULL(pta.CountryDesc, '') AS CountryName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (Agency NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.Agency) WITH (PartyInfo NVARCHAR(MAX) AS JSON) agc
		CROSS APPLY OPENJSON(agc.PartyInfo) WITH (PartyRole NVARCHAR(MAX) AS JSON) pti
		CROSS APPLY OPENJSON(pti.PartyRole) WITH (PartyAddress NVARCHAR(MAX) AS JSON) ptr
		CROSS APPLY OPENJSON(ptr.PartyAddress) WITH (CountryCode NVARCHAR(MAX), CountryDesc NVARCHAR(MAX)) pta
		WHERE ISNULL(pta.CountryCode, '') <> ''
-- ------------------------------------------------------------------------------------------------------------------------------
		UNION ALL

		SELECT hdr.SourceSystemCode
			,pol.DomicileCountryCode AS CountryCode
			,ISNULL(pol.DomicileCountryDesc, '') AS CountryName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (DomicileCountryCode NVARCHAR(MAX), DomicileCountryDesc NVARCHAR(MAX)) pol
		WHERE ISNULL(pol.DomicileCountryCode, '') <> ''
-- ------------------------------------------------------------------------------------------------------------------------------
		UNION ALL

		SELECT hdr.SourceSystemCode
			,ins.DomicileCountryCode AS CountryCode
			,ISNULL(ins.DomicileCountryDesc, '') AS CountryName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (Insured NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.Insured) WITH (DomicileCountryCode NVARCHAR(MAX), DomicileCountryDesc NVARCHAR(MAX)) ins
		WHERE ISNULL(ins.DomicileCountryCode, '') <> ''
-- ------------------------------------------------------------------------------------------------------------------------------
		UNION ALL

		SELECT hdr.SourceSystemCode
			,pta.CountryCode 
			,ISNULL(pta.CountryDesc, '') AS CountryName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (Insured NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.Insured) WITH (PartyInfo NVARCHAR(MAX) AS JSON) ins
		CROSS APPLY OPENJSON(ins.PartyInfo) WITH (PartyRole NVARCHAR(MAX) AS JSON) pti
		CROSS APPLY OPENJSON(pti.PartyRole) WITH (PartyAddress NVARCHAR(MAX) AS JSON) ptr
		CROSS APPLY OPENJSON(ptr.PartyAddress) WITH (CountryCode NVARCHAR(MAX), CountryDesc NVARCHAR(MAX)) pta	
		WHERE ISNULL(pta.CountryCode, '') <> ''
-- ------------------------------------------------------------------------------------------------------------------------------
		UNION ALL

		SELECT hdr.SourceSystemCode
			,dld.CountryCode 
			,ISNULL(dld.CountryDesc, '') AS CountryName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (MiscParty NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.MiscParty) WITH (PartyInfo NVARCHAR(MAX) AS JSON) mcp
		CROSS APPLY OPENJSON(mcp.PartyInfo) WITH (PartyRole NVARCHAR(MAX) AS JSON) pti
		CROSS APPLY OPENJSON(pti.PartyRole) WITH (Driver NVARCHAR(MAX) AS JSON) ptr
		CROSS APPLY OPENJSON(ptr.Driver) WITH (DriverLicenseDetail NVARCHAR(MAX) AS JSON) drv
		CROSS APPLY OPENJSON(drv.DriverLicenseDetail) WITH (CountryCode NVARCHAR(MAX), CountryDesc NVARCHAR(MAX)) dld	
		WHERE ISNULL(dld.CountryCode, '') <> ''
-- ------------------------------------------------------------------------------------------------------------------------------
		UNION ALL

		SELECT hdr.SourceSystemCode
			,pta.CountryCode 
			,ISNULL(pta.CountryDesc, '') AS CountryName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (MiscParty NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.MiscParty) WITH (PartyInfo NVARCHAR(MAX) AS JSON) mcp
		CROSS APPLY OPENJSON(mcp.PartyInfo) WITH (PartyRole NVARCHAR(MAX) AS JSON) pti
		CROSS APPLY OPENJSON(pti.PartyRole) WITH (PartyAddress NVARCHAR(MAX) AS JSON) ptr
		CROSS APPLY OPENJSON(ptr.PartyAddress) WITH (CountryCode NVARCHAR(MAX), CountryDesc NVARCHAR(MAX)) pta
		WHERE ISNULL(pta.CountryCode, '') <> ''
-- ------------------------------------------------------------------------------------------------------------------------------
		UNION ALL

		SELECT hdr.SourceSystemCode
			,plt.DomicileCountryCode AS CountryCode
			,ISNULL(plt.DomicileCountryDesc, '') AS CountryName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (DomicileCountryCode NVARCHAR(MAX), DomicileCountryDesc NVARCHAR(MAX)) plt
		WHERE ISNULL(plt.DomicileCountryCode, '') <> ''
-- ------------------------------------------------------------------------------------------------------------------------------
		UNION ALL

		SELECT hdr.SourceSystemCode
			,grg.CountryCode
			,ISNULL(grg.CountryDesc, '') AS CountryName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (Geography NVARCHAR(MAX) AS JSON) lob
		CROSS APPLY OPENJSON(lob.Geography) WITH (CountryCode NVARCHAR(MAX), CountryDesc NVARCHAR(MAX)) grg 
		WHERE ISNULL(grg.CountryCode, '') <> ''
-- ------------------------------------------------------------------------------------------------------------------------------
		UNION ALL

		SELECT hdr.SourceSystemCode
			,afl.CountryCode
			,ISNULL(afl.CountryDesc, '') AS CountryName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (Geography NVARCHAR(MAX) AS JSON) lob
		CROSS APPLY OPENJSON(lob.Geography) WITH (InsurableObject NVARCHAR(MAX) AS JSON) grg
		CROSS APPLY OPENJSON(grg.InsurableObject) WITH (Aircraft NVARCHAR(MAX) AS JSON) ino
		CROSS APPLY OPENJSON(ino.Aircraft) WITH (AircraftLocation NVARCHAR(MAX) AS JSON) aft
		CROSS APPLY OPENJSON(aft.AircraftLocation) WITH (CountryCode NVARCHAR(MAX), CountryDesc NVARCHAR(MAX)) afl
		WHERE ISNULL(afl.CountryCode, '') <> ''
-- ------------------------------------------------------------------------------------------------------------------------------
		UNION ALL

		SELECT hdr.SourceSystemCode
			,aft.RegistrationCountryCode AS CountryCode
			,ISNULL(aft.RegistrationCountryDesc, '') AS CountryName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (Geography NVARCHAR(MAX) AS JSON) lob
		CROSS APPLY OPENJSON(lob.Geography) WITH (InsurableObject NVARCHAR(MAX) AS JSON) grg
		CROSS APPLY OPENJSON(grg.InsurableObject) WITH (Aircraft NVARCHAR(MAX) AS JSON) ino
		CROSS APPLY OPENJSON(ino.Aircraft) WITH (RegistrationCountryCode NVARCHAR(MAX), RegistrationCountryDesc NVARCHAR(MAX)) aft
		WHERE ISNULL(aft.RegistrationCountryCode, '') <> ''
-- ------------------------------------------------------------------------------------------------------------------------------
		UNION ALL

		SELECT hdr.SourceSystemCode
			,bda.CountryCode 
			,ISNULL(bda.CountryDesc, '') AS CountryName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (Geography NVARCHAR(MAX) AS JSON) lob
		CROSS APPLY OPENJSON(lob.Geography) WITH (InsurableObject NVARCHAR(MAX) AS JSON) grg
		CROSS APPLY OPENJSON(grg.InsurableObject) WITH (Property NVARCHAR(MAX) AS JSON) ino
		CROSS APPLY OPENJSON(ino.Property) WITH (Building NVARCHAR(MAX) AS JSON) prp
		CROSS APPLY OPENJSON(prp.Building) WITH (BuildingAddress NVARCHAR(MAX) AS JSON) bld
		CROSS APPLY OPENJSON(bld.BuildingAddress) WITH (CountryCode NVARCHAR(MAX), CountryDesc NVARCHAR(MAX)) bda
		WHERE ISNULL(bda.CountryCode, '') <> ''
-- ------------------------------------------------------------------------------------------------------------------------------
		UNION ALL

		SELECT hdr.SourceSystemCode
			,prp.CountryCode 
			,ISNULL(prp.CountryDesc, '') AS CountryName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (Geography NVARCHAR(MAX) AS JSON) lob
		CROSS APPLY OPENJSON(lob.Geography) WITH (InsurableObject NVARCHAR(MAX) AS JSON) grg
		CROSS APPLY OPENJSON(grg.InsurableObject) WITH (Property NVARCHAR(MAX) AS JSON) ino
		CROSS APPLY OPENJSON(ino.Property) WITH (CountryCode NVARCHAR(MAX), CountryDesc NVARCHAR(MAX)) prp
		WHERE ISNULL(prp.CountryCode, '') <> ''
-- ------------------------------------------------------------------------------------------------------------------------------
		UNION ALL

		SELECT hdr.SourceSystemCode
			,dwa.CountryCode 
			,ISNULL(dwa.CountryDesc, '') AS CountryName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (Geography NVARCHAR(MAX) AS JSON) lob
		CROSS APPLY OPENJSON(lob.Geography) WITH (InsurableObject NVARCHAR(MAX) AS JSON) grg
		CROSS APPLY OPENJSON(grg.InsurableObject) WITH (Property NVARCHAR(MAX) AS JSON) ino
		CROSS APPLY OPENJSON(ino.Property) WITH (Dwelling NVARCHAR(MAX) AS JSON) prp
		CROSS APPLY OPENJSON(prp.Dwelling) WITH (DwellingAddress NVARCHAR(MAX) AS JSON) dwl
		CROSS APPLY OPENJSON(dwl.DwellingAddress) WITH (CountryCode NVARCHAR(MAX), CountryDesc NVARCHAR(MAX)) dwa
		WHERE ISNULL(dwa.CountryCode, '') <> ''
-- ------------------------------------------------------------------------------------------------------------------------------
		UNION ALL

		SELECT hdr.SourceSystemCode
			,vhc.RegistrationCountryCode AS CountryCode 
			,ISNULL(vhc.RegistrationCountryDesc, '') AS CountryName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (Geography NVARCHAR(MAX) AS JSON) lob
		CROSS APPLY OPENJSON(lob.Geography) WITH (InsurableObject NVARCHAR(MAX) AS JSON) grg
		CROSS APPLY OPENJSON(grg.InsurableObject) WITH (Vehicle NVARCHAR(MAX) AS JSON) ino
		CROSS APPLY OPENJSON(ino.Vehicle) WITH (RegistrationCountryCode NVARCHAR(MAX), RegistrationCountryDesc NVARCHAR(MAX)) vhc
		WHERE ISNULL(vhc.RegistrationCountryCode, '') <> ''
-- ------------------------------------------------------------------------------------------------------------------------------
		UNION ALL

		SELECT hdr.SourceSystemCode
			,vhl.CountryCode 
			,ISNULL(vhl.CountryDesc, '') AS CountryName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (Geography NVARCHAR(MAX) AS JSON) lob
		CROSS APPLY OPENJSON(lob.Geography) WITH (InsurableObject NVARCHAR(MAX) AS JSON) grg
		CROSS APPLY OPENJSON(grg.InsurableObject) WITH (Vehicle NVARCHAR(MAX) AS JSON) ino
		CROSS APPLY OPENJSON(ino.Vehicle) WITH (VehicleLocation NVARCHAR(MAX) AS JSON) vhc
		CROSS APPLY OPENJSON(vhc.VehicleLocation) WITH (CountryCode NVARCHAR(MAX), CountryDesc NVARCHAR(MAX)) vhl
		WHERE ISNULL(vhl.CountryCode, '') <> ''
-- ------------------------------------------------------------------------------------------------------------------------------
		UNION ALL

		SELECT hdr.SourceSystemCode
			,vrg.CountryCode 
			,ISNULL(vrg.CountryDesc, '') AS CountryName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (Geography NVARCHAR(MAX) AS JSON) lob
		CROSS APPLY OPENJSON(lob.Geography) WITH (InsurableObject NVARCHAR(MAX) AS JSON) grg
		CROSS APPLY OPENJSON(grg.InsurableObject) WITH (Vehicle NVARCHAR(MAX) AS JSON) ino
		CROSS APPLY OPENJSON(ino.Vehicle) WITH (VehicleRegistration NVARCHAR(MAX) AS JSON) vhc
		CROSS APPLY OPENJSON(vhc.VehicleRegistration) WITH (CountryCode NVARCHAR(MAX), CountryDesc NVARCHAR(MAX)) vrg
		WHERE ISNULL(vrg.CountryCode, '') <> ''
-- ------------------------------------------------------------------------------------------------------------------------------
		UNION ALL

		SELECT hdr.SourceSystemCode
			,wtl.CountryCode 
			,ISNULL(wtl.CountryDesc, '') AS CountryName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (Geography NVARCHAR(MAX) AS JSON) lob
		CROSS APPLY OPENJSON(lob.Geography) WITH (InsurableObject NVARCHAR(MAX) AS JSON) grg
		CROSS APPLY OPENJSON(grg.InsurableObject) WITH (Watercraft NVARCHAR(MAX) AS JSON) ino
		CROSS APPLY OPENJSON(ino.Watercraft) WITH (WatercraftLocation NVARCHAR(MAX) AS JSON) wtc
		CROSS APPLY OPENJSON(wtc.WatercraftLocation) WITH (CountryCode NVARCHAR(MAX), CountryDesc NVARCHAR(MAX)) wtl
		WHERE ISNULL(wtl.CountryCode, '') <> ''

		) AS tmp
	) AS tpl
GO
