USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgPolicy].[ValidatePolicyInputData]    Script Date: 28.10.2022 13:37:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE     procedure [StgPolicy].[ValidatePolicyInputData]

as

DECLARE @join_condition varchar(max), @where_condition varchar(max)


/*Tests whether a string contains valid JSON.*/
UPDATE [StgPolicy].[PolicyDataInput]
SET IsValidInd = 0
where ISJSON([JsonLine]) = 0;

/*Tests for a valid JSON value. This can be a JSON object, array, number, string or one of the three literal values (false, true, null)*/
UPDATE [StgPolicy].[PolicyDataInput]
SET IsValidInd = 0
where ISJSON([JsonLine], VALUE) = 0;

/*BUSINESS VALIDATION*/
/*Verify if all required fields are populated for Policy level*/


--1. declare cursor - select from config.PolicyDataValidationConfig
--2. feth next  -https://learn.microsoft.com/en-us/sql/t-sql/language-elements/declare-cursor-transact-sql?view=sql-server-ver16
--3. dynamic sql validation
			--exec ('update p
			--set p.IsValidInd = 0
			--from ' + @fromParam
			--'where ' + @whereparam)
--4. populate config with views 
			--select concat('insert into config.PolicyDataValidationConfig values (''', TABLE_SCHEMA, '.', TABLE_NAME, ' p '', ''', 'SourceCode is null'', 0)') as sqlcode,*
			--from INFORMATION_SCHEMA.TABLES where TABLE_TYPE = 'VIEW' and TABLE_SCHEMA = 'StgPolicy'
			--insert into config.PolicyDataValidationConfig values ('StgPolicy.SrcPolicyCoverage p ', 'SourceCode is null', 0)
--update Src views add isvalidind



DECLARE validation_cursor CURSOR FOR
SELECT JoinCondition, WhereCondition
FROM Config.PolicyDataValidationConfig
WHERE IsActive = 1;

OPEN validation_cursor

FETCH NEXT FROM validation_cursor
INTO @join_condition, @where_condition

WHILE @@FETCH_STATUS = 0
BEGIN

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


--update p
--set p.IsValidInd = 0
--from StgPolicy.SrcPolicy p
--where SourceCode is null




/*
drop table if exists config.PolicyDataValidationConfig
create table config.PolicyDataValidationConfig (
JoinCondition varchar(max),
WhereCondition varchar(max),
IsActive tinyint
)

insert into config.PolicyDataValidationConfig values ('StgPolicy.SrcPolicy p', 'SourceCode is null', 0)
*/


/*
config
ViewName ColumnName Conditions
		JoinCondition	ColumnName	WhereCondition
[StgPolicy].[SrcPolicyVT]			SourceCode				NULL
[StgPolicy].[SrcPolicyDeductible]	[CoverageSourceCode]	[DeductibleLevelCode] = 'Coverage'
*/

GO
