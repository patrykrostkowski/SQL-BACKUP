﻿USE [DataMagnifier]
GO
/****** Object:  Schema [Reins]    Script Date: 10.11.2022 14:35:01 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Reins')
EXEC sys.sp_executesql N'CREATE SCHEMA [Reins]'
GO
