USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcPartyRole]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcPartyRole]
AS

SELECT SourceSystemCode
	,PartyRoleCode
	,PartyRoleName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, PartyRoleCode ORDER BY PartyRoleName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,ptr.PartyRoleCode
			,ISNULL(ptr.PartyRoleDesc, '') AS PartyRoleName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (Claimant NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.Claimant) WITH (PartyInfo NVARCHAR(MAX) AS JSON) clt
		CROSS APPLY OPENJSON(clt.PartyInfo) WITH (PartyRole NVARCHAR(MAX) AS JSON) pti
		CROSS APPLY OPENJSON(pti.PartyRole) WITH (PartyRoleCode NVARCHAR(MAX), PartyRoleDesc NVARCHAR(MAX)) ptr

		WHERE ISNULL(ptr.PartyRoleCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,ptr.PartyRoleCode
			,ISNULL(ptr.PartyRoleDesc, '') AS PartyRoleName
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
		CROSS APPLY OPENJSON(msp.PartyInfo) WITH (PartyRole NVARCHAR(MAX) AS JSON) pti
		CROSS APPLY OPENJSON(pti.PartyRole) WITH (PartyRoleCode NVARCHAR(MAX), PartyRoleDesc NVARCHAR(MAX)) ptr

		WHERE ISNULL(ptr.PartyRoleCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,ptr.PartyRoleCode
			,ISNULL(ptr.PartyRoleDesc, '') AS PartyRoleName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (MiscParty NVARCHAR(MAX) AS JSON) loe
		CROSS APPLY OPENJSON(loe.MiscParty) WITH (PartyInfo NVARCHAR(MAX) AS JSON) msp
		CROSS APPLY OPENJSON(msp.PartyInfo) WITH (PartyRole NVARCHAR(MAX) AS JSON) pti
		CROSS APPLY OPENJSON(pti.PartyRole) WITH (PartyRoleCode NVARCHAR(MAX), PartyRoleDesc NVARCHAR(MAX)) ptr
		WHERE ISNULL(ptr.PartyRoleCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,ptr.PartyRoleCode
			,ISNULL(ptr.PartyRoleDesc, '') AS PartyRoleName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (MiscParty NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.MiscParty) WITH (PartyInfo NVARCHAR(MAX) AS JSON) msp
		CROSS APPLY OPENJSON(msp.PartyInfo) WITH (PartyRole NVARCHAR(MAX) AS JSON) pti
		CROSS APPLY OPENJSON(pti.PartyRole) WITH (PartyRoleCode NVARCHAR(MAX), PartyRoleDesc NVARCHAR(MAX)) ptr
		WHERE ISNULL(ptr.PartyRoleCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
