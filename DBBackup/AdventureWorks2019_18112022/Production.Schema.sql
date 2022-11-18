USE [AdventureWorks2019]
GO
/****** Object:  Schema [Production]    Script Date: 18.11.2022 16:36:59 ******/
CREATE SCHEMA [Production]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contains objects related to products, inventory, and manufacturing.' , @level0type=N'SCHEMA',@level0name=N'Production'
GO
