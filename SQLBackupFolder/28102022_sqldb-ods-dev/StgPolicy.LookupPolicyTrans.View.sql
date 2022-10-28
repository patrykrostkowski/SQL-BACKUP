USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[LookupPolicyTrans]    Script Date: 28.10.2022 11:09:26 ******/
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
