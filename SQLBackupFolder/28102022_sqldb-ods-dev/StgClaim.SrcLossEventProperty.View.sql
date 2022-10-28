USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcLossEventProperty]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE     VIEW [StgClaim].[SrcLossEventProperty]
AS

SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (
	
SELECT  
	hdr.SourceSystemCode
	,lep.LossEventPropertytSourceCode AS SourceCode
	,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,lev.LossEventSourceCode
	,lep.PropertyDesc
	,lep.AssessmentStatusCode
	,lep.ClassificationCode
	,lep.ExternalWallMaterialTypeCode
	,lep.LossAreaTypeCode
	,lep.OccupancyTypeCode
	,lep.RoofMaterialTypeCode
	,lep.SprinklerTypeCode
	,lep.PropertyLocationLine1Address
	,lep.PropertyLocationLine2Address
	,lep.PropertyLocationLine3Address
	,lep.PropertyLocationLine4Address
	,lep.PropertyLocationCityName
	,lep.StateCode
	,lep.PropertyLocationPostalCode
	,lep.CountryCode
	,lep.IsPrimaryLocationInd
	,lep.IsAlreadyRepairedInd
	,lep.IsEstimateReceivedInd
	,lep.IsHazardInvolvedInd
	,lep.IsIncludeContentLineItemsInd
	,lep.IsIncludeLineItemsInd
	,lep.IsMoldInvolvedInd
	,try_convert(DATETIME, lep.PropertyAssessmentCloseDate, 127) AS PropertyAssessmentCloseDate
	,lep.PropertyAssessmentName
	,lep.PropertyAssessmentCommentTxt
	,lep.EstimateRepairTimeDesc
	,lep.EstimateDamageDesc
	,lep.NumOfStories
	,lep.PeriodOfRestorationDesc
	,lep.EstimateRepairCostAmt
	,line.IsValidInd
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(max)
	,ProcessDateTime NVARCHAR(max)
	,Claim NVARCHAR(max) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (
	LossEvent NVARCHAR(max) AS JSON
	) clm
CROSS APPLY OPENJSON(clm.LossEvent) WITH (
	LossEventProperty NVARCHAR(max) AS JSON
	,LossEventSourceCode NVARCHAR(max)
	) lev
CROSS APPLY OPENJSON(lev.LossEventProperty) WITH (
	PropertyDesc NVARCHAR(MAX)
	,AssessmentStatusCode NVARCHAR(MAX)
	,ClassificationCode NVARCHAR(MAX)
	,LossEventPropertytSourceCode NVARCHAR(MAX)
	,ExternalWallMaterialTypeCode NVARCHAR(MAX)
	,LossAreaTypeCode NVARCHAR(MAX)
	,OccupancyTypeCode NVARCHAR(MAX)
	,RoofMaterialTypeCode NVARCHAR(MAX)
	,SprinklerTypeCode NVARCHAR(MAX)
	,PropertyLocationLine1Address NVARCHAR(MAX)
	,PropertyLocationLine2Address NVARCHAR(MAX)
	,PropertyLocationLine3Address NVARCHAR(MAX)
	,PropertyLocationLine4Address NVARCHAR(MAX)
	,PropertyLocationCityName NVARCHAR(MAX)
	,StateCode NVARCHAR(MAX)
	,PropertyLocationPostalCode NVARCHAR(MAX)
	,CountryCode NVARCHAR(MAX)
	,IsPrimaryLocationInd tinyint
	,IsAlreadyRepairedInd tinyint
	,IsEstimateReceivedInd int
	,IsHazardInvolvedInd int
	,IsIncludeContentLineItemsInd tinyint
	,IsIncludeLineItemsInd tinyint
	,IsMoldInvolvedInd int
	,PropertyAssessmentCloseDate date
	,PropertyAssessmentName NVARCHAR(MAX)
	,PropertyAssessmentCommentTxt NVARCHAR(MAX)
	,EstimateRepairTimeDesc NVARCHAR(MAX)
	,EstimateDamageDesc NVARCHAR(MAX)
	,NumOfStories NVARCHAR(MAX)
	,PeriodOfRestorationDesc NVARCHAR(MAX)
	,EstimateRepairCostAmt decimal
	) lep
	) AS tmp
		) AS tpl
	where tpl.rn = 1

GO
