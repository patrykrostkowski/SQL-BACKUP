USE [AdventureWorks2019]
GO
/****** Object:  UserDefinedDataType [dbo].[AccountNumber]    Script Date: 10.11.2022 14:09:44 ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'AccountNumber' AND ss.name = N'dbo')
CREATE TYPE [dbo].[AccountNumber] FROM [nvarchar](15) NULL
GO
