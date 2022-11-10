USE [AdventureWorks2019]
GO
/****** Object:  Schema [Person]    Script Date: 10.11.2022 13:50:35 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Person')
EXEC sys.sp_executesql N'CREATE SCHEMA [Person]'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'Person', NULL,NULL, NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contains objects related to names and addresses of customers, vendors, and employees' , @level0type=N'SCHEMA',@level0name=N'Person'
GO
