USE [DataMagnifier]
GO
/****** Object:  Schema [Party]    Script Date: 10.11.2022 14:20:43 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Party')
EXEC sys.sp_executesql N'CREATE SCHEMA [Party]'
GO
