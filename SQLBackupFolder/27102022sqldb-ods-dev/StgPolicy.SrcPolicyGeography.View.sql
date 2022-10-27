USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcPolicyGeography]    Script Date: 27.10.2022 12:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE    VIEW [StgPolicy].[SrcPolicyGeography]
AS
SELECT hdr.SourceSystemCode
    ,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
    ,ptr.PolicyTransSourceCode
    ,lob.LineOfBusinessSourceCode as PolicyLineOfBusinessSourceCode
    ,geo.GeographySourceCode AS SourceCode
    ,geo.CountryCode
    ,geo.StateCode
    ,geo.TerritoryName
    ,geo.RegionName
    ,geo.CountyName
	,geo.GovernClassByStateCode
	,geo.GovernClassByStateCodeDesc
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
        ) pol
CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (
        PolicyTransSourceCode NVARCHAR(max)
        ,LineOfBusiness NVARCHAR(max) AS JSON
        ) ptr
CROSS APPLY OPENJSON(ptr.LineOfBusiness) WITH (
        LineOfBusinessSourceCode NVARCHAR(max)
        ,Geography NVARCHAR(max) AS JSON
        ) lob
CROSS APPLY OPENJSON(lob.Geography) WITH (
        GeographySourceCode NVARCHAR(max)
        ,CountryCode NVARCHAR(max)
        ,CountryDesc NVARCHAR(max)
        ,TerritoryName NVARCHAR(max)
        ,StateCode NVARCHAR(max)
        ,StateDesc NVARCHAR(max)
        ,RegionName NVARCHAR(max)
        ,CountyName NVARCHAR(max)
		,GovernClassByStateCode NVARCHAR(max)
		,GovernClassByStateCodeDesc NVARCHAR(max)
        ) geo
GO
