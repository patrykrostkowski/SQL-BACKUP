USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgADM].[SrcDimCatastrophe]    Script Date: 27.10.2022 12:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [StgADM].[SrcDimCatastrophe] @CutOffDateFrom VARCHAR(100)
AS
DECLARE @DateFrom DATETIME = cast(@CutOffDateFrom AS DATETIME)

SELECT src.SourceSystemCode AS SourceSystemCode
,ctp.CatastropheValidFromDate AS RowEffectiveFromDate
,ctp.CatastropheValidToDate AS RowEffectiveToDate
,ctp.SourceCode AS SourceCode
,0 AS GovernanceValidationInd
,'NoStdVal' AS StandardValueCkCode
,0 AS StandardValueInd
,left(ctp.CatastropheValidFromDate,4) AS CatastropheCalendarYear
,ctp.CatastropheNum AS CatastropheId
,ctp.CatastropheName AS CatastropheName
,0 AS ExtraordinaryLossEventInd


FROM Claim.Catastrophe ctp
JOIN Typelist.SourceSystem src ON ctp.SourceSystemSK = src.SourceSystemSK
where ctp.ETLUpdateDateTime > @DateFrom
GO
