USE [AdventureWorks2019]
GO
/****** Object:  UserDefinedDataType [dbo].[NameStyle]    Script Date: 10.11.2022 14:46:47 ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'NameStyle' AND ss.name = N'dbo')
CREATE TYPE [dbo].[NameStyle] FROM [bit] NOT NULL
GO
