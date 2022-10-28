USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcContactPoint]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE    VIEW [StgPolicy].[SrcContactPoint]
AS

-- -------------------------------------------------------------------------------------- PHONE
SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (

select * from 
(
	SELECT 
		hdr.SourceSystemCode	
		,pta.PartyPhoneSourceCode	AS SourceCode		 
		,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
		,ptr.PartyRoleCode	
		,pti.PartyInfoSourceCode	
		,'Phone'	AS ContactPointTypeCode			
		,1 AS IsContactActiveInd
		,line.IsValidInd
		
	FROM StgPolicy.PolicyData line
	CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(MAX)
		,ProcessDateTime NVARCHAR(MAX)
		,Policy NVARCHAR(MAX) AS JSON
		) hdr
	CROSS APPLY OPENJSON(hdr.Policy) WITH (							--Account
		Account NVARCHAR(MAX) AS JSON
		) pol
	CROSS APPLY OPENJSON(pol.Account) WITH (
		PartyInfo NVARCHAR(MAX) AS JSON
		) acc
	CROSS APPLY OPENJSON(acc.PartyInfo) WITH (
		PartyRole NVARCHAR(MAX) AS JSON
		,PartyInfoSourceCode NVARCHAR(MAX)
		) pti
	CROSS APPLY OPENJSON(pti.PartyRole) WITH (
		PartyRoleCode NVARCHAR(MAX)
		,PartyEmail NVARCHAR(MAX) AS JSON
		,PartyPhone NVARCHAR(MAX) AS JSON
		,PartyAddress NVARCHAR(MAX) AS JSON
		,PartyWeb NVARCHAR(MAX) AS JSON
		) ptr
	CROSS APPLY OPENJSON(ptr.PartyPhone) WITH (
		PartyPhoneSourceCode NVARCHAR(MAX)
		) pta
	
UNION ALL

	SELECT 
		hdr.SourceSystemCode	
		,pta.PartyPhoneSourceCode	AS SourceCode		
		,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
		,ptr.PartyRoleCode	
		,pti.PartyInfoSourceCode	
		,'Phone'	AS ContactPointTypeCode				
		,1 AS IsContactActiveInd
		,line.IsValidInd

	FROM StgPolicy.PolicyData line
	CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(MAX)
		,ProcessDateTime NVARCHAR(MAX)
		,Policy NVARCHAR(MAX) AS JSON
		) hdr
	CROSS APPLY OPENJSON(hdr.Policy) WITH (							--Agency
		Agency NVARCHAR(MAX) AS JSON
		) pol
	CROSS APPLY OPENJSON(pol.Agency) WITH (
		PartyInfo NVARCHAR(MAX) AS JSON
		) agc
	CROSS APPLY OPENJSON(agc.PartyInfo) WITH (
		PartyRole NVARCHAR(MAX) AS JSON
		,PartyInfoSourceCode NVARCHAR(MAX)
		) pti
	CROSS APPLY OPENJSON(pti.PartyRole) WITH (
		PartyRoleCode NVARCHAR(MAX)
		,PartyEmail NVARCHAR(MAX) AS JSON
		,PartyPhone NVARCHAR(MAX) AS JSON
		,PartyAddress NVARCHAR(MAX) AS JSON
		,PartyWeb NVARCHAR(MAX) AS JSON
		) ptr
	CROSS APPLY OPENJSON(ptr.PartyPhone) WITH (
		PartyPhoneSourceCode NVARCHAR(MAX)
		) pta

UNION ALL

	SELECT 
		hdr.SourceSystemCode	
		,pta.PartyPhoneSourceCode	AS SourceCode		
		,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
		,ptr.PartyRoleCode	
		,pti.PartyInfoSourceCode	
		,'Phone'	AS ContactPointTypeCode				
		,1 AS IsContactActiveInd
		,line.IsValidInd
	FROM StgPolicy.PolicyData line
	CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(MAX)
		,ProcessDateTime NVARCHAR(MAX)
		,Policy NVARCHAR(MAX) AS JSON
		) hdr
	CROSS APPLY OPENJSON(hdr.Policy) WITH (							--Insured
		Insured NVARCHAR(MAX) AS JSON
		) pol
	CROSS APPLY OPENJSON(pol.Insured) WITH (
		PartyInfo NVARCHAR(MAX) AS JSON
		) ins
	CROSS APPLY OPENJSON(ins.PartyInfo) WITH (
		PartyRole NVARCHAR(MAX) AS JSON
		,PartyInfoSourceCode NVARCHAR(MAX)
		) pti
	CROSS APPLY OPENJSON(pti.PartyRole) WITH (
		PartyRoleCode NVARCHAR(MAX)
		,PartyEmail NVARCHAR(MAX) AS JSON
		,PartyPhone NVARCHAR(MAX) AS JSON
		,PartyAddress NVARCHAR(MAX) AS JSON
		,PartyWeb NVARCHAR(MAX) AS JSON
		) ptr
	CROSS APPLY OPENJSON(ptr.PartyPhone) WITH (
		PartyPhoneSourceCode NVARCHAR(MAX)
		) pta

