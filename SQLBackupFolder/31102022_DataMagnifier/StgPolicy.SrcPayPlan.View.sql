USE [DataMagnifier]
GO
/****** Object:  View [StgPolicy].[SrcPayPlan]    Script Date: 31.10.2022 11:55:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [StgPolicy].[SrcPayPlan]
AS
SELECT SourceSystemCode
	,PayPlanCode
	,PayPlanName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, PayPlanCode ORDER BY PayPlanName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,pol.PayPlanCode
			,ISNULL(pol.PayPlanDesc, '') AS PayPlanName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PayPlanCode NVARCHAR(MAX), PayPlanDesc NVARCHAR(MAX)) pol	
		WHERE ISNULL(pol.PayPlanCode, '') <> ''

		) AS tmp
	) AS tpl
GO
