USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgPolicy].[GetValidatedFilesList]    Script Date: 27.10.2022 12:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE   procedure [StgPolicy].[GetValidatedFilesList] as 
select filename from StgPolicy.PolicyDataInput where IsValidInd = 1

GO
