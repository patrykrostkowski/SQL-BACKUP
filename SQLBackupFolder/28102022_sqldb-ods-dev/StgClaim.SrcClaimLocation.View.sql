USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcClaimLocation]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create     View [StgClaim].[SrcClaimLocation]
AS
SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (
select hdr.SourceSystemCode
	,convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,clt.ClaimLocationSourceCode AS SourceCode
	,clt.StateCode 
	,clt.CountryCode 
	,clt.AddressTypeCode 
	,clt.CityName 
	,clt.IsPrimaryClaimAddressInd 
	,clt.PostalCode 
	,clt.Line1Address 
	,clt.Line2Address 
	,clt.Line3Address 
	,clt.Line4Address 
	,clm.ClaimSourceCode
	,line.IsValidInd
	FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Claim NVARCHAR(max) AS JSON
		) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (
		ClaimSourceCode NVARCHAR(max)
		,ClaimLocation NVARCHAR(max) AS JSON
		) clm
		CROSS APPLY OPENJSON(clm.ClaimLocation) WITH (
		ClaimLocationSourceCode NVARCHAR(max)
		,StateCode NVARCHAR(max)
		,CountryCode NVARCHAR(max)
		,AddressTypeCode NVARCHAR(max)
		,CityName NVARCHAR(max)
		,IsPrimaryClaimAddressInd INT
		,PostalCode NVARCHAR(max)
		,Line1Address NVARCHAR(max)
		,Line2Address NVARCHAR(max)
		,Line3Address NVARCHAR(max)
		,Line4Address NVARCHAR(max)
		) clt
	) AS tmp
		) AS tpl
	where tpl.rn = 1
GO
