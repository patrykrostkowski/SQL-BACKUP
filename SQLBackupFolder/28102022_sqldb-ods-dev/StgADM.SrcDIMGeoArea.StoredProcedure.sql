USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgADM].[SrcDIMGeoArea]    Script Date: 28.10.2022 15:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [StgADM].[SrcDIMGeoArea] @CutOffDateFrom VARCHAR(100)
AS
DECLARE @DateFrom DATETIME = cast(@CutOffDateFrom AS DATETIME)

SELECT 
	SourceSystemCode
	,GeoAreaCode
	,RowEffectiveFromDatetime
	,RowEffectiveToDatetime
	,GovernanceValidationInd
	,StandardValueInd
	,StandardValueCode
	,LineOfBusinessCode
	,ParentGeoAreaCode
	,GeoAreaTypeCode
	,ISNULL(GeoAreaShortName, GeoAreaCode) AS GeoAreaShortName
	,ISNULL(GeoAreaFullyQualifiedName, GeoAreaCode) AS GeoAreaFullyQualifiedName
	,ISNULL(GeoAreaAbrv, GeoAreaCode) AS GeoAreaAbrv
	,GeoAreaPlusParentName
	,GeoAreaDefn
	,CountryName
	,tpl.rn
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY GeoAreaCode, SourceSystemCode ORDER BY SourceSystemCode, GeoAreaCode DESC) AS rn
	FROM (
		SELECT 
			--GeoAreaSK 
			--RowCreatedBySK		--populated in ADF
			--RowLastUpdatedBySK	--populated in ADF
			--RowCreatedDtm			--populated in ADF
			--RowLastUpdatedDtm		--populated in ADF
			src.SourceSystemCode AS SourceSystemCode 
			,cast('1900-01-01' AS DATETIME) AS RowEffectiveFromDatetime
			,cast('3000-01-01' AS DATETIME) AS RowEffectiveToDatetime
			,0 AS GovernanceValidationInd
			,0 AS StandardValueInd
			,'NoStdVal' AS StandardValueCode 
			,'NoETL' AS LineOfBusinessCode
			,'UnknownInSrc' AS ParentGeoAreaCode 
			,'STATE' AS GeoAreaTypeCode
			,sta.StateCode AS GeoAreaCode
			,sta.StateName AS GeoAreaShortName
			,sta.StateName AS GeoAreaFullyQualifiedName
			,CAST(sta.StateCode AS VARCHAR(20)) AS GeoAreaAbrv 
			,NULL AS GeoAreaPlusParentName 
			,NULL AS GeoAreaDefn 
			,null as CountryName
		FROM Typelist.STATE sta
		JOIN Typelist.SourceSystem src ON sta.SourceSystemSK = src.SourceSystemSK
		where sta.ETLUpdateDateTime > @DateFrom

		UNION ALL
		
		SELECT 
			--GeoAreaSK 
			--RowCreatedBySK		--populated in ADF
			--RowLastUpdatedBySK	--populated in ADF
			--RowCreatedDtm			--populated in ADF
			--RowLastUpdatedDtm		--populated in ADF
			src.SourceSystemCode AS SourceSystemCode 
			,cast('1900-01-01' AS DATETIME) AS RowEffectiveFromDatetime
			,cast('3000-01-01' AS DATETIME) AS RowEffectiveToDatetime
			,0 AS GovernanceValidationInd
			,1 AS StandardValueInd
			,'NoStdVal' AS StandardValueCode 
			,'NoETL' AS LineOfBusinessCode
			,'UnknownInSrc' AS ParentGeoAreaCode
			,'CNTRY' AS GeoAreaTypeCode 
			,cty.CountryCode AS GeoAreaCode
			,cty.CountryName AS GeoAreaShortName
			,cty.CountryName AS GeoAreaFullyQualifiedName
			,CAST(cty.CountryCode AS VARCHAR(20)) AS GeoAreaAbrv
			,NULL AS GeoAreaPlusParentName 
			,NULL AS GeoAreaDefn
			,cty.CountryName
		FROM Typelist.Country cty
		JOIN Typelist.SourceSystem src ON cty.SourceSystemSK = src.SourceSystemSK
		where cty.ETLUpdateDateTime > @DateFrom

		UNION ALL
		
		SELECT
			--GeoAreaSK 
			--RowCreatedBySK		--populated in ADF
			--RowLastUpdatedBySK	--populated in ADF
			--RowCreatedDtm			--populated in ADF
			--RowLastUpdatedDtm		--populated in ADF
			src.SourceSystemCode AS SourceSystemCode 
			,cast('1900-01-01' AS DATETIME) AS RowEffectiveFromDatetime
			,cast('3000-01-01' AS DATETIME) AS RowEffectiveToDatetime
			,0 AS GovernanceValidationInd
			,1 AS StandardValueInd
			,'NoStdVal' AS StandardValueCode 
			,'NoETL' AS LineOfBusinessCode
			,'UnknownInSrc' AS ParentGeoAreaCode 
			,'PARTIALGEO' AS GeoAreaTypeCode 
			,ara.AreaCode AS GeoAreaCode
			,ara.AreaName AS GeoAreaShortName
			,ara.AreaName AS GeoAreaFullyQualifiedName
			,CAST(ara.AreaCode AS VARCHAR(20)) AS GeoAreaAbrv 
			,NULL AS GeoAreaPlusParentName
			,NULL AS GeoAreaDefn 
			,null as CountryName
		FROM Typelist.Area ara
		JOIN Typelist.SourceSystem src ON ara.SourceSystemSK = src.SourceSystemSK
		where ara.ETLUpdateDateTime > @DateFrom

		) AS tmp
	) AS tpl
WHERE tpl.rn = 1
GO
