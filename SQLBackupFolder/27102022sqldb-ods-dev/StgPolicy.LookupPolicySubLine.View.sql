USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[LookupPolicySubLine]    Script Date: 27.10.2022 12:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [StgPolicy].[LookupPolicySubLine]
AS
SELECT PolicySubLineSK
	,SourceCode AS PolicySubLineSourceCode
	,SourceSystemSK
	,ProcessDateTime
FROM Policy.PolicySubLine
GO
