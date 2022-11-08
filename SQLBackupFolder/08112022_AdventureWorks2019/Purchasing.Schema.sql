USE [AdventureWorks2019]
GO
/****** Object:  Schema [Purchasing]    Script Date: 08.11.2022 08:47:40 ******/
CREATE SCHEMA [Purchasing]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contains objects related to vendors and purchase orders.' , @level0type=N'SCHEMA',@level0name=N'Purchasing'
GO