UNION ALL

	SELECT 
		hdr.SourceSystemCode	
		,pta.PartyPhoneSourceCode	AS SourceCode		
		,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
		,ptr.PartyRoleCode	
		,pti.PartyInfoSourceCode	
		,'Phone'	AS ContactPointTypeCode				
		,1 AS IsContactActiveInd
		,line.IsValidInd

	FROM StgPolicy.PolicyData line
	CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(MAX)
		,ProcessDateTime NVARCHAR(MAX)
		,Policy NVARCHAR(MAX) AS JSON
		) hdr
	CROSS APPLY OPENJSON(hdr.Policy) WITH (							--MiscParty
		MiscParty NVARCHAR(MAX) AS JSON
		) pol
	CROSS APPLY OPENJSON(pol.MiscParty) WITH (
		PartyInfo NVARCHAR(MAX) AS JSON
		) msp
	CROSS APPLY OPENJSON(msp.PartyInfo) WITH (
		PartyRole NVARCHAR(MAX) AS JSON
		,PartyInfoSourceCode NVARCHAR(MAX)
		) pti
	CROSS APPLY OPENJSON(pti.PartyRole) WITH (
		PartyRoleCode NVARCHAR(MAX)
		,PartyEmail NVARCHAR(MAX) AS JSON
		,PartyPhone NVARCHAR(MAX) AS JSON
		,PartyAddress NVARCHAR(MAX) AS JSON
		,PartyWeb NVARCHAR(MAX) AS JSON
		) ptr
	CROSS APPLY OPENJSON(ptr.PartyPhone) WITH (
		PartyPhoneSourceCode NVARCHAR(MAX)
		) pta

UNION ALL
-- -------------------------------------------------------------------------------------- ADDRESSS

	SELECT 
		hdr.SourceSystemCode	
		,pta.PartyAddressSourceCode	AS SourceCode		
		,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
		,ptr.PartyRoleCode	
		,pti.PartyInfoSourceCode	
		,'Address'	AS ContactPointTypeCode			
		,1 AS IsContactActiveInd
		,line.IsValidInd

	FROM StgPolicy.PolicyData line
	CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(MAX)
		,ProcessDateTime NVARCHAR(MAX)
		,Policy NVARCHAR(MAX) AS JSON
		) hdr
	CROSS APPLY OPENJSON(hdr.Policy) WITH (							--Account
		Account NVARCHAR(MAX) AS JSON
		) pol
	CROSS APPLY OPENJSON(pol.Account) WITH (
		PartyInfo NVARCHAR(MAX) AS JSON
		) acc
	CROSS APPLY OPENJSON(acc.PartyInfo) WITH (
		PartyRole NVARCHAR(MAX) AS JSON
		,PartyInfoSourceCode NVARCHAR(MAX)
		) pti
	CROSS APPLY OPENJSON(pti.PartyRole) WITH (
		PartyRoleCode NVARCHAR(MAX)
		,PartyEmail NVARCHAR(MAX) AS JSON
		,PartyPhone NVARCHAR(MAX) AS JSON
		,PartyAddress NVARCHAR(MAX) AS JSON
		,PartyWeb NVARCHAR(MAX) AS JSON
		) ptr
	CROSS APPLY OPENJSON(ptr.PartyAddress) WITH (
		PartyAddressSourceCode NVARCHAR(MAX)
		) pta

