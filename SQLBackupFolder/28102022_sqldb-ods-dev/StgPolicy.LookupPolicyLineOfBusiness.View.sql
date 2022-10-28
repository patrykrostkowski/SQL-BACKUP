USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[LookupPolicyLineOfBusiness]    Script Date: 28.10.2022 11:09:26 ******/
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
