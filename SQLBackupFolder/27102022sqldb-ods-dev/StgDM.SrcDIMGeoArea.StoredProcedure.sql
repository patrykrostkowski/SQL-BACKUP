USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgDM].[SrcDIMGeoArea]    Script Date: 27.10.2022 12:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [StgDM].[SrcDIMGeoArea] @CutOffDateFrom VARCHAR(100)
AS
DECLARE @DateFrom DATETIME = cast(@CutOffDateFrom AS DATETIME)

SELECT SourceSystemCode
	,GeoAreaCode
	,RowEffectiveFromDatetime
	,RowEffectiveToDatetime
	,GovernanceValidationInd
	,StandardValueInd
	,StandardValueGeoAreaCode
	,ParentGeoAreaCode
	,GeoAreaTypeCode
	,ISNULL(GeoAreaShortName, GeoAreaCode) AS GeoAreaShortName
	,ISNULL(GeoAreaFullyQualifiedName, GeoAreaCode) AS GeoAreaFullyQualifiedName
	,isnull(GeoAreaAbrv, GeoAreaCode) AS GeoAreaAbrv
	,GeoAreaPlusParentName
	,CountryName
	,GeoAreaDefn
	,ETLCreateDateTime
	,ETLUpdateDateTime
	,tpl.rn
