USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgClaim].[ValidateClaimInputData]    Script Date: 28.10.2022 15:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     procedure [StgClaim].[ValidateClaimInputData]

as

DECLARE @join_condition varchar(max), @where_condition varchar(max)


/*Tests whether a string contains valid JSON.*/
UPDATE StgClaim.ClaimDataInput
SET IsValidInd = 0
where ISJSON(JsonLine) = 0;

/*Tests for a valid JSON value. This can be a JSON object, array, number, string or one of the three literal values (false, true, null)*/
UPDATE StgClaim.ClaimDataInput
SET IsValidInd = 0
where ISJSON(JsonLine, VALUE) = 0;

/*BUSINESS VALIDATION*/


DECLARE validation_cursor CURSOR FOR
SELECT JoinCondition, WhereCondition
FROM Config.ClaimDataValidationConfig
WHERE IsActive = 1;

OPEN validation_cursor

FETCH NEXT FROM validation_cursor
INTO @join_condition, @where_condition

WHILE @@FETCH_STATUS = 0
BEGIN

--prints for testing purpose
print(@join_condition)
print('UPDATE p
SET p.IsValidInd = 0
FROM ' + @join_condition +
' WHERE ' + @where_condition)


exec(
'UPDATE p
SET p.IsValidInd = 0
FROM ' + @join_condition +
' WHERE ' + @where_condition
)

FETCH NEXT FROM validation_cursor   
INTO @join_condition, @where_condition 


END
CLOSE validation_cursor;
DEALLOCATE validation_cursor;
GO
