USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[LookupPolicyLineOfBusiness]    Script Date: 27.10.2022 12:26:26 ******/
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
