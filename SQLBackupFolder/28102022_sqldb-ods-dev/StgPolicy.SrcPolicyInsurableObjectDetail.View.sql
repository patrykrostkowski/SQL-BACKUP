USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcPolicyInsurableObjectDetail]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE    VIEW [StgPolicy].[SrcPolicyInsurableObjectDetail]
AS
SELECT hdr.SourceSystemCode
	,convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,iob.InsurableObjectSourceCode as SourceCode
	,iob.InsurableObjectSourceCode as PolicyInsurableObjectSourceCode
	,iob.RiskLocationCode 
	,iob.RiskLocationDesc 
	,iob.EarthquakeZoneCode 
	,iob.EarthquakeZoneDesc 
	,iob.FireDistrictCode 
	,iob.FireDistrictDesc 
	,iob.FireStationName 
	,iob.FireStationLocationName 
	,iob.LatitudeCode 
	,iob.LongitudeCode 
	,iob.FireStationCountyTownName 
	,iob.FireStationTownshipName 
	,iob.NumEmployeesPartTime 
	,iob.NumEmployeesFullTime 
	,iob.BusinessHoursStartTime 
	,iob.BusinessHoursCloseTime
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
,RiskLocationCode NVARCHAR(max)
,RiskLocationDesc NVARCHAR(max)
,EarthquakeZoneCode NVARCHAR(max)
,EarthquakeZoneDesc NVARCHAR(max)
,FireDistrictCode NVARCHAR(max)
,FireDistrictDesc NVARCHAR(max)
,FireStationName NVARCHAR(max)
,FireStationLocationName NVARCHAR(max)
,LatitudeCode NVARCHAR(max)
,LongitudeCode NVARCHAR(max)
,FireStationCountyTownName NVARCHAR(max)
,FireStationTownshipName NVARCHAR(max)
,NumEmployeesPartTime NVARCHAR(max)
,NumEmployeesFullTime NVARCHAR(max)
,BusinessHoursStartTime NVARCHAR(max)
,BusinessHoursCloseTime NVARCHAR(max)
) iob


GO
