USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgADM].[SrcInformationTechnologySystem]    Script Date: 28.10.2022 13:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [StgADM].[SrcInformationTechnologySystem]
AS

SELECT
	--,null as RowCreatedBySK		-- populated in ADF
	--,null as RowCreatedDtm 		-- populated in ADF
	--,null as RowLastUpdatedBySK 	-- populated in ADF
	--,null as RowLastUpdatedDtm	-- populated in ADF
	CAST('1900-01-01' AS DATETIME) AS RowEffectiveFromDate	
	,CAST('3000-01-01' AS DATETIME) AS RowEffectiveToDate
	,0 AS GovernanceValidationInd	
	,'N/A' as SourceSystemSkCode
	,'UnknownInSrc' as InformationTechnologySystemTypeCode			
	,'UnknownInSrc' as ParentInformationTechnologySystemCode
	,SourceSystemCode AS InformationTechnologySystemCode
	,null as InformationTechnologySystemName 
	,null as InformationTechnologySystemAbrv 
	,null as InformationTechnologySystemDefn 

FROM Typelist.SourceSystem	
GO
