USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgPolicy].[GetValidatedFilesList]    Script Date: 28.10.2022 12:27:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE   procedure [StgPolicy].[GetValidatedFilesList] as 
select filename from StgPolicy.PolicyDataInput where IsValidInd = 1

GO
