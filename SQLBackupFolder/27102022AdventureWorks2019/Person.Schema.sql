USE [AdventureWorks2019]
GO
/****** Object:  Schema [Person]    Script Date: 27.10.2022 12:18:51 ******/
CREATE SCHEMA [Person]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contains objects related to names and addresses of customers, vendors, and employees' , @level0type=N'SCHEMA',@level0name=N'Person'
GO
