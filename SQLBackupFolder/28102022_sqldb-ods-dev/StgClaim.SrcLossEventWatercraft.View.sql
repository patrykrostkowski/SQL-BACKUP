USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcLossEventWatercraft]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE    VIEW [StgClaim].[SrcLossEventWatercraft] 
AS

SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (
SELECT hdr.SourceSystemCode
       ,Convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	   ,loe.LossEventSourceCode
	   ,lwc.LossEventWatercraftSourceCode as SourceCode
	   ,lwc.VIN
	   ,lwc.ModelDesc
	   ,lwc.MakeDesc
	   ,lwc.YearNum
	   ,lwc.EquipmentTypeCode		
	   ,lwc.EquipmentClassCode		
	   ,lwc.VesselTypeCode			
	   ,lwc.StateCode
	   ,lwc.CountryCode
	   ,lwc.MooringLocationLine4Address 
	   ,lwc.MooringLocationLine3Address
	   ,lwc.MooringLocationLine2Address
	   ,lwc.MooringLocationCityName
	   ,lwc.MooringLocationStateId
	   ,lwc.MooringLocationCountryId
	   ,lwc.MooringLocationPostalCode
	   ,line.IsValidInd
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.Jsonline) WITH (
         SourceSystemCode NVARCHAR(max) 
		 ,ProcessDateTime NVARCHAR(max)
		 ,Claim NVARCHAR (max) AS JSON
		  ) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (
	LossEvent NVARCHAR(max)  AS JSON
	) clm
CROSS APPLY  OPENJSON(clm.LossEvent) WITH (
         LossEventSourceCode NVARCHAR(max) 
		,LossEventWatercraft NVARCHAR (max) AS JSON 
		) loe
CROSS APPLY OPENJSON(loe.LossEventWatercraft) WITH (
         LossEventWatercraftSourceCode NVARCHAR(max)
		,VIN NVARCHAR(max)
		,ModelDesc NVARCHAR(max)
		,MakeDesc NVARCHAR(max)
		,YearNum INT
		,EquipmentTypeCode NVARCHAR(max)
		,EquipmentClassCode NVARCHAR(max)
		,VesselTypeCode  NVARCHAR(max)
		,StateCode  NVARCHAR(max)
		,CountryCode  NVARCHAR(max)
		,MooringLocationLine4Address  NVARCHAR(max)
		,MooringLocationLine3Address  NVARCHAR(max)
		,MooringLocationLine2Address NVARCHAR(max)
		,MooringLocationCityName NVARCHAR(max)
		,MooringLocationStateId INT
		,MooringLocationCountryId INT
		,MooringLocationPostalCode NVARCHAR(max)
		) lwc
	) AS tmp
		) AS tpl
	where tpl.rn = 1

GO
