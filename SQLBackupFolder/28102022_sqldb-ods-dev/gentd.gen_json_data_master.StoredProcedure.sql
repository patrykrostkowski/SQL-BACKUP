USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [gentd].[gen_json_data_master]    Script Date: 28.10.2022 15:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   procedure [gentd].[gen_json_data_master]
as


exec gentd.gen_json_data_prep

exec gentd.gen_json_data_amfam

exec gentd.gen_json_data_file

select cast(jsonline as xml) as jsonline from [gentd].[output_data_amfam]
where FileName in (/*'A31820555', 'H77842222',*/ 'A04587175')

delete from [StgPolicy].[PolicyData] where FilePath = 'AmFam'
insert into [StgPolicy].[PolicyData](JsonLine, FileName, FilePath)
select JsonLine, FileName, 'AmFam' as FilePath
from [gentd].[output_data_amfam]
--where FileName in ('A31820555', 'H77842222')

GO
