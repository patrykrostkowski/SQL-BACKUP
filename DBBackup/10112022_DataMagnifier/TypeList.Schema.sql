USE [DataMagnifier]
GO
/****** Object:  Schema [TypeList]    Script Date: 10.11.2022 14:36:02 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'TypeList')
EXEC sys.sp_executesql N'CREATE SCHEMA [TypeList]'
GO
