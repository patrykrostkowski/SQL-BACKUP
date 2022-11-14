USE [AdventureWorks2019]
GO
/****** Object:  StoredProcedure [dbo].[Dynamic_sql_match]    Script Date: 14.11.2022 12:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Dynamic_sql_match]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Dynamic_sql_match] AS' 
END
GO

ALTER PROCEDURE [dbo].[Dynamic_sql_match] (@NameToSearch VARCHAR(20), @SearchPattern VARCHAR(20), @MatchType INT)
AS
BEGIN

	DECLARE @DynamicSQL VARCHAR(MAX)
	DECLARE @DynamicWHERE VARCHAR(MAX)
	DECLARE @ColumnName VARCHAR(20) 

			IF LOWER(@NameToSearch) = 'first' 		SET @ColumnName = 'FirstName'
			IF LOWER(@NameToSearch) = 'middle'		SET @ColumnName = 'MiddleName'
			IF LOWER(@NameToSearch) = 'last'		SET @ColumnName = 'LastName'	
			
			IF @MatchType = 1 	SET @DynamicWHERE = @SearchPattern								-- exact match
			IF @MatchType = 2	SET @DynamicWHERE = '''' + @SearchPattern + '%' + ''''			-- begins with
			IF @MatchType = 3	SET @DynamicWHERE = '''' + '%' + @SearchPattern					-- ends with
			IF @MatchType = 4	SET @DynamicWHERE = '''' + '%' + @SearchPattern + '%' + ''''	-- contains

		SET @DynamicSQL = 'SELECT *
							FROM Person.Person pp
							WHERE 
								pp.' + @ColumnName
		SET @DynamicSQL = @DynamicSQL + '	LIKE ' + @DynamicWHERE

	EXEC (@DynamicSQL)
END
GO
