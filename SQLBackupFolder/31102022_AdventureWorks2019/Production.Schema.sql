USE [AdventureWorks2019]
GO
/****** Object:  Schema [Production]    Script Date: 31.10.2022 12:03:03 ******/
CREATE SCHEMA [Production]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contains objects related to products, inventory, and manufacturing.' , @level0type=N'SCHEMA',@level0name=N'Production'
GO
