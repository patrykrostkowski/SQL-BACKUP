USE [DataMagnifier]
GO
/****** Object:  View [StgPolicy].[SrcState]    Script Date: 02.11.2022 14:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* FOR 
	DomicileStateSK
	StateSK
	RegistrationStateSK
	RegisteredStateCode
	DriverLicenseStateSK
	PreviousLicenseStateSK
	PreviousLicensedStateSK
*/

CREATE VIEW [StgPolicy].[SrcState]
AS
SELECT SourceSystemCode
	,StateCode
	,StateName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, StateCode ORDER BY StateName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,pol.DomicileStateCode AS StateCode
			,ISNULL(pol.DomicileStateDesc, '') AS StateName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (DomicileStateCode NVARCHAR(MAX), DomicileStateDesc NVARCHAR(MAX)) pol	
		WHERE ISNULL(pol.DomicileStateCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,ins.DomicileStateCode AS StateCode
			,ISNULL(ins.DomicileStateDesc, '') AS StateName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (Insured NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.Insured) WITH (DomicileStateCode NVARCHAR(MAX), DomicileStateDesc NVARCHAR(MAX)) ins	
		WHERE ISNULL(ins.DomicileStateCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,plt.DomicileStateCode AS StateCode
			,ISNULL(plt.DomicileStateDesc, '') AS StateName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (DomicileStateCode NVARCHAR(MAX), DomicileStateDesc NVARCHAR(MAX)) plt	
		WHERE ISNULL(plt.DomicileStateCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,acf.RegistrationStateCode AS StateCode
			,ISNULL(acf.RegistrationStateDesc, '') AS StateName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (Geography NVARCHAR(MAX) AS JSON) lob
		CROSS APPLY OPENJSON(lob.Geography) WITH (InsurableObject NVARCHAR(MAX) AS JSON)  grg
		CROSS APPLY OPENJSON(grg.InsurableObject) WITH (Aircraft NVARCHAR(MAX) AS JSON) ino
		CROSS APPLY OPENJSON(ino.Aircraft) WITH (RegistrationStateCode NVARCHAR(MAX), RegistrationStateDesc NVARCHAR(MAX)) acf	
		WHERE ISNULL(acf.RegistrationStateCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,pti.DriverLicenseStateCode AS StateCode
			,ISNULL(pti.DriverLicenseStateDesc, '') AS StateName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (Account NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.Account) WITH (PartyInfo NVARCHAR(MAX) AS JSON) acc
		CROSS APPLY OPENJSON(acc.PartyInfo) WITH (DriverLicenseStateCode NVARCHAR(MAX), DriverLicenseStateDesc NVARCHAR(MAX)) pti
		WHERE ISNULL(pti.DriverLicenseStateCode, '') <> ''
		
		UNION ALL

		SELECT hdr.SourceSystemCode
			,pta.StateCode AS StateCode
			,ISNULL(pta.StateDesc, '') AS StateName
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
		CROSS APPLY OPENJSON(ptr.PartyAddress) WITH (StateCode NVARCHAR(MAX), StateDesc NVARCHAR(MAX)) pta
		WHERE ISNULL(pta.StateCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,pti.DriverLicenseStateCode AS StateCode
			,ISNULL(pti.DriverLicenseStateDesc, '') AS StateName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (Agency NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.Agency) WITH (PartyInfo NVARCHAR(MAX) AS JSON) acc
		CROSS APPLY OPENJSON(acc.PartyInfo) WITH (DriverLicenseStateCode NVARCHAR(MAX), DriverLicenseStateDesc NVARCHAR(MAX)) pti	
		WHERE ISNULL(pti.DriverLicenseStateCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,pta.StateCode AS StateCode
			,ISNULL(pta.StateDesc, '') AS StateName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (Agency NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.Agency) WITH (PartyInfo NVARCHAR(MAX) AS JSON) acc
		CROSS APPLY OPENJSON(acc.PartyInfo) WITH (PartyRole NVARCHAR(MAX) AS JSON) pti	
		CROSS APPLY OPENJSON(pti.PartyRole) WITH (PartyAddress NVARCHAR(MAX) AS JSON) ptr
		CROSS APPLY OPENJSON(ptr.PartyAddress) WITH (StateCode NVARCHAR(MAX), StateDesc NVARCHAR(MAX)) pta
		WHERE ISNULL(pta.StateCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,pti.DriverLicenseStateCode AS StateCode
			,ISNULL(pti.DriverLicenseStateDesc, '') AS StateName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (Insured NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.Insured) WITH (PartyInfo NVARCHAR(MAX) AS JSON) ins
		CROSS APPLY OPENJSON(ins.PartyInfo) WITH (DriverLicenseStateCode NVARCHAR(MAX), DriverLicenseStateDesc NVARCHAR(MAX)) pti
		WHERE ISNULL(pti.DriverLicenseStateCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,pti.DriverLicenseStateCode AS StateCode
			,ISNULL(pti.DriverLicenseStateDesc, '') AS StateName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (MiscParty NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.MiscParty) WITH (PartyInfo NVARCHAR(MAX) AS JSON) msp
		CROSS APPLY OPENJSON(msp.PartyInfo) WITH (DriverLicenseStateCode NVARCHAR(MAX), DriverLicenseStateDesc NVARCHAR(MAX)) pti
		WHERE ISNULL(pti.DriverLicenseStateCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,dld.PreviousLicensedStateCode AS StateCode
			,ISNULL(dld.PreviousLicensedStateDesc, '') AS StateName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (MiscParty NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.MiscParty) WITH (PartyInfo NVARCHAR(MAX) AS JSON) msp
		CROSS APPLY OPENJSON(msp.PartyInfo) WITH (PartyRole NVARCHAR(MAX) AS JSON) pti
		CROSS APPLY OPENJSON(pti.PartyRole) WITH (Driver NVARCHAR(MAX) AS JSON) ptr
		CROSS APPLY OPENJSON(ptr.Driver) WITH (DriverLicenseDetail NVARCHAR(MAX) AS JSON) drv
		CROSS APPLY OPENJSON(drv.DriverLicenseDetail) WITH (PreviousLicensedStateCode NVARCHAR(MAX), PreviousLicensedStateDesc NVARCHAR(MAX)) dld
		WHERE ISNULL(dld.PreviousLicensedStateCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,drv.DriverLicenseState AS StateCode
			,ISNULL(drv.DriverLicenseStateDesc, '') AS StateName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (MiscParty NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.MiscParty) WITH (PartyInfo NVARCHAR(MAX) AS JSON) msp
		CROSS APPLY OPENJSON(msp.PartyInfo) WITH (PartyRole NVARCHAR(MAX) AS JSON) pti
		CROSS APPLY OPENJSON(pti.PartyRole) WITH (Driver NVARCHAR(MAX) AS JSON) ptr
		CROSS APPLY OPENJSON(ptr.Driver) WITH (DriverLicenseState NVARCHAR(MAX), DriverLicenseStateDesc NVARCHAR(MAX)) drv
		WHERE ISNULL(drv.DriverLicenseState, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,pta.StateCode AS StateCode
			,ISNULL(pta.StateDesc, '') AS StateName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (MiscParty NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.MiscParty) WITH (PartyInfo NVARCHAR(MAX) AS JSON) msp
		CROSS APPLY OPENJSON(msp.PartyInfo) WITH (PartyRole NVARCHAR(MAX) AS JSON) pti
		CROSS APPLY OPENJSON(pti.PartyRole) WITH (PartyAddress NVARCHAR(MAX) AS JSON) ptr
		CROSS APPLY OPENJSON(ptr.PartyAddress) WITH (StateCode NVARCHAR(MAX), StateDesc NVARCHAR(MAX)) pta
		WHERE ISNULL(pta.StateCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,dld.StateCode AS StateCode
			,ISNULL(dld.StateDesc, '') AS StateName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (MiscParty NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.MiscParty) WITH (PartyInfo NVARCHAR(MAX) AS JSON) msp
		CROSS APPLY OPENJSON(msp.PartyInfo) WITH (PartyRole NVARCHAR(MAX) AS JSON) pti
		CROSS APPLY OPENJSON(pti.PartyRole) WITH (Driver NVARCHAR(MAX) AS JSON) ptr
		CROSS APPLY OPENJSON(ptr.Driver) WITH (DriverLicenseDetail NVARCHAR(MAX) AS JSON) drv
		CROSS APPLY OPENJSON(drv.DriverLicenseDetail) WITH (StateCode NVARCHAR(MAX), StateDesc NVARCHAR(MAX)) dld
		WHERE ISNULL(dld.StateCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,acl.StateCode AS StateCode
			,ISNULL(acl.StateDesc, '') AS StateName
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
		CROSS APPLY OPENJSON(ino.Aircraft) WITH (AircraftLocation NVARCHAR(MAX) AS JSON) acf
		CROSS APPLY OPENJSON(acf.AircraftLocation) WITH (StateCode NVARCHAR(MAX), StateDesc NVARCHAR(MAX)) acl
		WHERE ISNULL(acl.StateCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,bla.StateCode AS StateCode
			,ISNULL(bla.StateDesc, '') AS StateName
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
		CROSS APPLY OPENJSON(bld.BuildingAddress) WITH (StateCode NVARCHAR(MAX), StateDesc NVARCHAR(MAX)) bla
		WHERE ISNULL(bla.StateCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,dwa.StateCode AS StateCode
			,ISNULL(dwa.StateDesc, '') AS StateName
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
		CROSS APPLY OPENJSON(prp.Dwelling) WITH (DwellingAddress NVARCHAR(MAX) AS JSON) dwe
		CROSS APPLY OPENJSON(dwe.DwellingAddress) WITH (StateCode NVARCHAR(MAX), StateDesc NVARCHAR(MAX)) dwa
		WHERE ISNULL(dwa.StateCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,prp.StateCode AS StateCode
			,ISNULL(prp.StateDesc, '') AS StateName
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
		CROSS APPLY OPENJSON(ino.Property) WITH (StateCode NVARCHAR(MAX), StateDesc NVARCHAR(MAX)) prp
		WHERE ISNULL(prp.StateCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,vhc.RegistrationStateCode AS StateCode
			,ISNULL(vhc.RegistrationStateDesc, '') AS StateName
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
		CROSS APPLY OPENJSON(ino.Vehicle) WITH (RegistrationStateCode NVARCHAR(MAX), RegistrationStateDesc NVARCHAR(MAX)) vhc
		WHERE ISNULL(vhc.RegistrationStateCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,vhl.StateCode AS StateCode
			,ISNULL(vhl.StateDesc, '') AS StateName
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
		CROSS APPLY OPENJSON(vhc.VehicleLocation) WITH (StateCode NVARCHAR(MAX), StateDesc NVARCHAR(MAX)) vhl
		WHERE ISNULL(vhl.StateCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,vhr.StateCode AS StateCode
			,ISNULL(vhr.StateDesc, '') AS StateName
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
		CROSS APPLY OPENJSON(vhc.VehicleRegistration) WITH (StateCode NVARCHAR(MAX), StateDesc NVARCHAR(MAX)) vhr
		WHERE ISNULL(vhr.StateCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,wtl.StateCode AS StateCode
			,ISNULL(wtl.StateDesc, '') AS StateName
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
		CROSS APPLY OPENJSON(wtc.WatercraftLocation) WITH (StateCode NVARCHAR(MAX), StateDesc NVARCHAR(MAX)) wtl
		WHERE ISNULL(wtl.StateCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,grg.StateCode AS StateCode
			,ISNULL(grg.StateDesc, '') AS StateName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (Geography NVARCHAR(MAX) AS JSON) lob
		CROSS APPLY OPENJSON(lob.Geography) WITH (StateCode NVARCHAR(MAX), StateDesc NVARCHAR(MAX)) grg
		WHERE ISNULL(grg.StateCode, '') <> ''

		) AS tmp
	) AS tpl
GO
