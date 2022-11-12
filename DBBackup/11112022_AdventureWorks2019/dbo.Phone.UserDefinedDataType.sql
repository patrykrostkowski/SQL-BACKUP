USE [AdventureWorks2019]
GO
/****** Object:  UserDefinedDataType [dbo].[Phone]    Script Date: 12.11.2022 09:13:51 ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'Phone' AND ss.name = N'dbo')
CREATE TYPE [dbo].[Phone] FROM [nvarchar](25) NULL
GO