UNION ALL

		SELECT 
			hdr.SourceSystemCode	
			,pta.PartyAddressSourceCode	AS SourceCode		
			,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
			,ptr.PartyRoleCode	
			,pti.PartyInfoSourceCode	
			,'Address'	AS ContactPointTypeCode				
			,1 AS IsContactActiveInd
			,line.IsValidInd
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
			SourceSystemCode NVARCHAR(MAX)
			,ProcessDateTime NVARCHAR(MAX)
			,Policy NVARCHAR(MAX) AS JSON
			) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (							--Agency
			Agency NVARCHAR(MAX) AS JSON
			) pol
		CROSS APPLY OPENJSON(pol.Agency) WITH (
			PartyInfo NVARCHAR(MAX) AS JSON
			) agc
		CROSS APPLY OPENJSON(agc.PartyInfo) WITH (
			PartyRole NVARCHAR(MAX) AS JSON
			,PartyInfoSourceCode NVARCHAR(MAX)
			) pti
		CROSS APPLY OPENJSON(pti.PartyRole) WITH (
			PartyRoleCode NVARCHAR(MAX)
			,PartyEmail NVARCHAR(MAX) AS JSON
			,PartyPhone NVARCHAR(MAX) AS JSON
			,PartyAddress NVARCHAR(MAX) AS JSON
			,PartyWeb NVARCHAR(MAX) AS JSON
			) ptr
		CROSS APPLY OPENJSON(ptr.PartyAddress) WITH (
			PartyAddressSourceCode NVARCHAR(MAX)
			) pta

UNION ALL

	SELECT 
		hdr.SourceSystemCode	
		,pta.PartyAddressSourceCode	AS SourceCode		
		,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
		,ptr.PartyRoleCode	
		,pti.PartyInfoSourceCode	
		,'Address'	AS ContactPointTypeCode				
		,1 AS IsContactActiveInd
		,line.IsValidInd

	FROM StgPolicy.PolicyData line
	CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(MAX)
		,ProcessDateTime NVARCHAR(MAX)
		,Policy NVARCHAR(MAX) AS JSON
		) hdr
	CROSS APPLY OPENJSON(hdr.Policy) WITH (							--Insured
		Insured NVARCHAR(MAX) AS JSON
		) pol
	CROSS APPLY OPENJSON(pol.Insured) WITH (
		PartyInfo NVARCHAR(MAX) AS JSON
		) ins
	CROSS APPLY OPENJSON(ins.PartyInfo) WITH (
		PartyRole NVARCHAR(MAX) AS JSON
		,PartyInfoSourceCode NVARCHAR(MAX)
		) pti
	CROSS APPLY OPENJSON(pti.PartyRole) WITH (
		PartyRoleCode NVARCHAR(MAX)
		,PartyEmail NVARCHAR(MAX) AS JSON
		,PartyPhone NVARCHAR(MAX) AS JSON
		,PartyAddress NVARCHAR(MAX) AS JSON
		,PartyWeb NVARCHAR(MAX) AS JSON
		) ptr
	CROSS APPLY OPENJSON(ptr.PartyAddress) WITH (
		PartyAddressSourceCode NVARCHAR(MAX)
		) pta

UNION ALL

	SELECT 
		hdr.SourceSystemCode	
		,pta.PartyAddressSourceCode	AS SourceCode		
		,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
		,ptr.PartyRoleCode	
		,pti.PartyInfoSourceCode	
		,'Address'	AS ContactPointTypeCode				
		,1 AS IsContactActiveInd
		,line.IsValidInd

	FROM StgPolicy.PolicyData line
	CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(MAX)
		,ProcessDateTime NVARCHAR(MAX)
		,Policy NVARCHAR(MAX) AS JSON
		) hdr
	CROSS APPLY OPENJSON(hdr.Policy) WITH (							--MiscParty
		MiscParty NVARCHAR(MAX) AS JSON
		) pol
	CROSS APPLY OPENJSON(pol.MiscParty) WITH (
		PartyInfo NVARCHAR(MAX) AS JSON
		) msp
	CROSS APPLY OPENJSON(msp.PartyInfo) WITH (
		PartyRole NVARCHAR(MAX) AS JSON
		,PartyInfoSourceCode NVARCHAR(MAX)
		) pti
	CROSS APPLY OPENJSON(pti.PartyRole) WITH (
		PartyRoleCode NVARCHAR(MAX)
		,PartyEmail NVARCHAR(MAX) AS JSON
		,PartyPhone NVARCHAR(MAX) AS JSON
		,PartyAddress NVARCHAR(MAX) AS JSON
		,PartyWeb NVARCHAR(MAX) AS JSON
		) ptr
	CROSS APPLY OPENJSON(ptr.PartyAddress) WITH (
		PartyAddressSourceCode NVARCHAR(MAX)
		) pta

