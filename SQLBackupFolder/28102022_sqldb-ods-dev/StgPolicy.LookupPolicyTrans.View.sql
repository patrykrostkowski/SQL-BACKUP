USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[LookupPolicyTrans]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create VIEW [StgPolicy].[LookupPolicyTrans]
AS
SELECT PolicyTransSK
	,SourceCode AS PolicyTransSourceCode
	,SourceSystemSK
	,ProcessDateTime
	,PolicyTransNum
FROM Policy.PolicyTrans
GO
