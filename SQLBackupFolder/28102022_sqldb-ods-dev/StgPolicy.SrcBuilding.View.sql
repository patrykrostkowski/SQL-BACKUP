USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcBuilding]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE    VIEW [StgPolicy].[SrcBuilding]
AS

SELECT 
	hdr.SourceSystemCode	
	,bld.BuildingSourceCode	AS SourceCode
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,prp.PropertySourceCode
	,bld.SequenceNum
	,bld.YearBuilt
	,bld.LandArea
	,bld.NumStories
	,bld.NumDivingBoards
	,bld.NumSwimmingPools
	,bld.NumApartments
	,bld.NumATV
	,bld.OccupancyTypeCode
	,bld.OccupancyTypeDesc
	,bld.RealEstateTypeCode
	,bld.RealEstateTypeDesc
	,bld.ProtectionClassCode
	,bld.ProtectionClassDesc
	,bld.WiringTypeCode
	,bld.WiringTypeDesc
	,bld.WiringInspectedDate
	,bld.AreaTypeSurroundingsCode
	,bld.AreaTypeSurroundingsDesc	
	,bld.PlumbingConditionCode
	,bld.PlumbingConditionDesc
	,bld.RoofConditionCode
	,bld.RoofConditionDesc
	,bld.ProtectionDeviceBurglarCode
	,bld.ProtectionDeviceBurglarDesc
	,bld.ProtectionDeviceFireCode
	,bld.ProtectionDeviceFireDesc
	,bld.RoofMaterialCode
	,bld.RoofMaterialDesc
	,bld.CoInsurancePct
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
	Property NVARCHAR(MAX) AS JSON
	) ino
CROSS APPLY OPENJSON(ino.Property) WITH (
	Building NVARCHAR(MAX) AS JSON
	,PropertySourceCode NVARCHAR(MAX)
	) prp
CROSS APPLY OPENJSON(prp.Building) WITH (
	BuildingSourceCode NVARCHAR(MAX)
	,SequenceNum int
	,YearBuilt NVARCHAR(MAX)
	,LandArea NVARCHAR(MAX)
	,NumStories int
	,NumDivingBoards int
	,NumSwimmingPools int
	,NumApartments int
	,NumATV NVARCHAR(MAX)
	,OccupancyTypeCode NVARCHAR(MAX)
	,OccupancyTypeDesc NVARCHAR(MAX)
	,RealEstateTypeCode NVARCHAR(MAX)
	,RealEstateTypeDesc NVARCHAR(MAX)
	,ProtectionClassCode NVARCHAR(MAX)
	,ProtectionClassDesc NVARCHAR(MAX)
	,WiringTypeCode NVARCHAR(MAX)
	,WiringTypeDesc NVARCHAR(MAX)
	,WiringInspectedDate NVARCHAR(MAX)
	,AreaTypeSurroundingsCode NVARCHAR(MAX)
	,AreaTypeSurroundingsDesc NVARCHAR(MAX)
	,PlumbingConditionCode NVARCHAR(MAX)
	,PlumbingConditionDesc NVARCHAR(MAX)
	,RoofConditionCode NVARCHAR(MAX)
	,RoofConditionDesc NVARCHAR(MAX)
	,ProtectionDeviceBurglarCode NVARCHAR(MAX)
	,ProtectionDeviceBurglarDesc NVARCHAR(MAX)
	,ProtectionDeviceFireCode NVARCHAR(MAX)
	,ProtectionDeviceFireDesc NVARCHAR(MAX)
	,RoofMaterialCode NVARCHAR(MAX)
	,RoofMaterialDesc NVARCHAR(MAX)
	,CoInsurancePct decimal(8,2)
	) bld

GO
