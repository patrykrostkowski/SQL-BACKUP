﻿USE [AdventureWorks2019]
GO
/****** Object:  Schema [Person]    Script Date: 20.11.2022 19:02:06 ******/
CREATE SCHEMA [Person]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contains objects related to names and addresses of customers, vendors, and employees' , @level0type=N'SCHEMA',@level0name=N'Person'
GO
