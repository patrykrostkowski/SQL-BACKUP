USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcOwnershipType]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcOwnershipType]
AS

SELECT SourceSystemCode
	,OwnershipTypeCode
	,OwnershipTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, OwnershipTypeCode ORDER BY OwnershipTypeName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,pti.OwnershipTypeCode
			,ISNULL(pti.OwnershipTypeDesc, '') AS OwnershipTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (Claimant NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.Claimant) WITH (PartyInfo NVARCHAR(MAX) AS JSON) clt
		CROSS APPLY OPENJSON(clt.PartyInfo) WITH (OwnershipTypeCode NVARCHAR(MAX), OwnershipTypeDesc NVARCHAR(MAX)) pti

		WHERE ISNULL(pti.OwnershipTypeCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,pti.OwnershipTypeCode
			,ISNULL(pti.OwnershipTypeDesc, '') AS OwnershipTypeName
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
		CROSS APPLY OPENJSON(msp.PartyInfo) WITH (OwnershipTypeCode NVARCHAR(MAX), OwnershipTypeDesc NVARCHAR(MAX)) pti

		WHERE ISNULL(pti.OwnershipTypeCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,pti.OwnershipTypeCode
			,ISNULL(pti.OwnershipTypeDesc, '') AS OwnershipTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (MiscParty NVARCHAR(MAX) AS JSON) loe
		CROSS APPLY OPENJSON(loe.MiscParty) WITH (PartyInfo NVARCHAR(MAX) AS JSON) msp
		CROSS APPLY OPENJSON(msp.PartyInfo) WITH (OwnershipTypeCode NVARCHAR(MAX), OwnershipTypeDesc NVARCHAR(MAX)) pti

		WHERE ISNULL(pti.OwnershipTypeCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,pti.OwnershipTypeCode
			,ISNULL(pti.OwnershipTypeDesc, '') AS OwnershipTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (MiscParty NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.MiscParty) WITH (PartyInfo NVARCHAR(MAX) AS JSON) msp
		CROSS APPLY OPENJSON(msp.PartyInfo) WITH (OwnershipTypeCode NVARCHAR(MAX), OwnershipTypeDesc NVARCHAR(MAX)) pti

		WHERE ISNULL(pti.OwnershipTypeCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
