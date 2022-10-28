USE [sqldb-ods-dev]
GO
/****** Object:  View [StgDM].[SrcDIMPaymentScheduleType]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [StgDM].[SrcDIMPaymentScheduleType]
AS

SELECT SourceSystemCode
	,PaymentScheduleTypeCode
	,PaymentScheduleTypeName
	,PaymentScheduleTypeAbrv
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, PaymentScheduleTypeCode ORDER BY PaymentScheduleTypeName DESC) AS rn
	FROM (
		SELECT sst.SourceSystemCode
			,ptt.PayPlanCode AS PaymentScheduleTypeCode						  
			,ISNULL(ptt.PayPlanName, '') AS PaymentScheduleTypeName	
			,CAST(ptt.PayPlanCode AS VARCHAR(20)) AS PaymentScheduleTypeAbrv
		FROM Typelist.PayPlan ptt												  
		JOIN Typelist.SourceSystem sst on sst.SourceSystemSK = ptt.SourceSystemSK
		WHERE ISNULL(ptt.PayPlanCode, '') <> ''
		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
