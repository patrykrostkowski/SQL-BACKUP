USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgDM].[SrcDIMProgram]    Script Date: 28.10.2022 13:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create    procedure [StgDM].[SrcDIMProgram] @CutOffDateFrom varchar(100)
as

declare @DateFrom datetime = cast(@CutOffDateFrom as datetime)

SELECT prg.SourceCode
	,prg.ProcessDateTime
	,src.SourceSystemCode as SourceSystemCode
	,prg.ProgramNum as ProgramCode
	,prg.ProgramName as ProgramDesc
	,NULL as SegmentCode
	,NULL as SegmentDesc
	,NULL as SubSegmentCode
	,NULL as SubSegmentDesc
	,prg.ETLCreateDateTime
	,prg.ETLUpdateDateTime
  FROM Policy.Program prg
  join Typelist.SourceSystem src on prg.SourceSystemSK = src.SourceSystemSK
  where prg.ETLUpdateDateTime > @DateFrom
 
GO
