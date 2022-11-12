USE [AdventureWorks2019]
GO
/****** Object:  UserDefinedDataType [dbo].[Name]    Script Date: 12.11.2022 09:00:52 ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'Name' AND ss.name = N'dbo')
CREATE TYPE [dbo].[Name] FROM [nvarchar](50) NULL
GO
