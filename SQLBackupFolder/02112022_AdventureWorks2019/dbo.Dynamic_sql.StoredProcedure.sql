USE [AdventureWorks2019]
GO
/****** Object:  StoredProcedure [dbo].[Dynamic_sql]    Script Date: 02.11.2022 13:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Dynamic_sql] (@NameToSearch VARCHAR(10),@SearchPattern VARCHAR(30))
AS
BEGIN
	DECLARE @DynamicSQL VARCHAR(MAX)
	DECLARE @ColumnName VARCHAR(20)

		IF LOWER(@NameToSearch) = 'first'
			SET @ColumnName = 'FirstName'
		IF LOWER(@NameToSearch) = 'middle'
			SET @ColumnName = 'MiddleName'
		IF LOWER(@NameToSearch) = 'last'
			SET @ColumnName = 'LastName'	
			
	SET @DynamicSQL = 'SELECT *
						FROM Person.Person pp
						WHERE 
							pp.' + @ColumnName
	SET @DynamicSQL = @DynamicSQL + '	LIKE ''%' + @SearchPattern + '%'''

EXEC (@DynamicSQL)
	
END
GO
