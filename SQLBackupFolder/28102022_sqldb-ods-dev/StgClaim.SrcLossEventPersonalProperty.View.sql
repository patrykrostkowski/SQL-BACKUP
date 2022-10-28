USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcLossEventPersonalProperty]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE    VIEW [StgClaim].[SrcLossEventPersonalProperty] 
AS

SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (
SELECT hdr.SourceSystemCode
       ,Convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	   ,lpp.LossEventPersonalPropertySourceCode AS SourceCode
	   ,loe.LossEventSourceCode
	   ,lpp.PropertyAddressLine1
	   ,lpp.PropertyAddressLine2
	   ,lpp.PropertyAddressLine3
	   ,lpp.PropertyCityName
	   ,lpp.PropertyStateCode
	   ,lpp.PropertyZipCode
	   ,lpp.PropertyCountryCode
	   ,lpp.IsPrimaryLocationInd
	   ,lpp.IsAlreadyRepairedInd
	   ,lpp.IsEstimateReceivedInd 
	   ,lpp.IsHazardInvolvedInd
	   ,lpp.PropertyItemNum
	   ,lpp.PropertyItemName
	   ,lpp.ItemValueAmt
	   ,lpp.PropertyItemDesc
	   ,lpp.EstimateRepairTimeDesc
	   ,lpp.EstimateDamageDesc
	   ,lpp.EstimateRepairCostAmt
	   ,lpp.EstimateReplacementCostAmt
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
		,LossEventPersonalProperty NVARCHAR (max) AS JSON 
		) loe
CROSS APPLY OPENJSON(loe.LossEventPersonalProperty) WITH (
         LossEventPersonalPropertySourceCode NVARCHAR(max)
		,PropertyAddressLine1 NVARCHAR(max)
		,PropertyAddressLine2 NVARCHAR(max)
		,PropertyAddressLine3 NVARCHAR(max)
		,PropertyCityName NVARCHAR(max)
		,PropertyStateCode NVARCHAR(max)
		,PropertyZipCode NVARCHAR(max)
		,PropertyCountryCode  NVARCHAR(max)
		,IsPrimaryLocationInd  NVARCHAR(max)
		,IsAlreadyRepairedInd  NVARCHAR(max)
		,IsEstimateReceivedInd  NVARCHAR(max)
		,IsHazardInvolvedInd  NVARCHAR(max)
		,PropertyItemNum NVARCHAR(max)
		,PropertyItemName NVARCHAR(max)
		,ItemValueAmt NVARCHAR(max)
		,PropertyItemDesc NVARCHAR(max)
		,EstimateRepairTimeDesc NVARCHAR(max)
		,EstimateDamageDesc NVARCHAR(max)
		,EstimateRepairCostAmt NVARCHAR(max)
		,EstimateReplacementCostAmt NVARCHAR(max)
		) lpp
	) AS tmp
		) AS tpl
	where tpl.rn = 1

GO
