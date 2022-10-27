USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[LookupPolicy]    Script Date: 27.10.2022 12:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [StgPolicy].[LookupPolicy]
AS
SELECT PolicySK
	,SourceCode AS PolicySourceCode
	,SourceSystemSK
	,ProcessDateTime
	,InsuredSK
FROM Policy.Policy
GO
