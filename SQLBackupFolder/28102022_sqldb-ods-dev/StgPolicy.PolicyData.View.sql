USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[PolicyData]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create    view [StgPolicy].[PolicyData]
as
select * from [StgPolicy].[PolicyDataInput]
where IsValidInd = 1
--and FileName <> 'filename' --testing only
GO
