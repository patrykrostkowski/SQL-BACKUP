USE [DataMagnifier]
GO
/****** Object:  Schema [Reins]    Script Date: 12.11.2022 09:01:17 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Reins')
EXEC sys.sp_executesql N'CREATE SCHEMA [Reins]'
GO
