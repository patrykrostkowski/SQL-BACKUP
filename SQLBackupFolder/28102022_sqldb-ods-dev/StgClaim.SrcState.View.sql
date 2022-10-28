USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcState]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE    VIEW [StgClaim].[SrcState]
AS

SELECT SourceSystemCode
	,StateCode
	,StateName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, StateCode ORDER BY StateName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,cll.StateCode 
			,ISNULL(cll.StateDesc, '') AS StateName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (ClaimLocation NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.ClaimLocation) WITH (StateCode NVARCHAR(MAX), StateDesc NVARCHAR(MAX)) cll
		WHERE ISNULL(cll.StateCode, '') <> ''

UNION ALL

		SELECT hdr.SourceSystemCode
			,cll.VehicleStateCode AS StateCode 
			,ISNULL(cll.VehicleStateDesc, '') AS StateName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (Claimant NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.Claimant) WITH (VehicleStateDesc NVARCHAR(MAX), VehicleStateCode NVARCHAR(MAX)) cll
		WHERE ISNULL(cll.VehicleStateCode, '') <> ''

UNION ALL

		SELECT hdr.SourceSystemCode
			,pti.DriverLicenseStateCode AS StateCode 
			,ISNULL(pti.DriverLicenseStateDesc, '') AS StateName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (Claimant NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.Claimant) WITH (PartyInfo NVARCHAR(MAX) AS JSON) clt
		CROSS APPLY OPENJSON(clt.PartyInfo) WITH (DriverLicenseStateCode NVARCHAR(MAX), DriverLicenseStateDesc NVARCHAR(MAX)) pti
		WHERE ISNULL(pti.DriverLicenseStateCode, '') <> ''

UNION ALL

		SELECT hdr.SourceSystemCode
			,lea.StateCode AS StateCode 
			,ISNULL(lea.StateDesc, '') AS StateName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (LossEventAircraft NVARCHAR(MAX) AS JSON) lse
		CROSS APPLY OPENJSON(lse.LossEventAircraft) WITH (StateCode NVARCHAR(MAX), StateDesc NVARCHAR(MAX)) lea
		WHERE ISNULL(lea.StateCode, '') <> ''

UNION ALL

		SELECT hdr.SourceSystemCode
			,lpp.PropertyStateCode AS StateCode 
			,ISNULL(lpp.PropertyStateDesc, '') AS StateName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (LossEventPersonalProperty NVARCHAR(MAX) AS JSON) lep
		CROSS APPLY OPENJSON(lep.LossEventPersonalProperty) WITH (PropertyStateCode NVARCHAR(MAX), PropertyStateDesc NVARCHAR(MAX)) lpp
		WHERE ISNULL(lpp.PropertyStateCode, '') <> ''

UNION ALL

		SELECT hdr.SourceSystemCode
			,lpp.StateCode AS StateCode 
			,ISNULL(lpp.StateDesc, '') AS StateName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (LossEventWatercraft NVARCHAR(MAX) AS JSON) lep
		CROSS APPLY OPENJSON(lep.LossEventWatercraft) WITH (StateCode NVARCHAR(MAX), StateDesc NVARCHAR(MAX)) lpp
		WHERE ISNULL(lpp.StateCode, '') <> ''

UNION ALL

		SELECT hdr.SourceSystemCode
			,pti.DriverLicenseStateCode AS StateCode 
			,ISNULL(pti.DriverLicenseStateDesc, '') AS StateName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (MiscParty NVARCHAR(MAX) AS JSON) lev
		CROSS APPLY OPENJSON(lev.MiscParty) WITH (PartyInfo NVARCHAR(MAX) AS JSON) msp
		CROSS APPLY OPENJSON(msp.PartyInfo) WITH (DriverLicenseStateCode NVARCHAR(MAX), DriverLicenseStateDesc NVARCHAR(MAX)) pti
		WHERE ISNULL(pti.DriverLicenseStateCode, '') <> ''

UNION ALL

		SELECT hdr.SourceSystemCode
			,pta.StateCode AS StateCode 
			,ISNULL(pta.StateDesc, '') AS StateName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (MiscParty NVARCHAR(MAX) AS JSON) lev
		CROSS APPLY OPENJSON(lev.MiscParty) WITH (PartyInfo NVARCHAR(MAX) AS JSON) msp
		CROSS APPLY OPENJSON(msp.PartyInfo) WITH (PartyRole NVARCHAR(MAX) AS JSON) pti
		CROSS APPLY OPENJSON(pti.PartyRole) WITH (PartyAddress NVARCHAR(MAX) AS JSON) ptr
		CROSS APPLY OPENJSON(ptr.PartyAddress) WITH (StateCode NVARCHAR(MAX), StateDesc NVARCHAR(MAX)) pta
		WHERE ISNULL(pta.StateCode, '') <> ''

