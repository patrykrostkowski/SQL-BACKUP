USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcPersonalProperty]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE    VIEW [StgPolicy].[SrcPersonalProperty]
AS

SELECT 
	hdr.SourceSystemCode	
	,psp.PersonalPropertySourceCode	AS SourceCode
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,ino.InsurableObjectSourceCode
	,psp.AddressLine1
	,psp.AddressLine2
	,psp.AddressLine3
	,psp.CityName
	,psp.StateCode
	,psp.ZipCode
	,psp.ItemNum
	,psp.ItemName
	,psp.ItemDesc
	,psp.BaseCurrencyCode
	,psp.ItemValueBaseAmt
	,line.IsValidInd
FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(MAX)
	,ProcessDateTime NVARCHAR(MAX)
	,Policy NVARCHAR(MAX) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (
	PolicyTrans NVARCHAR(MAX) AS JSON
	) pol
CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (
	LineOfBusiness NVARCHAR(MAX) AS JSON
	) plt
CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (
	Geography NVARCHAR(MAX) AS JSON
	) lob
CROSS APPLY OPENJSON(lob.Geography) WITH (
	InsurableObject NVARCHAR(MAX) AS JSON
	) grg
CROSS APPLY OPENJSON(grg.InsurableObject) WITH (
	PersonalProperty NVARCHAR(MAX) AS JSON
	,InsurableObjectSourceCode NVARCHAR(MAX)
	) ino
CROSS APPLY OPENJSON(ino.PersonalProperty) WITH (
	PersonalPropertySourceCode NVARCHAR(MAX)
	,PropertySourceCode NVARCHAR(MAX)
	,AddressLine1 NVARCHAR(MAX)
	,AddressLine2 NVARCHAR(MAX)
	,AddressLine3 NVARCHAR(MAX)
	,CityName NVARCHAR(MAX)
	,StateCode NVARCHAR(MAX)
	,ZipCode NVARCHAR(MAX)
	,ItemNum NVARCHAR(MAX)
	,ItemName NVARCHAR(MAX)
	,ItemDesc NVARCHAR(MAX)
	,ItemValueBaseAmt decimal(19,4)
	,BaseCurrencyCode NVARCHAR(MAX)
	) psp



GO
