﻿USE [AdventureWorks2019]
GO
/****** Object:  Schema [Purchasing]    Script Date: 27.10.2022 12:18:51 ******/
CREATE SCHEMA [Purchasing]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contains objects related to vendors and purchase orders.' , @level0type=N'SCHEMA',@level0name=N'Purchasing'
GO
