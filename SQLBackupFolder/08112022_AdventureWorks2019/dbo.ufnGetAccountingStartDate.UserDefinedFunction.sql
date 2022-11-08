USE [AdventureWorks2019]
GO
/****** Object:  UserDefinedFunction [dbo].[ufnGetAccountingStartDate]    Script Date: 08.11.2022 08:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[ufnGetAccountingStartDate]()
RETURNS [datetime] 
AS 
BEGIN
    RETURN CONVERT(datetime, '20030701', 112);
END;
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Scalar function used in the uSalesOrderHeader trigger to set the ending account date.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'ufnGetAccountingStartDate'
GO
