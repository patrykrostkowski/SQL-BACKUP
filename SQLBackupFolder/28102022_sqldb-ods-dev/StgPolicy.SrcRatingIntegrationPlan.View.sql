USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcRatingIntegrationPlan]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE    VIEW [StgPolicy].[SrcRatingIntegrationPlan]
AS

SELECT 
	hdr.SourceSystemCode	
	,rip.RatingIntegrationPlanSourceCode	AS SourceCode
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,plt.BaseCurrencyCode 
	,plt.OriginalCurrencyCode 
	,plt.ReportingCurrencyCode 
	,rip.RatingIntegrationPlanDesc
	,rip.RatingIntegrationPlanBaseAmt
	,rip.RatingIntegrationPlanOriginalAmt
	,rip.RatingIntegrationPlanReportingAmt
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
	RatingIntegrationPlan NVARCHAR(MAX) AS JSON
	,BaseCurrencyCode NVARCHAR(MAX)
	,OriginalCurrencyCode NVARCHAR(MAX)
	,ReportingCurrencyCode NVARCHAR(MAX)
	) plt
CROSS APPLY OPENJSON(plt.RatingIntegrationPlan) WITH (
	RatingIntegrationPlanSourceCode NVARCHAR(MAX)
	,RatingIntegrationPlanBaseAmt decimal(19,4)
	,RatingIntegrationPlanOriginalAmt decimal(19,4)
	,RatingIntegrationPlanReportingAmt decimal(19,4)
	,RatingIntegrationPlanDesc NVARCHAR(MAX)
	) rip
GO
