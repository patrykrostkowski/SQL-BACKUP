USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgADM].[SrcDimCoverageAcquisitionType]    Script Date: 28.10.2022 12:27:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE      PROCEDURE [StgADM].[SrcDimCoverageAcquisitionType] @CutOffDateFrom VARCHAR(100)
AS
DECLARE @DateFrom DATETIME = cast(@CutOffDateFrom AS DATETIME)


SELECT *
FROM (
SELECT 
	  ROW_NUMBER() OVER (PARTITION BY src.SourceSystemCode, dra.DirectAssumedCode ORDER BY dra.DirectAssumedCode ASC ) AS rn
	  ,src.SourceSystemCode
      --,RowEffectiveFromDate
      --,RowEffectiveToDate
      --,GovernanceValidationInd
      --,StandardValueCk
      --,StandardValueInd
      ,dra.DirectAssumedCode AS CoverageAcquisitionTypeCode
      ,dra.DirectAssumedName AS CoverageAcquisitionTypeName
      ,dra.DirectAssumedCode AS CoverageAcquisitionTypeAbrv

FROM Typelist.DirectAssumed dra
JOIN Typelist.SourceSystem src ON dra.SourceSystemSK = src.SourceSystemSK
WHERE dra.ETLUpdateDateTime > @DateFrom

)tmp  where tmp.rn = 1



GO