UNION ALL
-- -------------------------------------------------------------------------------------- EMAIL

	SELECT 
		hdr.SourceSystemCode	
		,pta.PartyEmailSourceCode	AS SourceCode		
		,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
		,ptr.PartyRoleCode	
		,pti.PartyInfoSourceCode	
		,'Email'	AS ContactPointTypeCode			
		,1 AS IsContactActiveInd
		,line.IsValidInd

	FROM StgPolicy.PolicyData line
	CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(MAX)
		,ProcessDateTime NVARCHAR(MAX)
		,Policy NVARCHAR(MAX) AS JSON
		) hdr
	CROSS APPLY OPENJSON(hdr.Policy) WITH (							--Account
		Account NVARCHAR(MAX) AS JSON
		) pol
	CROSS APPLY OPENJSON(pol.Account) WITH (
		PartyInfo NVARCHAR(MAX) AS JSON
		) acc
	CROSS APPLY OPENJSON(acc.PartyInfo) WITH (
		PartyRole NVARCHAR(MAX) AS JSON
		,PartyInfoSourceCode NVARCHAR(MAX)
		) pti
	CROSS APPLY OPENJSON(pti.PartyRole) WITH (
		PartyRoleCode NVARCHAR(MAX)
		,PartyEmail NVARCHAR(MAX) AS JSON
		,PartyPhone NVARCHAR(MAX) AS JSON
		,PartyAddress NVARCHAR(MAX) AS JSON
		,PartyWeb NVARCHAR(MAX) AS JSON
		) ptr
	CROSS APPLY OPENJSON(ptr.PartyEmail) WITH (
		PartyEmailSourceCode NVARCHAR(MAX)
		) pta

UNION ALL

	SELECT 
		hdr.SourceSystemCode	
		,pta.PartyEmailSourceCode	AS SourceCode		
		,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
		,ptr.PartyRoleCode	
		,pti.PartyInfoSourceCode	
		,'Email'	AS ContactPointTypeCode				
		,1 AS IsContactActiveInd
		,line.IsValidInd

	FROM StgPolicy.PolicyData line
	CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(MAX)
		,ProcessDateTime NVARCHAR(MAX)
		,Policy NVARCHAR(MAX) AS JSON
		) hdr
	CROSS APPLY OPENJSON(hdr.Policy) WITH (							--Agency
		Agency NVARCHAR(MAX) AS JSON
		) pol
	CROSS APPLY OPENJSON(pol.Agency) WITH (
		PartyInfo NVARCHAR(MAX) AS JSON
		) agc
	CROSS APPLY OPENJSON(agc.PartyInfo) WITH (
		PartyRole NVARCHAR(MAX) AS JSON
		,PartyInfoSourceCode NVARCHAR(MAX)
		) pti
	CROSS APPLY OPENJSON(pti.PartyRole) WITH (
		PartyRoleCode NVARCHAR(MAX)
		,PartyEmail NVARCHAR(MAX) AS JSON
		,PartyPhone NVARCHAR(MAX) AS JSON
		,PartyAddress NVARCHAR(MAX) AS JSON
		,PartyWeb NVARCHAR(MAX) AS JSON
		) ptr
	CROSS APPLY OPENJSON(ptr.PartyEmail) WITH (
		PartyEmailSourceCode NVARCHAR(MAX)
		) pta

UNION ALL

	SELECT 
		hdr.SourceSystemCode	
		,pta.PartyEmailSourceCode	AS SourceCode		
		,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
		,ptr.PartyRoleCode	
		,pti.PartyInfoSourceCode	
		,'Email'	AS ContactPointTypeCode				
		,1 AS IsContactActiveInd
		,line.IsValidInd

	FROM StgPolicy.PolicyData line
	CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(MAX)
		,ProcessDateTime NVARCHAR(MAX)
		,Policy NVARCHAR(MAX) AS JSON
		) hdr
	CROSS APPLY OPENJSON(hdr.Policy) WITH (							--Insured
		Insured NVARCHAR(MAX) AS JSON
		) pol
	CROSS APPLY OPENJSON(pol.Insured) WITH (
		PartyInfo NVARCHAR(MAX) AS JSON
		) ins
	CROSS APPLY OPENJSON(ins.PartyInfo) WITH (
		PartyRole NVARCHAR(MAX) AS JSON
		,PartyInfoSourceCode NVARCHAR(MAX)
		) pti
	CROSS APPLY OPENJSON(pti.PartyRole) WITH (
		PartyRoleCode NVARCHAR(MAX)
		,PartyEmail NVARCHAR(MAX) AS JSON
		,PartyPhone NVARCHAR(MAX) AS JSON
		,PartyAddress NVARCHAR(MAX) AS JSON
		,PartyWeb NVARCHAR(MAX) AS JSON
		) ptr
	CROSS APPLY OPENJSON(ptr.PartyEmail) WITH (
		PartyEmailSourceCode NVARCHAR(MAX)
		) pta

