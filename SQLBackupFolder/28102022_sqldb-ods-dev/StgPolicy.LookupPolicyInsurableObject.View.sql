﻿USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[LookupPolicyInsurableObject]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [StgPolicy].[LookupPolicyInsurableObject]
AS
SELECT PolicyInsurableObjectSK
	,SourceCode AS PolicyInsurableObjectSourceCode
	,SourceSystemSK
	,ProcessDateTime
FROM Policy.PolicyInsurableObject
GO
