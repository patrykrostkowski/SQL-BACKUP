USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [gentd].[gen_claim_json_data_master]    Script Date: 28.10.2022 11:11:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  procedure [gentd].[gen_claim_json_data_master]
as


exec gentd.gen_json_data_prep

exec gentd.gen_json_data_amfam

exec gentd.gen_claim_json_data_prep

exec gentd.gen_claim_json_data_icw

exec gentd.gen_claim_json_data_file

--select top 1 cast(jsonline as xml) as jsonline from [gentd].[output_claim_data_icw]
--where jsonline like ('%CDI0000284334%')

delete from [StgClaim].[ClaimData] where FilePath = 'ICW'
insert into [StgClaim].[ClaimData](JsonLine, FileName, FilePath)
select JsonLine, FileName, 'ICW' as FilePath
from [gentd].[output_claim_data_icw]
--where FileName in ('A31820555', 'H77842222')

--select top 1 cast(jsonline as xml) as jsonline from [StgClaim].[ClaimData]
GO
