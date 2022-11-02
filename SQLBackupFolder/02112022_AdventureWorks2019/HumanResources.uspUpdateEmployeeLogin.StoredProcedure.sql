﻿USE [AdventureWorks2019]
GO
/****** Object:  StoredProcedure [HumanResources].[uspUpdateEmployeeLogin]    Script Date: 02.11.2022 14:07:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [HumanResources].[uspUpdateEmployeeLogin]
    @BusinessEntityID [int], 
    @OrganizationNode [hierarchyid],
    @LoginID [nvarchar](256),
    @JobTitle [nvarchar](50),
    @HireDate [datetime],
    @CurrentFlag [dbo].[Flag]
WITH EXECUTE AS CALLER
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        UPDATE [HumanResources].[Employee] 
        SET [OrganizationNode] = @OrganizationNode 
            ,[LoginID] = @LoginID 
            ,[JobTitle] = @JobTitle 
            ,[HireDate] = @HireDate 
            ,[CurrentFlag] = @CurrentFlag 
        WHERE [BusinessEntityID] = @BusinessEntityID;
    END TRY
    BEGIN CATCH
        EXECUTE [dbo].[uspLogError];
    END CATCH;
END;
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Updates the Employee table with the values specified in the input parameters for the given BusinessEntityID.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'PROCEDURE',@level1name=N'uspUpdateEmployeeLogin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Input parameter for the stored procedure uspUpdateEmployeeLogin. Enter a valid EmployeeID from the Employee table.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'PROCEDURE',@level1name=N'uspUpdateEmployeeLogin', @level2type=N'PARAMETER',@level2name=N'@BusinessEntityID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a valid ManagerID for the employee.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'PROCEDURE',@level1name=N'uspUpdateEmployeeLogin', @level2type=N'PARAMETER',@level2name=N'@OrganizationNode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a valid login for the employee.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'PROCEDURE',@level1name=N'uspUpdateEmployeeLogin', @level2type=N'PARAMETER',@level2name=N'@LoginID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a title for the employee.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'PROCEDURE',@level1name=N'uspUpdateEmployeeLogin', @level2type=N'PARAMETER',@level2name=N'@JobTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a hire date for the employee.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'PROCEDURE',@level1name=N'uspUpdateEmployeeLogin', @level2type=N'PARAMETER',@level2name=N'@HireDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter the current flag for the employee.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'PROCEDURE',@level1name=N'uspUpdateEmployeeLogin', @level2type=N'PARAMETER',@level2name=N'@CurrentFlag'
GO
