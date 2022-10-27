USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgPolicy].[ValidateInputDataTMP]    Script Date: 27.10.2022 12:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   procedure [StgPolicy].[ValidateInputDataTMP]

as

/*Tests whether a string contains valid JSON.*/
UPDATE [StgPolicy].[PolicyDataInput]
SET IsValidInd = 0
where ISJSON([JsonLine]) = 0

/*Tests for a valid JSON value. This can be a JSON object, array, number, string or one of the three literal values (false, true, null)*/
UPDATE [StgPolicy].[PolicyDataInput]
SET IsValidInd = 0
where ISJSON([JsonLine], VALUE) = 0

/*BUSINESS VALIDATION*/
/*Verify if all required fields are populated for Policy level*/
update p
set IsValidInd = 0
from [StgPolicy].[SrcPolicyVT] p
where SourceCode is null
or EffectiveDate is null
or ExpirationDate is null

/*
config
ViewName ColumnName Conditions
		JoinCondition	ColumnName	WhereCondition
[StgPolicy].[SrcPolicyVT]			SourceCode				NULL
[StgPolicy].[SrcPolicyDeductible]	[CoverageSourceCode]	[DeductibleLevelCode] = 'Coverage'
*/

GO
