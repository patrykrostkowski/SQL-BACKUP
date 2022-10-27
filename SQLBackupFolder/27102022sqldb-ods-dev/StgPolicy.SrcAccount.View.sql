USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcAccount]    Script Date: 27.10.2022 12:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE    View [StgPolicy].[SrcAccount]
as
SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (
Select hdr.SourceSystemCode
,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
,act.AccountSourceCode AS SourceCode
,act.AccountName
,act.AccountNum
,act.BankName
,act.BankRoutingNum
,act.EffectiveDate
,act.IsAccountBillInd
,act.PrimaryContactFullName
,act.PrimaryPhoneNum
,pio.PartyInfoSourceCode
,line.IsValidInd
FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Policy NVARCHAR(max) AS JSON
		) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (
		Account NVARCHAR(max) AS JSON
		) pol
CROSS APPLY OPENJSON(pol.Account) WITH (
		AccountSourceCode NVARCHAR(max)
		,AccountName NVARCHAR(max) 
		,AccountNum NVARCHAR(max) 
		,BankName NVARCHAR(max) 
		,BankRoutingNum NVARCHAR(max) 
		,EffectiveDate NVARCHAR(max) 
		,IsAccountBillInd INT 
		,PrimaryContactFullName NVARCHAR(max) 
		,PrimaryPhoneNum NVARCHAR(max) 
		,PartyInfo NVARCHAR(max) AS JSON
		) act
CROSS APPLY OPENJSON(act.PartyInfo) WITH (
		PartyInfoSourceCode NVARCHAR(max)
		) pio
				)tpl
	)tmp
	where tmp.rn = 1
GO
