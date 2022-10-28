USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcPolicyForm]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE    VIEW [StgPolicy].[SrcPolicyForm]
AS
SELECT hdr.SourceSystemCode
	,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,pfm.PolicyFormSourceCode AS SourceCode
	,pol.PolicySourceCode
	,ptr.PolicyTransSourceCode
	,pfm.PolicyFormNum
	,pfm.PolicyFormDesc
	,line.IsValidInd
FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Policy NVARCHAR(max) AS JSON
		) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (
		PolicySourceCode NVARCHAR(max)
		,PolicyTrans NVARCHAR(max) AS JSON
		) pol
CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (
		PolicyTransSourceCode NVARCHAR(max)
		,PolicyForm NVARCHAR(max) AS JSON
		) ptr
CROSS APPLY OPENJSON(ptr.PolicyForm) WITH (
		PolicyFormSourceCode NVARCHAR(max)
		,PolicyFormNum NVARCHAR(max)
		,PolicyFormDesc NVARCHAR(max)
		) pfm


GO
