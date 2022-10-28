USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcWritingCompany]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE  
	

 VIEW [StgClaim].[SrcWritingCompany]
AS
SELECT * FROM(
SELECT *,ROW_NUMBER() OVER (
			PARTITION BY SourceCode, SourceSystemCode ORDER BY SourceCode, SourceSystemCode
			) row_num
FROM (
	SELECT 
		hdr.SourceSystemCode
		,wrc.WritingCompanySourceCode AS SourceCode
		,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
		,wrc.PartySourceCode
		,isnull(wrc.IsBranchInd,0) as IsBranchInd
		,isnull(wrc.IsFrontingCompanyInd,0) as IsFrontingCompanyInd
		,wrc.BaseCurrencyCode
		,wrc.WritingCompanyCode
		,wrc.WritingCompanyName
		,wrc.NorthAmericanIndustryClassificationCode
		,wrc.FederalEmployerIdentificationNumberCode
		,wrc.AMBestCode
		,isnull(wrc.IsActiveInd,0) as IsActiveInd
		,isnull(wrc.IsAdmittedInd,0) as IsAdmittedInd
		,wrc.NCCICompanyCode
		,line.IsValidInd
	FROM StgClaim.ClaimData line
	CROSS APPLY OPENJSON(line.JsonLine) WITH (
			SourceSystemCode NVARCHAR(max)
			,ProcessDateTime NVARCHAR(max)
			,Claim NVARCHAR(max) AS JSON
			) hdr
	CROSS APPLY OPENJSON(hdr.Claim) WITH (ClaimPolicy NVARCHAR(max) AS JSON) clm
	CROSS APPLY OPENJSON(clm.ClaimPolicy) WITH (
			WritingCompany NVARCHAR(max) AS JSON
			) ptr
	CROSS APPLY OPENJSON(ptr.WritingCompany) WITH (
			IsBranchInd NVARCHAR(max)
			,WritingCompanySourceCode NVARCHAR(max)
			,IsFrontingCompanyInd NVARCHAR(max)
			,BaseCurrencyCode NVARCHAR(max)
			,WritingCompanyCode NVARCHAR(max)
			,WritingCompanyName NVARCHAR(max)
			,NorthAmericanInsuranceClassificationCode NVARCHAR(max)
			,NorthAmericanIndustryClassificationCode NVARCHAR(max)
			,FederalEmployerIdentificationNumberCode NVARCHAR(max)
			,AMBestCode NVARCHAR(max)
			,IsActiveInd NVARCHAR(max)
			,IsAdmittedInd NVARCHAR(max)
			,NCCICompanyCode NVARCHAR(max)
			,PartySourceCode NVARCHAR(max)
			) wrc
	
	) tmp ) row
WHERE row.row_num = 1
GO
