USE [DataMagnifier]
GO
/****** Object:  Schema [Party]    Script Date: 12.11.2022 09:01:17 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Party')
EXEC sys.sp_executesql N'CREATE SCHEMA [Party]'
GO
