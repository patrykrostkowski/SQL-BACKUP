USE [DataMagnifier]
GO
/****** Object:  Schema [Config]    Script Date: 10.11.2022 14:36:02 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Config')
EXEC sys.sp_executesql N'CREATE SCHEMA [Config]'
GO
