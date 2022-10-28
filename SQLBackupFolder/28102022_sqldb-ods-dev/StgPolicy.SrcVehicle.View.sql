USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcVehicle]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE     VIEW [StgPolicy].[SrcVehicle]
AS
SELECT hdr.SourceSystemCode
	,convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime  
	,vhc.AlterationsAmt 
,vhc.BIPDSymbolCode 
,vhc.BusinessAnnualDistance 
,vhc.ChassisSerialNumber 
,vhc.ColorCode 
,vhc.ColorDesc 
,vhc.DamageabilityDesc 
,vhc.DistanceOneWay 
,vhc.EngineSerialNumber 
,vhc.EngineTypeCode 
,vhc.EngineTypeDesc 
,vhc.EstimatedAnnualDistance 
,vhc.GrossVehicleWeight 
,vhc.IsBusinessUseInd 
,vhc.IsCarPoolInd 
,vhc.IsFourWheelDriveInd 
,vhc.IsKitVehicleInd 
,vhc.IsOtherThanNamedInsuredOwnsInd 
,vhc.IsPrincipalOperatorInd 
,vhc.IsRegisteredVehicleInd 
,vhc.IsResidualMarketFacilityInd 
,vhc.IsSeenVehicleInd 
,vhc.IsVehicleLeasedInd 
,vhc.LeasedDate 
,vhc.LengthTimePerMonth 
,vhc.LicensePlateEffectiveDate 
,vhc.LicensePlateExpirationDate 
,vhc.LicensePlateNumber 
,vhc.Make 
,vhc.Manufacturer 
,vhc.MaximumSpeed 
,vhc.MedPayPIPLiabilitySymbolCode 
,vhc.Model 
,vhc.ModelYear 
,vhc.MSRP 
,vhc.NumAxles 
,vhc.NumCylinders 
,vhc.NumDaysDrivenPerWeek 
,vhc.NumPassengers 
,vhc.NumYouthfulOperators 
,vhc.OdometerReading 
,vhc.OdometerReadingAtPurchase 
,vhc.PhysicalDamageRateClassCode 
,vhc.PremiumFullWrittenAmt 
,vhc.PremiumNetChangeAmt 
,vhc.PremiumTermAmt 
,vhc.PricingCode 
,vhc.PurchaseDate 
,vhc.RateClassCode 
,vhc.RateSubClassCode 
,vhc.ReasonLiabilityRefusedCode 
,vhc.ReasonLiabilityRefusedDesc 
,vhc.RegistrationCountryCode 
,vhc.RegistrationEffectiveDate 
,vhc.RegistrationExpirationDate 
,vhc.RegistrationNum 
,vhc.RegistrationStateCode 
,vhc.RegistrationTypeCode 
,vhc.ResidualMarketFacilityTierCode 
,vhc.ResidualMarketFacilityTierDate 
,vhc.ResidualMarketFacilityTierDesc 
,vhc.SequenceNum 
,vhc.TerritoryCodeCommutingDestinationCode 
,vhc.TransmissionSerialNumber 
,vhc.VehicleBodyTypeCode 
,vhc.VehicleBodyTypeDesc 
,vhc.VehicleDesc 
,vhc.VehicleDisplacement 
,vhc.VehicleIdentificationNum 
,vhc.VehicleInspectionStatusCode 
,vhc.VehicleInspectionStatusDesc 
,vhc.VehicleLength 
,vhc.VehiclePerformanceCode 
,vhc.VehiclePerformanceDesc 
,vhc.VehicleSalvageTitleNum 
,vhc.VehicleSourceCode as SourceCode
,vhc.VehicleSymbolCode 
,vhc.VehicleTransmissionCode 
,vhc.VehicleTransmissionDesc 
,vhc.VehicleTypeCode 
,vhc.VehicleTypeDesc 
,vhc.VehicleUsageCode 
,vhc.VehicleUsageDesc 
,vhc.VehicleWidth 
,iob.InsurableObjectSourceCode
,line.IsValidInd
FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Policy NVARCHAR(max) AS JSON
		) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (
		PolicyTrans NVARCHAR(max) AS JSON
		) pol
