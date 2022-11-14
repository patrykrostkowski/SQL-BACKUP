USE [AdventureWorks2019]
GO
/****** Object:  UserDefinedDataType [dbo].[Flag]    Script Date: 14.11.2022 12:02:48 ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'Flag' AND ss.name = N'dbo')
CREATE TYPE [dbo].[Flag] FROM [bit] NOT NULL
GO
