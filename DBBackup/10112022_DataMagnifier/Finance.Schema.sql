USE [DataMagnifier]
GO
/****** Object:  Schema [Finance]    Script Date: 10.11.2022 14:47:08 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Finance')
EXEC sys.sp_executesql N'CREATE SCHEMA [Finance]'
GO
