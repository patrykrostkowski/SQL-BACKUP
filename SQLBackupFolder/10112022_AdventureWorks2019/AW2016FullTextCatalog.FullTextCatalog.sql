USE [AdventureWorks2019]
GO
/****** Object:  FullTextCatalog [AW2016FullTextCatalog]    Script Date: 10.11.2022 13:45:24 ******/
IF NOT EXISTS (SELECT * FROM sysfulltextcatalogs ftc WHERE ftc.name = N'AW2016FullTextCatalog')
CREATE FULLTEXT CATALOG [AW2016FullTextCatalog] AS DEFAULT
GO
