USE [DataMagnifier]
GO
/****** Object:  Schema [TypeList]    Script Date: 10.11.2022 14:43:35 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'TypeList')
EXEC sys.sp_executesql N'CREATE SCHEMA [TypeList]'
GO
