USE [DataMagnifier]
GO
/****** Object:  View [StgPolicy].[SrcPhoneType]    Script Date: 10.11.2022 13:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [StgPolicy].[SrcPhoneType]
AS
SELECT SourceSystemCode
	,PhoneTypeCode
	,PhoneTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, PhoneTypeCode ORDER BY PhoneTypeName DESC) AS rn
	FROM (
		-- Account
		SELECT hdr.SourceSystemCode
			,ptp.PhoneTypeCode
			,ISNULL(ptp.PhoneTypeDesc, '') AS PhoneTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (Account NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.Account) WITH (PartyInfo NVARCHAR(MAX) AS JSON) acc
		CROSS APPLY OPENJSON(acc.PartyInfo) WITH (PartyRole NVARCHAR(MAX) AS JSON) pti
		CROSS APPLY OPENJSON(pti.PartyRole) WITH (PartyPhone NVARCHAR(MAX) AS JSON) ptr
		CROSS APPLY OPENJSON(ptr.PartyPhone) WITH (
				PhoneTypeCode NVARCHAR(MAX)
				,PhoneTypeDesc NVARCHAR(MAX)
				) ptp
		WHERE ISNULL(ptp.PhoneTypeCode, '') <> ''
	
		UNION ALL
	
		-- Insured
		SELECT hdr.SourceSystemCode
			,ptp.PhoneTypeCode
			,ISNULL(ptp.PhoneTypeDesc, '') AS PhoneTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (Insured NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.Insured) WITH (PartyInfo NVARCHAR(MAX) AS JSON) ins
		CROSS APPLY OPENJSON(ins.PartyInfo) WITH (PartyRole NVARCHAR(MAX) AS JSON) pti
		CROSS APPLY OPENJSON(pti.PartyRole) WITH (PartyPhone NVARCHAR(MAX) AS JSON) ptr
		CROSS APPLY OPENJSON(ptr.PartyPhone) WITH (
				PhoneTypeCode NVARCHAR(MAX)
				,PhoneTypeDesc NVARCHAR(MAX)
				) ptp
		WHERE ISNULL(ptp.PhoneTypeCode, '') <> ''
	
		UNION ALL
	
		-- Agency
		SELECT hdr.SourceSystemCode
			,ptp.PhoneTypeCode
			,ISNULL(ptp.PhoneTypeDesc, '') AS PhoneTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (Agency NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.Agency) WITH (PartyInfo NVARCHAR(MAX) AS JSON) agc
		CROSS APPLY OPENJSON(agc.PartyInfo) WITH (PartyRole NVARCHAR(MAX) AS JSON) pti
		CROSS APPLY OPENJSON(pti.PartyRole) WITH (PartyPhone NVARCHAR(MAX) AS JSON) ptr
		CROSS APPLY OPENJSON(ptr.PartyPhone) WITH (
				PhoneTypeCode NVARCHAR(MAX)
				,PhoneTypeDesc NVARCHAR(MAX)
				) ptp
		WHERE ISNULL(ptp.PhoneTypeCode, '') <> ''
	
		UNION ALL
	
		-- MiscParty
		SELECT hdr.SourceSystemCode
			,ptp.PhoneTypeCode
			,ISNULL(ptp.PhoneTypeDesc, '') AS PhoneTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (MiscParty NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.MiscParty) WITH (PartyInfo NVARCHAR(MAX) AS JSON) msp
		CROSS APPLY OPENJSON(msp.PartyInfo) WITH (PartyRole NVARCHAR(MAX) AS JSON) pti
		CROSS APPLY OPENJSON(pti.PartyRole) WITH (PartyPhone NVARCHAR(MAX) AS JSON) ptr
		CROSS APPLY OPENJSON(ptr.PartyPhone) WITH (
				PhoneTypeCode NVARCHAR(MAX)
				,PhoneTypeDesc NVARCHAR(MAX)
				) ptp
		WHERE ISNULL(ptp.PhoneTypeCode, '') <> ''
		) AS tmp
	) tpl

GO
