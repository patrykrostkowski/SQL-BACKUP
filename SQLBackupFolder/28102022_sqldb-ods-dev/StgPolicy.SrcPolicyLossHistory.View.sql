USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcPolicyLossHistory]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     VIEW [StgPolicy].[SrcPolicyLossHistory]
AS
SELECT 
	hdr.SourceSystemCode
	,convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,lsh.PolicyLossHistorySourceCode AS SourceCode
	,pol.QuoteNum
	,lsh.PolicyNum
	,pol.PolicySourceCode
	,lsh.SuffixPolicyRenewalNum
	,lsh.AddressLine1
	,lsh.AddressLine2
	,lsh.AddressLine3
	,lsh.AddressLine4
	,lsh.CityName
	,lsh.StateName
	,lsh.PostalCode
	,lsh.LossReportingFromDate
	,lsh.LossReportingToDate
	,lsh.ClaimNum
	,lsh.ReopenReasonDesc
	,lsh.CoverageName
	,lsh.CauseofLossName
	,lsh.CauseofLossCode
	,lsh.CarsDamagedNum
	,lsh.BaseCurrencyCode
	,lsh.NetPaidBaseAmt
	,lsh.AdjustedPaidBaseAmt
	,lsh.DeductibleAppliedBaseAmt
	,lsh.NetIncurredLossBaseAmt
	,lsh.EndorsementCode
	,lsh.LossLevelCode
	,lsh.EndorsementSessionNum
	,lsh.EndorsementEffectiveDate


FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Policy NVARCHAR(max) AS JSON
		) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (
		QuoteNum NVARCHAR(MAX)
		,PolicySourceCode NVARCHAR(MAX)
		,LossHistory NVARCHAR(max) AS JSON
		) pol
cross APPLY OPENJSON(pol.LossHistory) WITH (
		PolicyNum NVARCHAR(MAX)
		,PolicyLossHistorySourceCode NVARCHAR(MAX)
		,SuffixPolicyRenewalNum NVARCHAR(MAX)
		,AddressLine1 NVARCHAR(MAX)
		,AddressLine2 NVARCHAR(MAX)
		,AddressLine3 NVARCHAR(MAX)
		,AddressLine4 NVARCHAR(MAX)
		,CityName NVARCHAR(MAX)
		,StateName NVARCHAR(MAX)
		,PostalCode NVARCHAR(MAX)
		,LossReportingFromDate NVARCHAR(MAX)
		,LossReportingToDate NVARCHAR(MAX)
		,ClaimNum NVARCHAR(MAX)
		,ReopenReasonDesc NVARCHAR(MAX)
		,CoverageName NVARCHAR(MAX)
		,CauseofLossName NVARCHAR(MAX)
		,CauseofLossCode NVARCHAR(MAX)
		,CarsDamagedNum NVARCHAR(MAX)
		,BaseCurrencyCode NVARCHAR(MAX)
		,NetPaidBaseAmt NVARCHAR(MAX)
		,AdjustedPaidBaseAmt NVARCHAR(MAX)
		,DeductibleAppliedBaseAmt NVARCHAR(MAX)
		,NetIncurredLossBaseAmt NVARCHAR(MAX)
		,EndorsementCode NVARCHAR(MAX)
		,LossLevelCode NVARCHAR(MAX)
		,EndorsementSessionNum NVARCHAR(MAX)
		,EndorsementEffectiveDate NVARCHAR(MAX)
		) lsh



GO
