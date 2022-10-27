USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgDM].[SrcDIMGeoAreaCopy]    Script Date: 27.10.2022 12:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   procedure [StgDM].[SrcDIMGeoAreaCopy] @CutOffDateFrom varchar(100)
as

declare @DateFrom datetime = cast(@CutOffDateFrom as datetime)

SELECT --GeoAreaSK --identity generated
      --RowCreatedBySK --populated in ADF
      --RowLastUpdatedBySK --populated in ADF
      --RowCreatedDtm --populated in ADF
      --RowLastUpdatedDtm --populated in ADF
      src.SourceSystemCode as SourceSystemCode --required for lookup to [Administration].[InformationTechnologySystem] to populate [DIM].[DIMGeoArea].[SourceSystemSK]
      ,cast('1900-01-01' as datetime) as RowEffectiveFromDatetime
      ,cast('3000-01-01' as datetime) as RowEffectiveToDatetime
      --,0 as GovernanceValidationInd
      --,0 as StandardValueInd
      --,'NoStdVal' as StandardValueGeoAreaCode --required for lookup to [DIM].[DIMGeoArea] to populate [DIM].[DIMGeoArea].[StandardValueSK]
      --,'UnknownInSrc' as ParentGeoAreaCode --required for lookup to [DIM].[DIMGeoArea] to populate [DIM].[DIMGeoArea].[ParentGeoAreaSK]
      ,'STATE' as GeoAreaTypeCode --required for lookup to [Reference].[DIMGeoAreaType] to populate [DIM].[DIMGeoArea].[GeoAreaTypeCK]
      ,sta.StateCode as GeoAreaCode
      ,sta.StateName as GeoAreaShortName
      ,sta.StateName as GeoAreaFullyQualifiedName
      ,null as GeoAreaAbrv --should be empty, populated by Data Stewards
	  ,null as GeoAreaPlusParentName --should be empty, populated by Data Stewards
      ,null as CountryName --should be empty, populated by Data Stewards
      ,null as GeoAreaDefn --should be empty, populated by Data Stewards
	  ,sta.ETLCreateDateTime
	  ,sta.ETLUpdateDateTime

 from Typelist.State sta
 join Typelist.SourceSystem src on sta.SourceSystemSK = src.SourceSystemSK
 where sta.ETLUpdateDateTime > @DateFrom

 --UNION ALL

 --SELECT --GeoAreaSK --identity generated
 --     --RowCreatedBySK --populated in ADF
 --     --RowLastUpdatedBySK --populated in ADF
 --     --RowCreatedDtm --populated in ADF
 --     --RowLastUpdatedDtm --populated in ADF
 --     src.SourceSystemCode as SourceSystemCode --required for lookup to [Administration].[InformationTechnologySystem] to populate [DIM].[DIMGeoArea].[SourceSystemSK]
 --     ,cast('1900-01-01' as datetime) as RowEffectiveFromDatetime
 --     ,cast('3000-01-01' as datetime) as RowEffectiveToDatetime
 --     ,0 as GovernanceValidationInd
 --     ,0 as StandardValueInd
 --     ,'NoStdVal' as StandardValueGeoAreaCode --required for lookup to [DIM].[DIMGeoArea] to populate [DIM].[DIMGeoArea].[StandardValueSK]
 --     ,'UnknownInSrc' as ParentGeoAreaCode --required for lookup to [DIM].[DIMGeoArea] to populate [DIM].[DIMGeoArea].[ParentGeoAreaSK]
 --     ,'CNTRY' as GeoAreaTypeCode --required for lookup to [Reference].[DIMGeoAreaType] to populate [DIM].[DIMGeoArea].[GeoAreaTypeCK]
 --     ,cty.CountryCode as GeoAreaCode
 --     ,cty.CountryName as GeoAreaShortName
 --     ,cty.CountryName as GeoAreaFullyQualifiedName
 --     ,null as GeoAreaAbrv --should be empty, populated by Data Stewards
	--  ,null as GeoAreaPlusParentName --should be empty, populated by Data Stewards
 --     ,null as CountryName --should be empty, populated by Data Stewards
 --     ,null as GeoAreaDefn --should be empty, populated by Data Stewards
	--  ,cty.ETLCreateDateTime
	--  ,cty.ETLUpdateDateTime

 --from Typelist.Country cty
 --join Typelist.SourceSystem src on cty.SourceSystemSK = src.SourceSystemSK
 --where cty.ETLUpdateDateTime > @DateFrom

 --UNION ALL

 -- SELECT --GeoAreaSK --identity generated
 --     --RowCreatedBySK --populated in ADF
 --     --RowLastUpdatedBySK --populated in ADF
 --     --RowCreatedDtm --populated in ADF
 --     --RowLastUpdatedDtm --populated in ADF
 --     src.SourceSystemCode as SourceSystemCode --required for lookup to [Administration].[InformationTechnologySystem] to populate [DIM].[DIMGeoArea].[SourceSystemSK]
 --     ,cast('1900-01-01' as datetime) as RowEffectiveFromDatetime
 --     ,cast('3000-01-01' as datetime) as RowEffectiveToDatetime
 --     ,0 as GovernanceValidationInd
 --     ,0 as StandardValueInd
 --     ,'NoStdVal' as StandardValueGeoAreaCode --required for lookup to [DIM].[DIMGeoArea] to populate [DIM].[DIMGeoArea].[StandardValueSK]
 --     ,'UnknownInSrc' as ParentGeoAreaCode --required for lookup to [DIM].[DIMGeoArea] to populate [DIM].[DIMGeoArea].[ParentGeoAreaSK]
 --     ,'MINGEOAREA' as GeoAreaTypeCode --required for lookup to [Reference].[DIMGeoAreaType] to populate [DIM].[DIMGeoArea].[GeoAreaTypeCK]
 --     ,ara.AreaCode as GeoAreaCode
 --     ,ara.AreaName as GeoAreaShortName
 --     ,ara.AreaName as GeoAreaFullyQualifiedName
 --     ,null as GeoAreaAbrv --should be empty, populated by Data Stewards
	--  ,null as GeoAreaPlusParentName --should be empty, populated by Data Stewards
 --     ,null as CountryName --should be empty, populated by Data Stewards
 --     ,null as GeoAreaDefn --should be empty, populated by Data Stewards
	--  ,ara.ETLCreateDateTime
	--  ,ara.ETLUpdateDateTime

 --from Typelist.Area ara
 --join Typelist.SourceSystem src on ara.SourceSystemSK = src.SourceSystemSK
 --where ara.ETLUpdateDateTime > @DateFrom

GO
