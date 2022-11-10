USE [DataMagnifier]
GO
/****** Object:  Schema [PreBind]    Script Date: 10.11.2022 14:35:01 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'PreBind')
EXEC sys.sp_executesql N'CREATE SCHEMA [PreBind]'
GO
