USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[PolicyData]    Script Date: 27.10.2022 12:26:26 ******/
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