OUTER APPLY OPENJsoN(pol.PolicyTrans) WITH (
	LineOfBusiness nvarchar(max) AS JSON
)ptr
outer apply openjson(ptr.LineOfBusiness) with (
 Geography nvarchar(max) as json
) lob
outer apply openjson(lob.Geography) with (
 InsurableObject nvarchar(max) as json
) geo
outer apply openjson(geo.insurableobject) with(
Vehicle nvarchar(max) as json
,InsurableObjectSourceCode nvarchar(max)
) iob
cross apply openjson(iob.vehicle) with (
AlterationsAmt nvarchar(max), 
BIPDSymbolCode nvarchar(max), 
BusinessAnnualDistance nvarchar(max), 
ChassisSerialNumber nvarchar(max), 
ColorCode nvarchar(max), 
ColorDesc nvarchar(max), 
DamageabilityDesc nvarchar(max), 
DistanceOneWay nvarchar(max), 
EngineSerialNumber nvarchar(max), 
EngineTypeCode nvarchar(max), 
EngineTypeDesc nvarchar(max), 
EstimatedAnnualDistance nvarchar(max), 
GrossVehicleWeight nvarchar(max), 
IsBusinessUseInd nvarchar(max), 
IsCarPoolInd nvarchar(max), 
IsFourWheelDriveInd nvarchar(max), 
IsKitVehicleInd nvarchar(max), 
IsOtherThanNamedInsuredOwnsInd nvarchar(max), 
IsPrincipalOperatorInd nvarchar(max), 
IsRegisteredVehicleInd nvarchar(max), 
IsResidualMarketFacilityInd nvarchar(max), 
IsSeenVehicleInd nvarchar(max), 
IsVehicleLeasedInd nvarchar(max), 
LeasedDate nvarchar(max), 
LengthTimePerMonth nvarchar(max), 
LicensePlateEffectiveDate nvarchar(max), 
LicensePlateExpirationDate nvarchar(max), 
LicensePlateNumber nvarchar(max), 
Make nvarchar(max), 
Manufacturer nvarchar(max), 
MaximumSpeed nvarchar(max), 
MedPayPIPLiabilitySymbolCode nvarchar(max), 
Model nvarchar(max), 
ModelYear nvarchar(max), 
MSRP nvarchar(max), 
NumAxles nvarchar(max), 
NumCylinders nvarchar(max), 
NumDaysDrivenPerWeek nvarchar(max), 
NumPassengers nvarchar(max), 
NumYouthfulOperators nvarchar(max), 
OdometerReading nvarchar(max), 
OdometerReadingAtPurchase nvarchar(max), 
PhysicalDamageRateClassCode nvarchar(max), 
PremiumFullWrittenAmt nvarchar(max), 
PremiumNetChangeAmt nvarchar(max), 
PremiumTermAmt nvarchar(max), 
PricingCode nvarchar(max), 
PurchaseDate nvarchar(max), 
RateClassCode nvarchar(max), 
RateSubClassCode nvarchar(max), 
ReasonLiabilityRefusedCode nvarchar(max), 
ReasonLiabilityRefusedDesc nvarchar(max), 
RegistrationCountryCode nvarchar(max), 
RegistrationCountryDesc nvarchar(max), 
RegistrationEffectiveDate nvarchar(max), 
RegistrationExpirationDate nvarchar(max), 
RegistrationNum nvarchar(max), 
RegistrationStateCode nvarchar(max), 
RegistrationStateDesc nvarchar(max), 
RegistrationTypeCode nvarchar(max), 
ResidualMarketFacilityTierCode nvarchar(max), 
ResidualMarketFacilityTierDate nvarchar(max), 
ResidualMarketFacilityTierDesc nvarchar(max), 
SequenceNum nvarchar(max), 
TerritoryCodeCommutingDestinationCode nvarchar(max), 
TransmissionSerialNumber nvarchar(max), 
VehicleBodyTypeCode nvarchar(max), 
VehicleBodyTypeDesc nvarchar(max), 
VehicleDesc nvarchar(max), 
VehicleDisplacement nvarchar(max), 
VehicleIdentificationNum nvarchar(max), 
VehicleInspectionStatusCode nvarchar(max), 
VehicleInspectionStatusDesc nvarchar(max), 
VehicleLength nvarchar(max), 
VehiclePerformanceCode nvarchar(max), 
VehiclePerformanceDesc nvarchar(max), 
VehicleSalvageTitleNum nvarchar(max), 
VehicleSourceCode nvarchar(max), 
VehicleSymbolCode nvarchar(max), 
VehicleTransmissionCode nvarchar(max), 
VehicleTransmissionDesc nvarchar(max), 
VehicleTypeCode nvarchar(max), 
VehicleTypeDesc nvarchar(max), 
VehicleUsageCode nvarchar(max), 
VehicleUsageDesc nvarchar(max), 
VehicleWidth nvarchar(max) 
)vhc
WHERE 1 = 1
GO