UNION ALL

	SELECT 
		hdr.SourceSystemCode	
		,pta.PartyEmailSourceCode	AS SourceCode		
		,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
		,ptr.PartyRoleCode	
		,pti.PartyInfoSourceCode	
		,'Email'	AS ContactPointTypeCode				
		,1 AS IsContactActiveInd
		,line.IsValidInd

	FROM StgPolicy.PolicyData line
	CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(MAX)
		,ProcessDateTime NVARCHAR(MAX)
		,Policy NVARCHAR(MAX) AS JSON
		) hdr
	CROSS APPLY OPENJSON(hdr.Policy) WITH (							--MiscParty
		MiscParty NVARCHAR(MAX) AS JSON
		) pol
	CROSS APPLY OPENJSON(pol.MiscParty) WITH (
		PartyInfo NVARCHAR(MAX) AS JSON
		) msp
	CROSS APPLY OPENJSON(msp.PartyInfo) WITH (
		PartyRole NVARCHAR(MAX) AS JSON
		,PartyInfoSourceCode NVARCHAR(MAX)
		) pti
	CROSS APPLY OPENJSON(pti.PartyRole) WITH (
		PartyRoleCode NVARCHAR(MAX)
		,PartyEmail NVARCHAR(MAX) AS JSON
		,PartyPhone NVARCHAR(MAX) AS JSON
		,PartyAddress NVARCHAR(MAX) AS JSON
		,PartyWeb NVARCHAR(MAX) AS JSON
		) ptr
	CROSS APPLY OPENJSON(ptr.PartyEmail) WITH (
		PartyEmailSourceCode NVARCHAR(MAX)
		) pta

UNION ALL
-- -------------------------------------------------------------------------------------- WEB

	SELECT 
		hdr.SourceSystemCode	
		,pta.PartyWebSourceCode	AS SourceCode		
		,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
		,ptr.PartyRoleCode	
		,pti.PartyInfoSourceCode	
		,'Web'	AS ContactPointTypeCode			
		,1 AS IsContactActiveInd
		,line.IsValidInd

	FROM StgPolicy.PolicyData line
	CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(MAX)
		,ProcessDateTime NVARCHAR(MAX)
		,Policy NVARCHAR(MAX) AS JSON
		) hdr
	CROSS APPLY OPENJSON(hdr.Policy) WITH (							--Account
		Account NVARCHAR(MAX) AS JSON
		) pol
	CROSS APPLY OPENJSON(pol.Account) WITH (
		PartyInfo NVARCHAR(MAX) AS JSON
		) acc
	CROSS APPLY OPENJSON(acc.PartyInfo) WITH (
		PartyRole NVARCHAR(MAX) AS JSON
		,PartyInfoSourceCode NVARCHAR(MAX)
		) pti
	CROSS APPLY OPENJSON(pti.PartyRole) WITH (
		PartyRoleCode NVARCHAR(MAX)
		,PartyEmail NVARCHAR(MAX) AS JSON
		,PartyPhone NVARCHAR(MAX) AS JSON
		,PartyAddress NVARCHAR(MAX) AS JSON
		,PartyWeb NVARCHAR(MAX) AS JSON
		) ptr
	CROSS APPLY OPENJSON(ptr.PartyWeb) WITH (
		PartyWebSourceCode NVARCHAR(MAX)
		) pta

