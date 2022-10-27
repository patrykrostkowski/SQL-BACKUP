USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcCatastrophe]    Script Date: 27.10.2022 12:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE     VIEW  [StgClaim].[SrcCatastrophe]
AS
SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (
SELECT hdr.SourceSystemCode
       ,Convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	   ,ctp.CatastropheSourceCode AS SourceCode
	   ,ctp.CatastropheTypeCode
	   ,ctp.CatastropheName
	   ,ctp.CatastropheNum
	   ,Convert(DATETIME,ctp.CatastropheValidFromDate, 127) AS CatastropheValidFromDate
	   ,Convert(DATETIME, ctp.CatastropheValidToDate, 127) AS CatastropheValidToDate
	   ,ctp.CatastropheDesc
	   ,ctp.IsActiveInd
	   ,line.IsValidInd

FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.Jsonline) WITH (
         SourceSystemCode NVARCHAR(max) 
		 ,ProcessDateTime NVARCHAR(max)
		 ,Claim NVARCHAR (max) AS JSON
		  ) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (
	 Catastrophe NVARCHAR(max)  AS JSON
	 ) cph
CROSS APPLY  OPENJSON(cph.Catastrophe) WITH (
         CatastropheSourceCode NVARCHAR(max) 
		,CatastropheTypeCode  NVARCHAR(max)
		,CatastropheName NVARCHAR (max) 
		,CatastropheNum NVARCHAR (max) 
		,CatastropheValidFromDate NVARCHAR (max) 
		,CatastropheValidToDate NVARCHAR (max)
		,CatastropheDesc NVARCHAR (max)
		,IsActiveInd NVARCHAR (max)
		) ctp
	) AS tmp
		) AS tpl
	where tpl.rn = 1

GO
