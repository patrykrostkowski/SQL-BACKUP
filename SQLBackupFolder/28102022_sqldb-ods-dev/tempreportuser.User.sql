USE [sqldb-ods-dev]
GO
/****** Object:  User [tempreportuser]    Script Date: 28.10.2022 13:36:11 ******/
CREATE USER [tempreportuser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [tempreportuser]
GO
ALTER ROLE [db_datareader] ADD MEMBER [tempreportuser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [tempreportuser]
GO