UNION ALL

	SELECT 
		hdr.SourceSystemCode	
		,pta.PartyWebSourceCode	AS SourceCode		
		,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
		,ptr.PartyRoleCode	
		,pti.PartyInfoSourceCode	
		,'Web'	AS ContactPointTypeCode				
		,1 AS IsContactActiveInd
		,line.IsValidInd

	FROM StgPolicy.PolicyData line
	CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(MAX)
		,ProcessDateTime NVARCHAR(MAX)
		,Policy NVARCHAR(MAX) AS JSON
		) hdr
	CROSS APPLY OPENJSON(hdr.Policy) WITH (							--Agency
		Agency NVARCHAR(MAX) AS JSON
		) pol
	CROSS APPLY OPENJSON(pol.Agency) WITH (
		PartyInfo NVARCHAR(MAX) AS JSON
		) agc
	CROSS APPLY OPENJSON(agc.PartyInfo) WITH (
		PartyRole NVARCHAR(MAX) AS JSON
		,PartyInfoSourceCode NVARCHAR(MAX)
		) pti
	CROSS APPLY OPENJSON(pti.PartyRole) WITH (
		PartyRoleCode NVARCHAR(MAX)
		,PartyEmail NVARCHAR(MAX) AS JSON
		,PartyPhone NVARCHAR(MAX) AS JSON
		,PartyAddress NVARCHAR(MAX) AS JSON
		,PartyWeb NVARCHAR(MAX) AS JSON
		) ptr
	CROSS APPLY OPENJSON(ptr.PartyWeb) WITH (
		PartyWebSourceCode NVARCHAR(MAX)
		) pta

UNION ALL

	SELECT 
		hdr.SourceSystemCode	
		,pta.PartyWebSourceCode	AS SourceCode		
		,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
		,ptr.PartyRoleCode	
		,pti.PartyInfoSourceCode	
		,'Web'	AS ContactPointTypeCode				
		,1 AS IsContactActiveInd
		,line.IsValidInd
	FROM StgPolicy.PolicyData line
	CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(MAX)
		,ProcessDateTime NVARCHAR(MAX)
		,Policy NVARCHAR(MAX) AS JSON
		) hdr
	CROSS APPLY OPENJSON(hdr.Policy) WITH (							--Insured
		Insured NVARCHAR(MAX) AS JSON
		) pol
	CROSS APPLY OPENJSON(pol.Insured) WITH (
		PartyInfo NVARCHAR(MAX) AS JSON
		) ins
	CROSS APPLY OPENJSON(ins.PartyInfo) WITH (
		PartyRole NVARCHAR(MAX) AS JSON
		,PartyInfoSourceCode NVARCHAR(MAX)
		) pti
	CROSS APPLY OPENJSON(pti.PartyRole) WITH (
		PartyRoleCode NVARCHAR(MAX)
		,PartyEmail NVARCHAR(MAX) AS JSON
		,PartyPhone NVARCHAR(MAX) AS JSON
		,PartyAddress NVARCHAR(MAX) AS JSON
		,PartyWeb NVARCHAR(MAX) AS JSON
		) ptr
	CROSS APPLY OPENJSON(ptr.PartyWeb) WITH (
		PartyWebSourceCode NVARCHAR(MAX)
		) pta

UNION ALL

	SELECT 
		hdr.SourceSystemCode	
		,pta.PartyWebSourceCode	AS SourceCode		
		,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
		,ptr.PartyRoleCode	
		,pti.PartyInfoSourceCode	
		,'Web'	AS ContactPointTypeCode				
		,1 AS IsContactActiveInd
		,line.IsValidInd

	FROM StgPolicy.PolicyData line
	CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(MAX)
		,ProcessDateTime NVARCHAR(MAX)
		,Policy NVARCHAR(MAX) AS JSON
		) hdr
	CROSS APPLY OPENJSON(hdr.Policy) WITH (							--MiscParty
		MiscParty NVARCHAR(MAX) AS JSON
		) pol
	CROSS APPLY OPENJSON(pol.MiscParty) WITH (
		PartyInfo NVARCHAR(MAX) AS JSON
		) msp
	CROSS APPLY OPENJSON(msp.PartyInfo) WITH (
		PartyRole NVARCHAR(MAX) AS JSON
		,PartyInfoSourceCode NVARCHAR(MAX)
		) pti
	CROSS APPLY OPENJSON(pti.PartyRole) WITH (
		PartyRoleCode NVARCHAR(MAX)
		,PartyEmail NVARCHAR(MAX) AS JSON
		,PartyPhone NVARCHAR(MAX) AS JSON
		,PartyAddress NVARCHAR(MAX) AS JSON
		,PartyWeb NVARCHAR(MAX) AS JSON
		) ptr
	CROSS APPLY OPENJSON(ptr.PartyWeb) WITH (
		PartyWebSourceCode NVARCHAR(MAX)
		) pta

) tpll
		)tpl
	)tmp
	where tmp.rn = 1

GO
