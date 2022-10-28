USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcAircraft]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE     VIEW [StgPolicy].[SrcAircraft]
AS

SELECT 
	hdr.SourceSystemCode	
	,cft.AircraftSourceCode	AS SourceCode
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,ino.InsurableObjectSourceCode
	,cft.AircraftIdentificationNum
	,cft.TailNum
	,cft.ModelDesc
	,cft.MakeDesc
	,cft.YearNum
	,cft.EquipmentTypeCode
	,cft.EquipmentTypeDesc
	,cft.EquipmentClassCode
	,cft.EquipmentClassDesc
	,cft.GearTypeCode
	,cft.GearTypeDesc
	,cft.RegistrationStateCode
	,cft.RegistrationCountryCode
	,cft.AircraftTypeCode
	,cft.FAANum
	,cft.FAAViolationsNum
	,cft.NumberOfSeats
	,cft.BuilderInfo
	,cft.AircraftDesc
	,cft.OwnerName
	,cft.IsCharteredInd
	,cft.HullValueAmt
	,cft.TonnageAmt
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
	Aircraft NVARCHAR(MAX) AS JSON
	,InsurableObjectSourceCode NVARCHAR(MAX)
	) ino
CROSS APPLY OPENJSON(ino.Aircraft) WITH (
	AircraftSourceCode NVARCHAR(MAX)
	,AircraftIdentificationNum NVARCHAR(MAX)
	,TailNum NVARCHAR(MAX)
	,ModelDesc NVARCHAR(MAX)
	,MakeDesc NVARCHAR(MAX)
	,YearNum int
	,EquipmentTypeCode NVARCHAR(MAX)
	,EquipmentTypeDesc NVARCHAR(MAX)
	,EquipmentClassCode NVARCHAR(MAX)
	,EquipmentClassDesc NVARCHAR(MAX)
	,GearTypeCode NVARCHAR(MAX)
	,GearTypeDesc NVARCHAR(MAX)
	,RegistrationCountryCode NVARCHAR(MAX)
	,RegistrationStateCode NVARCHAR(MAX)
	,AircraftTypeCode NVARCHAR(MAX)
	,FAANum NVARCHAR(MAX)
	,FAAViolationsNum int
	,NumberOfSeats int
	,BuilderInfo NVARCHAR(MAX)
	,AircraftDesc NVARCHAR(MAX)
	,OwnerName NVARCHAR(MAX)
	,IsCharteredInd tinyint
	,HullValueAmt decimal
	,TonnageAmt nvarchar(max)
	) cft


GO
