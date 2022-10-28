USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcPartyFrontingCompany]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE   VIEW [StgClaim].[SrcPartyFrontingCompany]
AS



select
hdr.SourceSystemCode
, pfc.FrontingCompanySourceCode as [SourceCode]
,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127) as ProcessDateTime
,null as PartySK
,pfc.IsMGAInd as [IsMGAInd]
,pfc.FrontingCompanyName as [FrontingCompanyName]
,pfc.NCCICompanyCode as [NCCICompanyCode]
,line.IsValidInd
FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
			SourceSystemCode NVARCHAR(max)
			,ProcessDateTime NVARCHAR(max)
			,Claim NVARCHAR(max) AS JSON
			) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (
			ClaimPolicy NVARCHAR(max)  AS JSON
			,Claimant NVARCHAR(max)  AS JSON
			) clm
			
		CROSS APPLY OPENJSON(clm.ClaimPolicy) WITH (
			ClaimPolicySourceCode NVARCHAR(MAX)	 
			,FrontingCompany NVARCHAR(max) AS JSON
			)clp
		CROSS APPLY OPENJSON(clp.FrontingCompany) WITH(
			FrontingCompanyName NVARCHAR(max)
			,NCCICompanyCode NVARCHAR(max)
			,FrontingCompanySourceCode  NVARCHAR(max)
			,IsMGAInd int)pfc
	

GO
