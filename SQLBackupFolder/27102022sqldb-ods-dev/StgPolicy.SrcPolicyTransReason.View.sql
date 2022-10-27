USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcPolicyTransReason]    Script Date: 27.10.2022 12:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE    VIEW [StgPolicy].[SrcPolicyTransReason]
AS
SELECT hdr.SourceSystemCode
	,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,prs.PolicyTransReasonSourceCode AS SourceCode
	,ptr.PolicyTransSourceCode
	,ReasonCode
	,ReasonInformationDesc
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
		,PolicyTransReason NVARCHAR(max) AS JSON
		) ptr
CROSS APPLY OPENJSON(ptr.PolicyTransReason) WITH (
		PolicyTransReasonSourceCode NVARCHAR(max)
		,ReasonCode NVARCHAR(max)
		,ReasonDesc NVARCHAR(max)
		,ReasonInformationDesc NVARCHAR(max)
		) prs

GO
