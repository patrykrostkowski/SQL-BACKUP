USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcWatercraft]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE    VIEW [StgPolicy].[SrcWatercraft]
AS

SELECT 
	hdr.SourceSystemCode	
	,wtc.WatercraftSourceCode	AS SourceCode
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,ino.InsurableObjectSourceCode
	,wtc.SequenceNum
	,wtc.WaterUnitTypeCode
	,wtc.EquipmentTypeCode
	,wtc.EquipmentTypeDesc
	,wtc.FuelTypeCode
	,wtc.FuelTypeDesc
	,wtc.CertifyingEntityDesc
	,wtc.WeightCapacityNum
	,wtc.NumTrailerAxles
	,wtc.IsMinPremiumInd
	,wtc.NumUnits
	,wtc.PurchaseDate
	,wtc.WatersNavigatedCode
	,wtc.CostNewAmt
	,wtc.PurchasePriceAmt
	,wtc.PresentValueAmt
	,wtc.LengthNum
	,wtc.Speednum
	,wtc.HorsepowerNum
	,wtc.HullDesignTypeCode
	,wtc.HullMaterialTypeCode
	,wtc.NumOperatorsUnder21Yrs
	,wtc.RegistrationNum
	,wtc.BedsNum
	,wtc.FuelTankCode
	,wtc.PropulsionTypeCode
	,wtc.IsPrincipalOperatorInd
	,wtc.IsMinPremInd
	,wtc.PrimarySeasonCode
	,wtc.SecondarySeasonCode
	,wtc.SurveyDate
	,wtc.ItemTypeCode
	,wtc.ManufacturerName
	,wtc.ManufactureMethodCode
	,wtc.CertifyingEntityCode
	,wtc.ModelName
	,wtc.SerialIdNum
	,wtc.ModelYear
	,wtc.ItemDesc
	,wtc.ManufacturerCode
	,wtc.ModelCode
	,wtc.BodyTypeCode
	,wtc.EngineSerialNum
	,wtc.TransmissionSerialNum
	,wtc.IsLeasedInd
	,wtc.BrandName
	,wtc.WaterUnitTypeDesc
	,wtc.WatersNavigatedDesc
	,wtc.HullDesignTypeDesc
	,wtc.HullMaterialTypeDesc
	,wtc.FuelTankDesc
	,wtc.PropulsionTypeDesc
	,wtc.ItemTypeDesc
	,wtc.ManufactureMethodDesc
	,wtc.BodyTypeDesc
	,wtc.SailboatLengthCode
	,wtc.MotorboatHPCode
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
	Watercraft NVARCHAR(MAX) AS JSON
	,InsurableObjectSourceCode NVARCHAR(MAX)
	) ino
CROSS APPLY OPENJSON(ino.Watercraft) WITH (
	WatercraftSourceCode NVARCHAR(MAX)
	,SequenceNum NVARCHAR(MAX)
	,WaterUnitTypeCode NVARCHAR(MAX)
	,FuelTypeCode NVARCHAR(MAX)
	,FuelTypeDesc NVARCHAR(MAX)
	,NumUnits int

	,EquipmentTypeCode NVARCHAR(MAX)
	,EquipmentTypeDesc NVARCHAR(MAX)
	,FuelTankCode  NVARCHAR(MAX)
	,FuelTankDesc NVARCHAR(MAX)
	,CertifyingEntityDesc NVARCHAR(MAX)
	,WeightCapacityNum NVARCHAR(MAX)
	,NumTrailerAxles int
	,IsMinPremiumInd  int

	,PurchaseDate date
	,WatersNavigatedCode NVARCHAR(MAX)
	,CostNewAmt decimal(18,2)
	,PurchasePriceAmt decimal(18,2)
	,PresentValueAmt decimal(18,2)
	,LengthNum NVARCHAR(MAX)
	,Speednum NVARCHAR(MAX)
	,HorsepowerNum NVARCHAR(MAX)
	,HullDesignTypeCode NVARCHAR(MAX)
	,HullMaterialTypeCode NVARCHAR(MAX)
	,NumOperatorsUnder21Yrs int
	,RegistrationNum NVARCHAR(MAX)
	,BedsNum int
	,PropulsionTypeCode NVARCHAR(MAX)
	,IsPrincipalOperatorInd tinyint
	,IsMinPremInd tinyint
	,PrimarySeasonCode NVARCHAR(MAX)
	,SecondarySeasonCode NVARCHAR(MAX)
	,SurveyDate date
	,ItemTypeCode NVARCHAR(MAX)
	,ManufacturerName NVARCHAR(MAX)
	,ManufactureMethodCode NVARCHAR(MAX)
	,CertifyingEntityCode NVARCHAR(MAX)
	,ModelName NVARCHAR(MAX)
	,SerialIdNum NVARCHAR(MAX)
	,ModelYear NVARCHAR(MAX)
	,ItemDesc NVARCHAR(MAX)
	,ManufacturerCode NVARCHAR(MAX)
	,ModelCode NVARCHAR(MAX)
	,BodyTypeCode NVARCHAR(MAX)
	,EngineSerialNum NVARCHAR(MAX)
	,TransmissionSerialNum NVARCHAR(MAX)
	,IsLeasedInd tinyint
	,BrandName NVARCHAR(MAX)
	,WaterUnitTypeDesc NVARCHAR(MAX)
	,WatersNavigatedDesc NVARCHAR(MAX)
	,HullDesignTypeDesc NVARCHAR(MAX)
	,HullMaterialTypeDesc NVARCHAR(MAX)
	,PropulsionTypeDesc NVARCHAR(MAX)
	,ItemTypeDesc NVARCHAR(MAX)
	,ManufactureMethodDesc NVARCHAR(MAX)
	,BodyTypeDesc NVARCHAR(MAX)
	,SailboatLengthCode NVARCHAR(MAX)
	,MotorboatHPCode NVARCHAR(MAX)
	) wtc



GO
