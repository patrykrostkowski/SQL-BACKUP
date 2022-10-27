USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcLossEventAircraft]    Script Date: 27.10.2022 12:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE    View [StgClaim].[SrcLossEventAircraft]
as

SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (

select hdr.SourceSystemCode
	,convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,lat.LossEventaircraftSourceCode AS SourceCode
	,loe.LossEventSourceCode  
		,lat.ModelDesc 
		,lat.MakeDesc 
		,lat.YearNum 
		,lat.EquipmentTypeCode 			
		,lat.EquipmentClassCode 		
		,lat.RegistrationStateCode 
		,lat.RegistrationCountryCode
		,lat.GearTypeCode 
		,lat.AircraftIdentificationNum 
		,lat.TailNum 
		,lat.AircraftTypeCode 
		,lat.FAANum 
		,lat.NumberOfSeats 
		,lat.BuilderInfo 
		,convert(DATETIME, lat.SalvageAssignedDate, 127) AS SalvageAssignedDate
		,convert(DATETIME, lat.VehicleRecoveredDate, 127) AS VehicleRecoveredDate
		,lat.VehicleDimensionDesc 
		,lat.OwnerName 
		,lat.IsCharteredInd 
		,lat.IsOperableInd 
		,lat.IsRecoverInd 
		,lat.IsTotalLossInd 
		,lat.TonnageAmt 
		,line.IsValidInd

FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Claim NVARCHAR(max) AS JSON
		) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (
		ClaimSourceCode NVARCHAR(max)
		,LossEvent NVARCHAR(max) AS JSON
		) clm
CROSS APPLY OPENJSON(clm.LossEvent) WITH (
		LossEventSourceCode NVARCHAR(MAX)
		,LossEventAircraft NVARCHAR(max) AS JSON
		) loe
CROSS APPLY OPENJSON(loe.LossEventAircraft) WITH (
		LossEventaircraftSourceCode NVARCHAR(MAX)
		,AircraftTypeCode NVARCHAR(MAX)
		,ModelDesc NVARCHAR(MAX)
		,MakeDesc NVARCHAR(MAX)
		,YearNum INT
		,EquipmentTypeCode NVARCHAR(MAX)
		,EquipmentClassCode NVARCHAR(MAX)
		,RegistrationStateCode NVARCHAR(MAX)
		,RegistrationCountryCode NVARCHAR(MAX)
		,GearTypeCode NVARCHAR(MAX)
		,AircraftIdentificationNum NVARCHAR(MAX)
		,TailNum NVARCHAR(MAX)
		,AircraftTypeCode NVARCHAR(MAX)
		,FAANum NVARCHAR(MAX)
		,NumberOfSeats INT
		,BuilderInfo NVARCHAR(MAX)
		,SalvageAssignedDate NVARCHAR(MAX)
		,VehicleRecoveredDate NVARCHAR(MAX)
		,VehicleDimensionDesc NVARCHAR(MAX)
		,OwnerName NVARCHAR(MAX)
		,IsCharteredInd INT
		,IsOperableInd INT
		,IsRecoverInd INT
		,IsTotalLossInd INT
		,TonnageAmt INT
		) lat
	) AS tmp
		) AS tpl
	where tpl.rn = 1


GO