UNION ALL

		SELECT hdr.SourceSystemCode
			,lep.StateCode AS StateCode 
			,ISNULL(lep.StateDesc, '') AS StateName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (LossEventProperty NVARCHAR(MAX) AS JSON) lev
		CROSS APPLY OPENJSON(lev.LossEventProperty) WITH (StateCode NVARCHAR(MAX), StateDesc NVARCHAR(MAX)) lep
		WHERE ISNULL(lep.StateCode, '') <> ''

UNION ALL

		SELECT hdr.SourceSystemCode
			,pta.StateCode AS StateCode 
			,ISNULL(pta.StateDesc, '') AS StateName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (Claimant NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.Claimant) WITH (PartyInfo NVARCHAR(MAX) AS JSON) clt
		CROSS APPLY OPENJSON(clt.PartyInfo) WITH (PartyRole NVARCHAR(MAX) AS JSON) pti
		CROSS APPLY OPENJSON(pti.PartyRole) WITH (PartyAddress NVARCHAR(MAX) AS JSON) ptr
		CROSS APPLY OPENJSON(ptr.PartyAddress) WITH (StateCode NVARCHAR(MAX), StateDesc NVARCHAR(MAX)) pta
		WHERE ISNULL(pta.StateCode, '') <> ''

UNION ALL

		SELECT hdr.SourceSystemCode
			,pti.DriverLicenseStateCode AS StateCode 
			,ISNULL(pti.DriverLicenseStateDesc, '') AS StateName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (MiscParty NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.MiscParty) WITH (PartyInfo NVARCHAR(MAX) AS JSON) msp
		CROSS APPLY OPENJSON(msp.PartyInfo) WITH (DriverLicenseStateCode NVARCHAR(MAX), DriverLicenseStateDesc NVARCHAR(MAX)) pti
		WHERE ISNULL(pti.DriverLicenseStateCode, '') <> ''

UNION ALL

		SELECT hdr.SourceSystemCode
			,pta.StateCode AS StateCode 
			,ISNULL(pta.StateDesc, '') AS StateName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (MiscParty NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.MiscParty) WITH (PartyInfo NVARCHAR(MAX) AS JSON) msp
		CROSS APPLY OPENJSON(msp.PartyInfo) WITH (PartyRole NVARCHAR(MAX) AS JSON) pti
		CROSS APPLY OPENJSON(pti.PartyRole) WITH (PartyAddress NVARCHAR(MAX) AS JSON) ptr
		CROSS APPLY OPENJSON(ptr.PartyAddress) WITH (StateCode NVARCHAR(MAX), StateDesc NVARCHAR(MAX)) pta
		WHERE ISNULL(pta.StateCode, '') <> ''

UNION ALL

		SELECT hdr.SourceSystemCode
			,loc.StateCode AS StateCode 
			,ISNULL(loc.StateDesc, '') AS StateName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (LossOccurrence NVARCHAR(MAX) AS JSON) lev
		CROSS APPLY OPENJSON(lev.LossOccurrence) WITH (StateCode NVARCHAR(MAX), StateDesc NVARCHAR(MAX)) loc
		WHERE ISNULL(loc.StateCode, '') <> ''

UNION ALL

		SELECT hdr.SourceSystemCode
			,pti.DriverLicenseStateCode AS StateCode 
			,ISNULL(pti.DriverLicenseStateDesc, '') AS StateName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (LossOccurrence NVARCHAR(MAX) AS JSON) lev
		CROSS APPLY OPENJSON(lev.LossOccurrence) WITH (MiscParty NVARCHAR(MAX) AS JSON) loc
		CROSS APPLY OPENJSON(loc.MiscParty) WITH (PartyInfo NVARCHAR(MAX) AS JSON) msp
		CROSS APPLY OPENJSON(msp.PartyInfo) WITH (DriverLicenseStateCode NVARCHAR(MAX), DriverLicenseStateDesc NVARCHAR(MAX)) pti
		WHERE ISNULL(pti.DriverLicenseStateCode, '') <> ''

UNION ALL

		SELECT hdr.SourceSystemCode
			,pta.StateCode AS StateCode 
			,ISNULL(pta.StateDesc, '') AS StateName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (LossOccurrence NVARCHAR(MAX) AS JSON) lev
		CROSS APPLY OPENJSON(lev.LossOccurrence) WITH (MiscParty NVARCHAR(MAX) AS JSON) loc
		CROSS APPLY OPENJSON(loc.MiscParty) WITH (PartyInfo NVARCHAR(MAX) AS JSON) msp
		CROSS APPLY OPENJSON(msp.PartyInfo) WITH (PartyRole NVARCHAR(MAX) AS JSON) pti
		CROSS APPLY OPENJSON(pti.PartyRole) WITH (PartyAddress NVARCHAR(MAX) AS JSON) ptr
		CROSS APPLY OPENJSON(ptr.PartyAddress) WITH (StateCode NVARCHAR(MAX), StateDesc NVARCHAR(MAX)) pta
		WHERE ISNULL(pta.StateCode, '') <> ''



		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
