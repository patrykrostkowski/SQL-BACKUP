USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcDriverLicenseDetail]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE    View [StgPolicy].[SrcDriverLicenseDetail]
as
Select hdr.SourceSystemCode
,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
,dlt.DriverLicenseDetailSourceCode AS SourceCode
,dvr.DriverSourceCode
,try_convert(DATETIME, dlt.LicensedDate, 127) AS LicensedDate 
		,dlt.DriversLicenseNumber
		,try_convert(DATETIME, dlt.FirstLicensedCurrentStateDate, 127) AS FirstLicensedCurrentStateDate
		,dlt.LicenseClassCode
		,dlt.StateCode
		,dlt.PreviousLicenseStateCode
		,dlt.PreviousLicensedStateCode
		,dlt.CountryCode
		,dlt.LicenseTypeCode
		,dlt.LicenseStatusCode
		,dlt.LicensePermitNumber
		,dlt.LicenseTypeDesc
		,dlt.LicenseStatusDesc
		,line.IsValidInd
FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Policy NVARCHAR(max) AS JSON
		) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (
		MiscParty NVARCHAR(max) AS JSON
		) pol
CROSS APPLY OPENJSON(pol.MiscParty) WITH (
		PartyInfo NVARCHAR(max) AS JSON
		) mpt
CROSS APPLY OPENJSON(mpt.PartyInfo) WITH (
		PartyRole NVARCHAR(max) AS JSON
		) pti
CROSS APPLY OPENJSON(pti.PartyRole) WITH (
		Driver NVARCHAR(max) AS JSON
		) ptr
CROSS APPLY OPENJSON(ptr.Driver) WITH (
		DriverSourceCode NVARCHAR(max)
		,DriverLicenseDetail NVARCHAR(max) AS JSON
		) dvr
CROSS APPLY OPENJSON(dvr.DriverLicenseDetail) WITH (
		DriverLicenseDetailSourceCode NVARCHAR(max)
		,LicensedDate NVARCHAR(max)
		,DriversLicenseNumber NVARCHAR(max)
		,FirstLicensedCurrentStateDate NVARCHAR(max)
		,LicenseClassCode NVARCHAR(max)
		,StateCode NVARCHAR(max)
		,PreviousLicenseStateCode NVARCHAR(max)
		,PreviousLicensedStateCode NVARCHAR(max)
		,CountryCode NVARCHAR(max)
		,LicenseTypeCode NVARCHAR(max)
		,LicenseStatusCode NVARCHAR(max)
		,LicensePermitNumber NVARCHAR(max)
		,LicenseTypeDesc NVARCHAR(max)
		,LicenseStatusDesc NVARCHAR(max)

		) dlt





GO
