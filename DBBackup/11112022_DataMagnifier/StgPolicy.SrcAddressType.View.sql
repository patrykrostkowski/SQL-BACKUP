USE [DataMagnifier]
GO
/****** Object:  View [StgPolicy].[SrcAddressType]    Script Date: 12.11.2022 09:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[StgPolicy].[SrcAddressType]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [StgPolicy].[SrcAddressType]
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
			,ISNULL(pta.AddressTypeDesc, '''') AS AddressTypeName
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
		CROSS APPLY OPENJSON(ptr.PartyAddress) WITH (AddressTypeCode NVARCHAR(MAX), AddressTypeDesc NVARCHAR(MAX)) pta
		WHERE ISNULL(pta.AddressTypeCode, '''') <> ''''

		UNION ALL 

		SELECT hdr.SourceSystemCode
			,pta.AddressTypeCode
			,ISNULL(pta.AddressTypeDesc, '''') AS AddressTypeName
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
		CROSS APPLY OPENJSON(ptr.PartyAddress) WITH (AddressTypeCode NVARCHAR(MAX), AddressTypeDesc NVARCHAR(MAX)) pta
		WHERE ISNULL(pta.AddressTypeCode, '''') <> ''''

		UNION ALL 

		SELECT hdr.SourceSystemCode
			,pta.AddressTypeCode
			,ISNULL(pta.AddressTypeDesc, '''') AS AddressTypeName
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
		CROSS APPLY OPENJSON(ptr.PartyAddress) WITH (AddressTypeCode NVARCHAR(MAX), AddressTypeDesc NVARCHAR(MAX)) pta
		WHERE ISNULL(pta.AddressTypeCode, '''') <> ''''

		UNION ALL 

		SELECT hdr.SourceSystemCode
			,pta.AddressTypeCode
			,ISNULL(pta.AddressTypeDesc, '''') AS AddressTypeName
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
		CROSS APPLY OPENJSON(ptr.PartyAddress) WITH (AddressTypeCode NVARCHAR(MAX), AddressTypeDesc NVARCHAR(MAX)) pta
		WHERE ISNULL(pta.AddressTypeCode, '''') <> ''''

		UNION ALL 

		SELECT hdr.SourceSystemCode
			,bla.AddressTypeCode
			,ISNULL(bla.AddressTypeDesc, '''') AS AddressTypeName
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
		CROSS APPLY OPENJSON(bld.BuildingAddress) WITH (AddressTypeCode NVARCHAR(MAX), AddressTypeDesc NVARCHAR(MAX)) bla
		WHERE ISNULL(bla.AddressTypeCode, '''') <> ''''

		UNION ALL 

		SELECT hdr.SourceSystemCode
			,dwa.AddressTypeCode
			,ISNULL(dwa.AddressTypeDesc, '''') AS AddressTypeName
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
		CROSS APPLY OPENJSON(dwe.DwellingAddress) WITH (AddressTypeCode NVARCHAR(MAX), AddressTypeDesc NVARCHAR(MAX)) dwa
		WHERE ISNULL(dwa.AddressTypeCode, '''') <> ''''

		) AS tmp
	) AS tpl
' 
GO
