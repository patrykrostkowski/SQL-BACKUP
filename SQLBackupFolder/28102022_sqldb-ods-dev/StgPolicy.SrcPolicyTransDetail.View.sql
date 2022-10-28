USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcPolicyTransDetail]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create    VIEW [StgPolicy].[SrcPolicyTransDetail]
AS
SELECT hdr.SourceSystemCode
	,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,ptr.PolicyTransSourceCode AS SourceCode
	,ptr.PolicyTransSourceCode
    ,IsTradeAssocInd
    ,IndustryClassCode
    ,IsMultilineDiscountInd
    ,IsDriverMonitoringInfoInd
    ,IsManualAuditInd
    ,MarketSegmentCode
    ,IsTPAUsedInd
    ,NumEmployee
    ,IsBrokerageInd
    ,IsUnionInd
    ,IsQuoteEZPayInd
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
		,IsTradeAssocInd INT
		,IndustryClassCode NVARCHAR(max)
		,IsMultilineDiscountInd INT
		,IsDriverMonitoringInfoInd INT
		,IsManualAuditInd INT
		,MarketSegmentCode NVARCHAR(max)
		,IsTPAUsedInd INT
		,NumEmployee INT
		,IsBrokerageInd INT
		,IsUnionInd INT
		,IsQuoteEZPayInd INT
		,WritingCompany NVARCHAR(max) AS JSON
		,TransactionCost NVARCHAR(max) AS JSON
		) ptr



GO
