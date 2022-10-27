USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcPolicyPolicyInsurableObject]    Script Date: 27.10.2022 12:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE     VIEW [StgPolicy].[SrcPolicyPolicyInsurableObject]
AS
SELECT hdr.SourceSystemCode
	,convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,ptr.PolicyTransSourceCode
	,ptr.PolicyTransNum
	,geo.GeographySourceCode as PolicyGeographySourceCode
	,iob.InsurableObjectSourceCode as SourceCode
,iob.InsurableObjectTypeCode 
,iob.InsurableObjectTypeDesc 
,iob.InsuredSourceCode  
	,line.IsValidInd
FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Policy NVARCHAR(max) AS JSON
		) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (
		PolicySourceCode NVARCHAR(max)
		,PolicyTrans NVARCHAR(max) AS JSON
		,Insured NVARCHAR(max) AS JSON
		) pol
CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (
		PolicyTransSourceCode NVARCHAR(max)
		,PolicyTransNum NVARCHAR(max)
		,LineOfBusiness NVARCHAR(max) AS JSON
		) ptr
CROSS APPLY OPENJSON(ptr.LineOfBusiness) WITH (
		Geography NVARCHAR(max) AS JSON
		) lob
CROSS APPLY OPENJSON(lob.Geography) WITH (
		GeographySourceCode NVARCHAR(max)
		,InsurableObject NVARCHAR(max) AS JSON
) geo
CROSS APPLY OPENJSON(geo.InsurableObject) WITH(
InsurableObjectSourceCode NVARCHAR(max)
,InsurableObjectTypeCode NVARCHAR(max)
,InsurableObjectTypeDesc NVARCHAR(max)
,InsuredSourceCode NVARCHAR(max)
) iob

GO
