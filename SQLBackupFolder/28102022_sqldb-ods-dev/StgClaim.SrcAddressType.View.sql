USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcAddressType]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [StgClaim].[SrcAddressType]
AS
SELECT SourceSystemCode
	,AddressTypeCode
	,AddressTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, AddressTypeCode ORDER BY AddressTypeName DESC) AS rn
	FROM (
	   	SELECT hdr.SourceSystemCode
			,pta.AddressTypeCode
			,ISNULL(pta.AddressTypeDesc, '') AS AddressTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (Claimant NVARCHAR(MAX) AS JSON) clm	
		CROSS APPLY OPENJSON(clm.Claimant) WITH (PartyInfo NVARCHAR(MAX) AS JSON) clt
		CROSS APPLY OPENJSON(clt.PartyInfo) WITH (PartyRole NVARCHAR(MAX) AS JSON) pti
		CROSS APPLY OPENJSON(pti.PartyRole) WITH (PartyAddress NVARCHAR(MAX) AS JSON) ptr
		CROSS APPLY OPENJSON(ptr.PartyAddress) WITH (AddressTypeCode NVARCHAR(MAX), AddressTypeDesc NVARCHAR(MAX)) pta
		WHERE ISNULL(pta.AddressTypeCode, '') <> ''

		UNION ALL 

		SELECT hdr.SourceSystemCode
			,cll.AddressTypeCode
			,ISNULL(cll.AddressTypeDesc, '') AS AddressTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (ClaimLocation NVARCHAR(MAX) AS JSON) clm	
		CROSS APPLY OPENJSON(clm.ClaimLocation) WITH (AddressTypeCode NVARCHAR(MAX), AddressTypeDesc NVARCHAR(MAX)) cll		
		WHERE ISNULL(cll.AddressTypeCode, '') <> ''

		UNION ALL 

		SELECT hdr.SourceSystemCode
			,pta.AddressTypeCode
			,ISNULL(pta.AddressTypeDesc, '') AS AddressTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm	
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (LossOccurrence NVARCHAR(MAX) AS JSON) los
		CROSS APPLY OPENJSON(los.LossOccurrence) WITH (MiscParty NVARCHAR(MAX) AS JSON) loo
		CROSS APPLY OPENJSON(loo.MiscParty) WITH (PartyInfo NVARCHAR(MAX) AS JSON) msc
		CROSS APPLY OPENJSON(msc.PartyInfo) WITH (PartyRole NVARCHAR(MAX) AS JSON) pti
		CROSS APPLY OPENJSON(pti.PartyRole) WITH (PartyAddress NVARCHAR(MAX) AS JSON) ptr
		CROSS APPLY OPENJSON(ptr.PartyAddress) WITH (AddressTypeCode NVARCHAR(MAX), AddressTypeDesc NVARCHAR(MAX)) pta
		WHERE ISNULL(pta.AddressTypeCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,pta.AddressTypeCode
			,ISNULL(pta.AddressTypeDesc, '') AS AddressTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm	
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (MiscParty NVARCHAR(MAX) AS JSON) los
		CROSS APPLY OPENJSON(los.MiscParty) WITH (PartyInfo NVARCHAR(MAX) AS JSON) msc
		CROSS APPLY OPENJSON(msc.PartyInfo) WITH (PartyRole NVARCHAR(MAX) AS JSON) pti
		CROSS APPLY OPENJSON(pti.PartyRole) WITH (PartyAddress NVARCHAR(MAX) AS JSON) ptr
		CROSS APPLY OPENJSON(ptr.PartyAddress) WITH (AddressTypeCode NVARCHAR(MAX), AddressTypeDesc NVARCHAR(MAX)) pta
		WHERE ISNULL(pta.AddressTypeCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,pta.AddressTypeCode
			,ISNULL(pta.AddressTypeDesc, '') AS AddressTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (MiscParty NVARCHAR(MAX) AS JSON) clm		
		CROSS APPLY OPENJSON(clm.MiscParty) WITH (PartyInfo NVARCHAR(MAX) AS JSON) msc
		CROSS APPLY OPENJSON(msc.PartyInfo) WITH (PartyRole NVARCHAR(MAX) AS JSON) pti
		CROSS APPLY OPENJSON(pti.PartyRole) WITH (PartyAddress NVARCHAR(MAX) AS JSON) ptr
		CROSS APPLY OPENJSON(ptr.PartyAddress) WITH (AddressTypeCode NVARCHAR(MAX), AddressTypeDesc NVARCHAR(MAX)) pta
		WHERE ISNULL(pta.AddressTypeCode, '') <> ''


		) AS tmp
	) AS tpl
	where tpl.rn = 1




GO
