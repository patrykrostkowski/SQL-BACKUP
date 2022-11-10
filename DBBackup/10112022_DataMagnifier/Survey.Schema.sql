USE [DataMagnifier]
GO
/****** Object:  Schema [Survey]    Script Date: 10.11.2022 14:20:43 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Survey')
EXEC sys.sp_executesql N'CREATE SCHEMA [Survey]'
GO
