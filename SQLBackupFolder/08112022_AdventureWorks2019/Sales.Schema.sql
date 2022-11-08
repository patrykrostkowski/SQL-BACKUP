USE [AdventureWorks2019]
GO
/****** Object:  Schema [Sales]    Script Date: 08.11.2022 08:10:58 ******/
CREATE SCHEMA [Sales]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contains objects related to customers, sales orders, and sales territories.' , @level0type=N'SCHEMA',@level0name=N'Sales'
GO
