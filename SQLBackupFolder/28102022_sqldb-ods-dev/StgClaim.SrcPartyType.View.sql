USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcPartyType]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE   VIEW [StgClaim].[SrcPartyType]
AS

SELECT SourceSystemCode
	,PartyTypeCode
	,PartyTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, PartyTypeCode ORDER BY PartyTypeName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,pti.PartyTypeCode
			,ISNULL(pti.PartyTypeDesc, '') AS PartyTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (Claimant NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.Claimant) WITH (PartyInfo NVARCHAR(MAX) AS JSON) clt
		CROSS APPLY OPENJSON(clt.PartyInfo) WITH (PartyTypeCode NVARCHAR(MAX), PartyTypeDesc NVARCHAR(MAX)) pti

		WHERE ISNULL(pti.PartyTypeCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,pti.PartyTypeCode
			,ISNULL(pti.PartyTypeDesc, '') AS PartyTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (LossOccurrence NVARCHAR(MAX) AS JSON) loe
		CROSS APPLY OPENJSON(loe.LossOccurrence) WITH (MiscParty NVARCHAR(MAX) AS JSON) loo
		CROSS APPLY OPENJSON(loo.MiscParty) WITH (PartyInfo NVARCHAR(MAX) AS JSON) msp
		CROSS APPLY OPENJSON(msp.PartyInfo) WITH (PartyTypeCode NVARCHAR(MAX), PartyTypeDesc NVARCHAR(MAX)) pti

		WHERE ISNULL(pti.PartyTypeCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,pti.PartyTypeCode
			,ISNULL(pti.PartyTypeDesc, '') AS PartyTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (MiscParty NVARCHAR(MAX) AS JSON) loe
		CROSS APPLY OPENJSON(loe.MiscParty) WITH (PartyInfo NVARCHAR(MAX) AS JSON) msp
		CROSS APPLY OPENJSON(msp.PartyInfo) WITH (PartyTypeCode NVARCHAR(MAX), PartyTypeDesc NVARCHAR(MAX)) pti

		WHERE ISNULL(pti.PartyTypeCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,pti.PartyTypeCode
			,ISNULL(pti.PartyTypeDesc, '') AS PartyTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (MiscParty NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.MiscParty) WITH (PartyInfo NVARCHAR(MAX) AS JSON) msp
		CROSS APPLY OPENJSON(msp.PartyInfo) WITH (PartyTypeCode NVARCHAR(MAX), PartyTypeDesc NVARCHAR(MAX)) pti

		WHERE ISNULL(pti.PartyTypeCode, '') <> ''

		UNION ALL
-- ## added pr
		SELECT hdr.SourceSystemCode
			,'Organisation' AS PartyTypeCode
			,'OrganisationName' AS PartyTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr


		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
