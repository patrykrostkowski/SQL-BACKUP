USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcProgram]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [StgPolicy].[SrcProgram]
AS
SELECT hdr.SourceSystemCode
	,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,pgm.ProgramSourceCode AS SourceCode
	,pgm.EffectiveDate 
	,pgm.ExpirationDate 
	,pgm.ProgramDesc 
	,pgm.ProgramName 
	,pgm.ProgramNum 

FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Policy NVARCHAR(max) AS JSON
		) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (
		Program NVARCHAR(max) AS JSON
		) pol
CROSS APPLY OPENJSON(pol.Program) WITH (
		ProgramSourceCode NVARCHAR(max)
		,EffectiveDate NVARCHAR(max)
		,ExpirationDate NVARCHAR(max)
		,ProgramDesc NVARCHAR(max)
		,ProgramName NVARCHAR(max)
		,ProgramNum NVARCHAR(max)
		) pgm
GO
