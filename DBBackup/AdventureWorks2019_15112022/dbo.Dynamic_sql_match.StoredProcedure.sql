USE [AdventureWorks2019]
GO
/****** Object:  StoredProcedure [dbo].[Dynamic_sql_match]    Script Date: 15.11.2022 17:45:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Dynamic_sql_match] (@NameToSearch VARCHAR(20), @SearchPattern VARCHAR(20), @MatchType INT)
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
