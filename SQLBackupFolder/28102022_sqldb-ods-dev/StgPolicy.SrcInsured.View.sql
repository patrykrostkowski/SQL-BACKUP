USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcInsured]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE    VIEW [StgPolicy].[SrcInsured]
AS


SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY SourceCode DESC
			) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,ins.InsuredSourceCode AS SourceCode
			,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
			,par.PartyInfoSourceCode
			,ins.AccountNum
			,ins.ParentName
			,ins.ParentDUNSNum
			,ins.DBAName
			,ins.USTickerSymbolName
			,ins.DomicileCountryCode
			,ins.DomicileStateCode
			,ins.TotalEmployeesNum
			,ins.MarketValueAmt
			,ins.SICCode
			,ins.NorthAmericanIndustryClassificationCode
			,ins.PrimaryDBAIndustryName
			,ins.StateOfIncorporationName
			,line.IsValidInd
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				SourceSystemCode NVARCHAR(max)
				,ProcessDateTime NVARCHAR(max)
				,Policy NVARCHAR(max) AS JSON
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (Insured NVARCHAR(max) AS JSON) pol
		CROSS APPLY OPENJSON(pol.Insured) WITH (
				AccountNum NVARCHAR(max)
				,InsuredSourceCode NVARCHAR(max)
				,ParentName NVARCHAR(max)
				,ParentDUNSNum NVARCHAR(max)
				,DBAName NVARCHAR(max)
				,USTickerSymbolName NVARCHAR(max)
				,DomicileCountryCode NVARCHAR(max)
				,DomicileStateCode NVARCHAR(max)
				,TotalEmployeesNum NVARCHAR(max)
				,MarketValueAmt NVARCHAR(max)
				,SICCode NVARCHAR(max)
				,NorthAmericanIndustryClassificationCode NVARCHAR(max)
				,PrimaryDBAIndustryName NVARCHAR(max)
				,StateOfIncorporationName NVARCHAR(max)
				,PartyInfo NVARCHAR(max) AS JSON
				) ins
		CROSS APPLY OPENJSON(ins.PartyInfo) WITH (
				PartyInfoSourceCode	NVARCHAR(max)
				) par
		) tmp
	) tpl
	WHERE rn = 1
GO
