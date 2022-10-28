USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcVehicleRegistration]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE    VIEW [StgPolicy].[SrcVehicleRegistration]
AS

SELECT 
	hdr.SourceSystemCode	
	,vhr.VehicleRegistrationSourceCode	AS SourceCode
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,vhc.VehicleSourceCode
	,vhr.RegistrationTypeCode
	,vhr.RegistrationNum
	,vhr.RegistrationEffectiveDate
	,vhr.RegistrationExpirationDate
	,vhr.StateCode
	,vhr.CountryCode
	,vhr.LastRegisteredYear
	,vhr.IsActiveInd
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
	Vehicle NVARCHAR(MAX) AS JSON
	) ino
CROSS APPLY OPENJSON(ino.Vehicle) WITH (
	VehicleRegistration NVARCHAR(MAX) AS JSON
	,VehicleSourceCode NVARCHAR(MAX)
	) vhc
CROSS APPLY OPENJSON(vhc.VehicleRegistration) WITH (
	CountryCode NVARCHAR(MAX)
	,IsActiveInd tinyint
	,LastRegisteredYear NVARCHAR(MAX)
	,RegistrationEffectiveDate NVARCHAR(MAX)
	,RegistrationExpirationDate NVARCHAR(MAX)
	,RegistrationNum NVARCHAR(MAX)
	,RegistrationTypeCode NVARCHAR(MAX)
	,StateCode NVARCHAR(MAX)
	,VehicleRegistrationSourceCode NVARCHAR(MAX)
	) vhr

GO
