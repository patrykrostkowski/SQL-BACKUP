USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[LookupPolicyGeography]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [StgPolicy].[LookupPolicyGeography]
AS
SELECT PolicyGeographySK
	,SourceCode AS PolicyGeographySourceCode
	,SourceSystemSK
	,ProcessDateTime
FROM Policy.PolicyGeography
GO
