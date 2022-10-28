﻿USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[LookupPolicyLineOfBusiness]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [StgPolicy].[LookupPolicyLineOfBusiness]
AS
SELECT PolicyLineofBusinessSK
	,SourceCode AS PolicyLineOfBusinessSourceCode
	,SourceSystemSK
	,ProcessDateTime
FROM Policy.PolicyLineOfBusiness
GO
