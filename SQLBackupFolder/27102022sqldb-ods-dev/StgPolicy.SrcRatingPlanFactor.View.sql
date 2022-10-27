USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcRatingPlanFactor]    Script Date: 27.10.2022 12:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




create       view [StgPolicy].[SrcRatingPlanFactor]
AS
SELECT hdr.SourceSystemCode,
rpf.FactorDesc
,rpf.FactorOptionName
,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
,rpf.FactorTypeCode
,rpf.FactorTypeDesc
,rpf.FactorValue
,rpf.RatingPlanFactorSourceCode as SourceCode
,rtp.RatingPlanSourceCode
,line.IsValidInd
FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Policy NVARCHAR(max) AS JSON
		) hdr
		
CROSS APPLY OPENJSON(hdr.Policy) WITH (
		PolicySourceCode NVARCHAR(max)
		,PolicyTrans NVARCHAR(max) AS JSON
		) pol
CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (
		PolicyTransSourceCode NVARCHAR(max)
		,RatingIntegrationPlan NVARCHAR(max) AS JSON
		) ptr
		cross apply openjson(ptr.RatingIntegrationPlan) WITH(
		RatingIntegrationPlanSourceCode NVARCHAR(max)
		,RatingPlan NVARCHAR(max) as JSON
		) rip
CROSS APPLY OPENJSON(rip.RatingPlan) WITH(
RatingPlanSourceCode NVARCHAR(max) 
,RatingPlanFactor NVARCHAR(max) as JSON
) rtp
CROSS APPLY OPENJSON(rtp.RatingPlanFactor) WITH(
RatingPlanFactorSourceCode NVARCHAR(max) 
,FactorDesc NVARCHAR(max) 
,FactorOptionName NVARCHAR(max) 
,FactorTypeCode NVARCHAR(max) 
,FactorTypeDesc NVARCHAR(max) 
,FactorValue NVARCHAR(max)
)rpf




GO
