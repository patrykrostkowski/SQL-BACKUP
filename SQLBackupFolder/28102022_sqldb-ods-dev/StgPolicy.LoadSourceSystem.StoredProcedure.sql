USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgPolicy].[LoadSourceSystem]    Script Date: 28.10.2022 11:11:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create     procedure [StgPolicy].[LoadSourceSystem] @pBatchId int 
as

MERGE Typelist.SourceSystem AS tgt
USING StgPolicy.InputSrcSourceSystem AS src
    ON tgt.SourceSystemCode = src.SourceSystemCode
WHEN NOT MATCHED
    THEN
        INSERT (
			ETLCreateDateTime
           ,ETLUpdateDateTime
           ,SourceSystemCode
           ,SourceSystemName
            )
        VALUES (
            getdate()
            ,getdate()
           ,src.SourceSystemCode
           ,src.SourceSystemName
            );
GO
