USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[ClaimData]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create    view [StgClaim].[ClaimData]
as
select * from [StgClaim].ClaimDataInput
where IsValidInd = 1
GO