FROM (
	SELECT *
		,ROW_NUMBER() OVER (
			PARTITION BY GeoAreaCode
			,SourceSystemCode ORDER BY SourceSystemCode
				,GeoAreaCode DESC
			) AS rn
	FROM (
		SELECT --GeoAreaSK --identity generated
			--RowCreatedBySK --populated in ADF
			--RowLastUpdatedBySK --populated in ADF
			--RowCreatedDtm --populated in ADF
			--RowLastUpdatedDtm --populated in ADF
			src.SourceSystemCode AS SourceSystemCode --required for lookup to [Administration].[InformationTechnologySystem] to populate [DIM].[DIMGeoArea].[SourceSystemSK]
			,cast('1900-01-01' AS DATETIME) AS RowEffectiveFromDatetime
			,cast('3000-01-01' AS DATETIME) AS RowEffectiveToDatetime
			,0 AS GovernanceValidationInd
			,0 AS StandardValueInd
			,'NoStdVal' AS StandardValueGeoAreaCode --required for lookup to [DIM].[DIMGeoArea] to populate [DIM].[DIMGeoArea].[StandardValueSK]
			,'UnknownInSrc' AS ParentGeoAreaCode --required for lookup to [DIM].[DIMGeoArea] to populate [DIM].[DIMGeoArea].[ParentGeoAreaSK]
			,'STATE' AS GeoAreaTypeCode --required for lookup to [Reference].[DIMGeoAreaType] to populate [DIM].[DIMGeoArea].[GeoAreaTypeCK]
			,sta.StateCode AS GeoAreaCode
			,sta.StateName AS GeoAreaShortName
			,sta.StateName AS GeoAreaFullyQualifiedName
			,CAST(sta.StateCode AS VARCHAR(20)) AS GeoAreaAbrv --changed from 'empty'
			,NULL AS GeoAreaPlusParentName --should be empty, populated by Data Stewards
			,NULL AS CountryName --should be empty, populated by Data Stewards
			,NULL AS GeoAreaDefn --should be empty, populated by Data Stewards
			,sta.ETLCreateDateTime
			,sta.ETLUpdateDateTime
		FROM Typelist.STATE sta
		JOIN Typelist.SourceSystem src ON sta.SourceSystemSK = src.SourceSystemSK
		where sta.ETLUpdateDateTime > @DateFrom
																									
		UNION ALL
		
		SELECT --GeoAreaSK --identity generated
			--RowCreatedBySK --populated in ADF
			--RowLastUpdatedBySK --populated in ADF
			--RowCreatedDtm --populated in ADF
			--RowLastUpdatedDtm --populated in ADF
			src.SourceSystemCode AS SourceSystemCode --required for lookup to [Administration].[InformationTechnologySystem] to populate [DIM].[DIMGeoArea].[SourceSystemSK]
			,cast('1900-01-01' AS DATETIME) AS RowEffectiveFromDatetime
			,cast('3000-01-01' AS DATETIME) AS RowEffectiveToDatetime
			,0 AS GovernanceValidationInd
			,0 AS StandardValueInd
			,'NoStdVal' AS StandardValueGeoAreaCode --required for lookup to [DIM].[DIMGeoArea] to populate [DIM].[DIMGeoArea].[StandardValueSK]
			,'UnknownInSrc' AS ParentGeoAreaCode --required for lookup to [DIM].[DIMGeoArea] to populate [DIM].[DIMGeoArea].[ParentGeoAreaSK]
			,'CNTRY' AS GeoAreaTypeCode --required for lookup to [Reference].[DIMGeoAreaType] to populate [DIM].[DIMGeoArea].[GeoAreaTypeCK]
			,cty.CountryCode AS GeoAreaCode
			,cty.CountryName AS GeoAreaShortName
			,cty.CountryName AS GeoAreaFullyQualifiedName
			,CAST(cty.CountryCode AS VARCHAR(20)) AS GeoAreaAbrv --changed from 'empty'
			,NULL AS GeoAreaPlusParentName --should be empty, populated by Data Stewards
			,NULL AS CountryName --should be empty, populated by Data Stewards
			,NULL AS GeoAreaDefn --should be empty, populated by Data Stewards
			,cty.ETLCreateDateTime
			,cty.ETLUpdateDateTime
		FROM Typelist.Country cty
		JOIN Typelist.SourceSystem src ON cty.SourceSystemSK = src.SourceSystemSK
		where cty.ETLUpdateDateTime > @DateFrom
		
		UNION ALL
		
		SELECT --GeoAreaSK --identity generated
			--RowCreatedBySK --populated in ADF
			--RowLastUpdatedBySK --populated in ADF
			--RowCreatedDtm --populated in ADF
			--RowLastUpdatedDtm --populated in ADF
			src.SourceSystemCode AS SourceSystemCode --required for lookup to [Administration].[InformationTechnologySystem] to populate [DIM].[DIMGeoArea].[SourceSystemSK]
			,cast('1900-01-01' AS DATETIME) AS RowEffectiveFromDatetime
			,cast('3000-01-01' AS DATETIME) AS RowEffectiveToDatetime
			,0 AS GovernanceValidationInd
			,0 AS StandardValueInd
			,'NoStdVal' AS StandardValueGeoAreaCode --required for lookup to [DIM].[DIMGeoArea] to populate [DIM].[DIMGeoArea].[StandardValueSK]
			,'UnknownInSrc' AS ParentGeoAreaCode --required for lookup to [DIM].[DIMGeoArea] to populate [DIM].[DIMGeoArea].[ParentGeoAreaSK]
			,'PARTIALGEO' AS GeoAreaTypeCode --required for lookup to [Reference].[DIMGeoAreaType] to populate [DIM].[DIMGeoArea].[GeoAreaTypeCK]
			,ara.AreaCode AS GeoAreaCode
			,ara.AreaName AS GeoAreaShortName
			,ara.AreaName AS GeoAreaFullyQualifiedName
			,CAST(ara.AreaCode AS VARCHAR(20)) AS GeoAreaAbrv --changed from 'empty'
			,NULL AS GeoAreaPlusParentName --should be empty, populated by Data Stewards
			,NULL AS CountryName --should be empty, populated by Data Stewards
			,NULL AS GeoAreaDefn --should be empty, populated by Data Stewards
			,ara.ETLCreateDateTime
			,ara.ETLUpdateDateTime
		FROM Typelist.Area ara
		JOIN Typelist.SourceSystem src ON ara.SourceSystemSK = src.SourceSystemSK
		where ara.ETLUpdateDateTime > @DateFrom

		) AS tmp
	) AS tpl
WHERE tpl.rn = 1
GO
