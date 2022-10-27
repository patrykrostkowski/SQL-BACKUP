USE [sqldb-ods-dev]
GO
/****** Object:  User [tempreportuser]    Script Date: 27.10.2022 12:26:26 ******/
CREATE USER [tempreportuser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [tempreportuser]
GO
ALTER ROLE [db_datareader] ADD MEMBER [tempreportuser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [tempreportuser]
GO
