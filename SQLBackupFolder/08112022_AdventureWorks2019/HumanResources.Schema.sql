﻿USE [AdventureWorks2019]
GO
/****** Object:  Schema [HumanResources]    Script Date: 08.11.2022 08:47:40 ******/
CREATE SCHEMA [HumanResources]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contains objects related to employees and departments.' , @level0type=N'SCHEMA',@level0name=N'HumanResources'
GO
