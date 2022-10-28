USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcRatingPlan]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE    VIEW [StgPolicy].[SrcRatingPlan]
AS
SELECT hdr.SourceSystemCode
	,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,try_convert(DATETIME, prp.EffectiveDate, 127) AS EffectiveDate
	,try_convert(DATETIME, prp.ExpirationDate, 127) AS ExpirationDate
    ,rip.RatingIntegrationPlanSourceCode
	--,prp.RatingPlanDesc 
	,prp.RatingPlanKeyCode--- added 
	,prp.RatingPlanKeyDesc--added
	,prp.RatingBasisCode 
    ,prp.[QuoteSourceCode] 
    ,pol.[PolicySourceCode]
    ,ptr.[PolicyTransSourceCode]
    ,prp.LineOfBusinessSourceCode AS PolicyLineOfBusinessSourceCode
	,prp.RatingPlanSourceCode AS SourceCode
	  ,prp.InsurableObjectSourceCode AS PolicyInsurableObjectSourceCode
	  ,try_convert(DATETIME, prp.CreateDateTime, 127) AS CreateDateTime
	  ,prp.CoverageSourceCode AS PolicyCoverageSourceCode
	  ,prp.LevelTypeCode
	  ,prp.GeographySourceCode AS PolicyGeographySourceCode
      ,prp.[ClassCode] 
      ,prp.[ClassCodeDesc]
      ,prp.[MajorClassCode]
      ,prp.[ClassExceptionCode]
      ,try_convert(DATETIME, prp.[ClassCodeEffectiveDate], 127) AS [ClassCodeEffectiveDate]
      ,try_convert(DATETIME, prp.[ClassCodeExpirationDate], 127) AS [ClassCodeExpirationDate]
	  ,prp.ExposureTypeCode 
	  ,ptr.BaseCurrencyCode
	  ,ptr.OriginalCurrencyCode
	  ,ptr.ReportingCurrencyCode
      ,prp.[RatingPlanBaseAmt]
      ,prp.[RatingPlanOriginalAmt]
      ,prp.[RatingPlanReportingAmt]
      ,prp.[TermPremiumBaseAmt]
      ,prp.[MinimumPremiumBaseAmt]
      ,prp.[EstimatedWrittenPremiumBaseAmt]
      ,prp.[ModifiedTermPremiumBaseAmt]
      ,prp.[AnnualExpenseBaseAmt]
      ,prp.[MinimumPremiumOverrideBaseAmt]
      ,prp.[OOSOffsetPremiumAmt]
      ,prp.[OOSFuturePremAmt]
	  ,prp.StatCode
	  ,prp.StatCodeDesc
     ,prp.StatCodeEffectiveDate
     ,prp.StatCodeExpirationDate
	 ,line.IsValidInd
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,ProcessDateTime NVARCHAR(max)
				,SourceSystemCode NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (
				PolicySourceCode NVARCHAR(MAX)
				,PolicyTrans NVARCHAR(MAX) AS JSON
				) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (
				PolicyTransSourceCode NVARCHAR(max)
				,BaseCurrencyCode NVARCHAR(MAX)
				,OriginalCurrencyCode NVARCHAR(MAX)
				,ReportingCurrencyCode NVARCHAR(MAX)
				,RatingIntegrationPlan NVARCHAR(max) AS JSON
				) ptr
	 CROSS APPLY OPENJSON(ptr.RatingIntegrationPlan) WITH(
		RatingIntegrationPlanSourceCode NVARCHAR(max)
		,RatingPlan NVARCHAR(max) as JSON
		) rip
CROSS APPLY OPENJSON(rip.RatingPlan) WITH(
RatingPlanSourceCode NVARCHAR(max) 
	,CreateDateTime NVARCHAR(max) 
	,EffectiveDate NVARCHAR(max) 
	,ExpirationDate NVARCHAR(max) 
	,RatingPlanDesc NVARCHAR(max) 
	,RatingBasisCode NVARCHAR(max) 
	,ClassCode NVARCHAR(max) 
	,ClassCodeDesc NVARCHAR(max) 
	,MajorClassCode NVARCHAR(max) 
	,GeographySourceCode NVARCHAR(max)
	,ClassExceptionCode NVARCHAR(max) 
	,ClassCodeEffectiveDate NVARCHAR(max) 
	,ClassCodeExpirationDate date
	,InsurableObjectSourceCode NVARCHAR(max) 
	,RatingPlanBaseAmt NVARCHAR(max) 
	,RatingPlanOriginalAmt NVARCHAR(max) 
	,RatingPlanReportingAmt NVARCHAR(max) 
	,TermPremiumBaseAmt NVARCHAR(max) 
	,MinimumPremiumBaseAmt NVARCHAR(max) 
	,EstimatedWrittenPremiumBaseAmt NVARCHAR(max) 
	,QuoteSourceCode NVARCHAR(max)
	,[ModifiedTermPremiumBaseAmt] NVARCHAR(max)
    ,[AnnualExpenseBaseAmt] NVARCHAR(max)
    ,[MinimumPremiumOverrideBaseAmt] NVARCHAR(max)
    ,[OOSOffsetPremiumAmt] NVARCHAR(max)
    ,[OOSFuturePremAmt] NVARCHAR(max)
	,LineOfBusinessSourceCode NVARCHAR(max)
	,CoverageSourceCode NVARCHAR(max)
	,LevelTypeCode  NVARCHAR(max)
	,ExposureTypeCode  NVARCHAR(max)
	,RatingPlanKeyCode NVARCHAR(max)
	,RatingPlanKeyDesc  NVARCHAR(max)
	,StatCode NVARCHAR(max)
	,StatCodeDesc NVARCHAR(max)
	,StatCodeEffectiveDate date
     ,StatCodeExpirationDate date

	
  ) prp
	

GO
