USE [AdventureWorks2019]
GO
/****** Object:  Schema [Purchasing]    Script Date: 12.11.2022 09:23:18 ******/
CREATE SCHEMA [Purchasing]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contains objects related to vendors and purchase orders.' , @level0type=N'SCHEMA',@level0name=N'Purchasing'
GO
