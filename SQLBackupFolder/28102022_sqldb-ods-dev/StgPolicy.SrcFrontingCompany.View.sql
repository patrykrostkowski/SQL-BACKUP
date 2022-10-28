USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcFrontingCompany]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   
	

 VIEW [StgPolicy].[SrcFrontingCompany]
AS


SELECT 
	hdr.SourceSystemCode
	,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,frc.FrontingCompanySourceCode AS SourceCode
	,frc.IsMGAInd
	,frc.FrontingCompanyName
	,frc.NCCICompanyCode
	,line.IsValidInd
FROM StgPolicy.PolicyData line
	CROSS APPLY OPENJSON(line.JsonLine) WITH (
			SourceSystemCode NVARCHAR(max)
			,ProcessDateTime NVARCHAR(max)
			,Policy NVARCHAR(max) AS JSON
			) hdr
	CROSS APPLY OPENJSON(hdr.Policy) WITH (
			PolicyTrans NVARCHAR(max) AS JSON
			) pol
	CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (
			FrontingCompany NVARCHAR(max) AS JSON
			) ptr
	CROSS APPLY OPENJSON(ptr.FrontingCompany) WITH (
			FrontingCompanySourceCode NVARCHAR(MAX)
			,IsMGAInd NVARCHAR(MAX)
			,FrontingCompanyName NVARCHAR(MAX)
			,NCCICompanyCode NVARCHAR(MAX)
			
			) frc

UNION ALL

SELECT 
	hdr.SourceSystemCode
	,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,frc.FrontingCompanySourceCode AS SourceCode
	,frc.IsMGAInd
	,frc.FrontingCompanyName
	,frc.NCCICompanyCode
	,line.IsValidInd
FROM StgPolicy.PolicyData line
	CROSS APPLY OPENJSON(line.JsonLine) WITH (
			SourceSystemCode NVARCHAR(max)
			,ProcessDateTime NVARCHAR(max)
			,Policy NVARCHAR(max) AS JSON
			) hdr
	CROSS APPLY OPENJSON(hdr.Policy) WITH (
			FrontingCompany NVARCHAR(max) AS JSON
			) pol
	CROSS APPLY OPENJSON(pol.FrontingCompany) WITH (
			FrontingCompanySourceCode NVARCHAR(MAX)
			,IsMGAInd NVARCHAR(MAX)
			,FrontingCompanyName NVARCHAR(MAX)
			,NCCICompanyCode NVARCHAR(MAX)
			
			) frc





GO
