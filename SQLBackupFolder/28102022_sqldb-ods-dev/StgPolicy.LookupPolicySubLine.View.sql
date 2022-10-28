USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[LookupPolicySubLine]    Script Date: 28.10.2022 15:04:22 ******/
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
