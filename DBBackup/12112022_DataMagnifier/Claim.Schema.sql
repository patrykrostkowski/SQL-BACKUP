USE [DataMagnifier]
GO
/****** Object:  Schema [Claim]    Script Date: 12.11.2022 09:01:17 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Claim')
EXEC sys.sp_executesql N'CREATE SCHEMA [Claim]'
GO
