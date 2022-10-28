USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgPolicy].[LoadSrcTables]    Script Date: 28.10.2022 12:27:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   procedure [StgPolicy].[LoadSrcTables] @pBatchId int
as

/* Load SRC typelists */
drop table if exists [StgPolicy].[SrcSourceSystem]
select * into [StgPolicy].[SrcSourceSystem]
from [StgPolicy].[InputSrcSourceSystem]

/* Load SRC base tables */
drop table if exists [StgPolicy].[SrcPolicy]
select* into [StgPolicy].[SrcPolicy]
from [StgPolicy].[InputSrcPolicy]
EXEC sp_refreshview 'StgPolicy.StgPolicy'

--CREATE UNIQUE NONCLUSTERED INDEX [idx_SrcPolicy] ON [StgPolicy].[SrcPolicy] ([SourceSystemCode] ASC, [SourceCode] ASC, [ProcessDateTime] ASC)

drop table if exists [StgPolicy].[SrcPolicyTrans]
select * into [StgPolicy].[SrcPolicyTrans]
from [StgPolicy].[InputSrcPolicyTrans]
EXEC sp_refreshview 'StgPolicy.StgPolicyTrans'
GO
