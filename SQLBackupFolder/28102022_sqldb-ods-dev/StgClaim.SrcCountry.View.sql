USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcCountry]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcCountry]
AS

SELECT SourceSystemCode
	,CountryCode
	,CountryName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, CountryCode ORDER BY CountryName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,cll.CountryCode
			,ISNULL(cll.CountryDesc, '') AS CountryName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (ClaimLocation NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.ClaimLocation) WITH (CountryCode NVARCHAR(MAX), CountryDesc NVARCHAR(MAX)) cll
		WHERE ISNULL(cll.CountryCode, '') <> ''

	UNION ALL

		SELECT hdr.SourceSystemCode
			,lea.CountryCode
			,ISNULL(lea.CountryDesc, '') AS CountryName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (LossEventAircraft NVARCHAR(MAX) AS JSON) lev
		CROSS APPLY OPENJSON(lev.LossEventAircraft) WITH (CountryCode NVARCHAR(MAX), CountryDesc NVARCHAR(MAX)) lea
		WHERE ISNULL(lea.CountryCode, '') <> ''

	UNION ALL

		SELECT hdr.SourceSystemCode
			,pta.CountryCode
			,ISNULL(pta.CountryDesc, '') AS CountryName
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
		CROSS APPLY OPENJSON(ptr.PartyAddress) WITH (CountryCode NVARCHAR(MAX), CountryDesc NVARCHAR(MAX)) pta
		WHERE ISNULL(pta.CountryCode, '') <> ''

	UNION ALL

		SELECT hdr.SourceSystemCode
			,lep.PropertyCountryCode AS CountryCode
			,ISNULL(lep.PropertyCountryDesc, '') AS CountryName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (LossEventPersonalProperty NVARCHAR(MAX) AS JSON) lev
		CROSS APPLY OPENJSON(lev.LossEventPersonalProperty) WITH (PropertyCountryCode NVARCHAR(MAX), PropertyCountryDesc NVARCHAR(MAX)) lep
		WHERE ISNULL(lep.PropertyCountryCode, '') <> ''

	UNION ALL

		SELECT hdr.SourceSystemCode
			,lew.CountryCode AS CountryCode
			,ISNULL(lew.CountryDesc, '') AS CountryName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (LossEventWatercraft NVARCHAR(MAX) AS JSON) lev
		CROSS APPLY OPENJSON(lev.LossEventWatercraft) WITH (CountryCode NVARCHAR(MAX), CountryDesc NVARCHAR(MAX)) lew
		WHERE ISNULL(lew.CountryCode, '') <> ''

	UNION ALL

		SELECT hdr.SourceSystemCode
			,pta.CountryCode AS CountryCode
			,ISNULL(pta.CountryDesc, '') AS CountryName
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
		CROSS APPLY OPENJSON(ptr.PartyAddress) WITH (CountryCode NVARCHAR(MAX), CountryDesc NVARCHAR(MAX)) pta
		WHERE ISNULL(pta.CountryCode, '') <> ''

	UNION ALL

		SELECT hdr.SourceSystemCode
			,pta.CountryCode AS CountryCode
			,ISNULL(pta.CountryDesc, '') AS CountryName
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
		CROSS APPLY OPENJSON(ptr.PartyAddress) WITH (CountryCode NVARCHAR(MAX), CountryDesc NVARCHAR(MAX)) pta
		WHERE ISNULL(pta.CountryCode, '') <> ''

	UNION ALL

		SELECT hdr.SourceSystemCode
			,lep.CountryCode AS CountryCode
			,ISNULL(lep.CountryDesc, '') AS CountryName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (LossEventProperty NVARCHAR(MAX) AS JSON) lev
		CROSS APPLY OPENJSON(lev.LossEventProperty) WITH (CountryCode NVARCHAR(MAX), CountryDesc NVARCHAR(MAX)) lep
		WHERE ISNULL(lep.CountryCode, '') <> ''

	UNION ALL

		SELECT hdr.SourceSystemCode
			,ctz.CountryCode AS CountryCode
			,ISNULL(ctz.CountryDesc, '') AS CountryName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (Catastrophe NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.Catastrophe) WITH (CatastropheZone NVARCHAR(MAX) AS JSON) cts
		CROSS APPLY OPENJSON(cts.CatastropheZone) WITH (CountryCode NVARCHAR(MAX), CountryDesc NVARCHAR(MAX)) ctz
		WHERE ISNULL(ctz.CountryCode, '') <> ''

	UNION ALL

		SELECT hdr.SourceSystemCode
			,pta.CountryCode AS CountryCode
			,ISNULL(pta.CountryDesc, '') AS CountryName
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
		CROSS APPLY OPENJSON(ptr.PartyAddress) WITH (CountryCode NVARCHAR(MAX), CountryDesc NVARCHAR(MAX)) pta
		WHERE ISNULL(pta.CountryCode, '') <> ''

	UNION ALL

		SELECT hdr.SourceSystemCode
			,pta.CountryCode AS CountryCode
			,ISNULL(pta.CountryDesc, '') AS CountryName
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
		CROSS APPLY OPENJSON(ptr.PartyAddress) WITH (CountryCode NVARCHAR(MAX), CountryDesc NVARCHAR(MAX)) pta
		WHERE ISNULL(pta.CountryCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
