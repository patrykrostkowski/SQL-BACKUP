USE [DataMagnifier]
GO
/****** Object:  View [StgPolicy].[SrcFactorType]    Script Date: 02.11.2022 09:21:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [StgPolicy].[SrcFactorType]
AS
SELECT SourceSystemCode
	,FactorTypeCode
	,FactorTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, FactorTypeCode ORDER BY FactorTypeName DESC) AS rn
	FROM (
	   	SELECT hdr.SourceSystemCode
			,rpf.FactorTypeCode
			,ISNULL(rpf.FactorTypeDesc, '') AS FactorTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol	
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (RatingIntegrationPlan NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.RatingIntegrationPlan) WITH (RatingPlan NVARCHAR(MAX) AS JSON) rip
		CROSS APPLY OPENJSON(rip.RatingPlan) WITH (RatingPlanFactor NVARCHAR(MAX) AS JSON) rtp
		CROSS APPLY OPENJSON(rtp.RatingPlanFactor) WITH (FactorTypeCode NVARCHAR(MAX), FactorTypeDesc NVARCHAR(MAX)) rpf
		WHERE ISNULL(rpf.FactorTypeCode, '') <> ''

		) AS tmp
	) AS tpl
GO
