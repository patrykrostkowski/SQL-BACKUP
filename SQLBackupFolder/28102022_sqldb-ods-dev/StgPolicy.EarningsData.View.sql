USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[EarningsData]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create    view [StgPolicy].[EarningsData]
as
select * from [StgPolicy].[EarningsDataInput]
where IsValidInd = 1
GO
