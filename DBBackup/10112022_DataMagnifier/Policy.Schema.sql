﻿USE [DataMagnifier]
GO
/****** Object:  Schema [Policy]    Script Date: 10.11.2022 14:43:35 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Policy')
EXEC sys.sp_executesql N'CREATE SCHEMA [Policy]'
GO
