USE [AdventureWorks2019]
GO
/****** Object:  UserDefinedDataType [dbo].[OrderNumber]    Script Date: 10.11.2022 13:46:18 ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'OrderNumber' AND ss.name = N'dbo')
CREATE TYPE [dbo].[OrderNumber] FROM [nvarchar](25) NULL
GO
