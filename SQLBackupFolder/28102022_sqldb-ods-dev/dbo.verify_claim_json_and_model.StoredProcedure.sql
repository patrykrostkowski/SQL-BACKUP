USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [dbo].[verify_claim_json_and_model]    Script Date: 28.10.2022 15:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[verify_claim_json_and_model] 
as

--CLAIM
;with model_columns as (
select c.TABLE_SCHEMA, c.TABLE_NAME, c.COLUMN_NAME from INFORMATION_SCHEMA.TABLES t
join INFORMATION_SCHEMA.COLUMNS c on t.TABLE_NAME = c.TABLE_NAME and t.TABLE_SCHEMA = c.TABLE_SCHEMA
where t.TABLE_TYPE = 'BASE TABLE'
and (t.TABLE_SCHEMA in ('Claim', 'Party') 
	or (t.TABLE_SCHEMA = 'Finance' and c.TABLE_NAME in ('ClaimTransaction', 'ClaimPayment'))
)
and c.TABLE_NAME not in ('Broker', 'ContactPoint', 'Employee', 'Obligee', 'Obligor', 'ReinsuranceCompany', 'Bond', 'BondCoverage', 'BondTrans', 
	'PartyRoleinCommissionRelationship', 'PartyRoleInQuoteRelationship', 'PartyRoleInTreatyRelationship',
	'IMTransportationClass', 'HouseholdContent', 'PropertyInTransit', 'FreightContent',
	'Account', 'Agency', 'Agent'/*, 'FrontingCompany'*/, 'Insured', 'PartyRoleInPolicyRelationship', 'ClaimBond'/*, 'WritingCompany'*/)
and c.COLUMN_NAME not in ('ETLCreateProcessNum', 'ETLUpdateProcessNum', 'ProcessDateTime', 'ETLCreateDateTime', 'ETLUpdateDateTime')
--questionable
and c.TABLE_NAME not in ('ClaimPolicyAssociation', 'ClaimRelationship', 'AccidentViolation', 'PolicyLossHistory', 'RatingPlanStatCode', 'PropertyVehicleDetail', 'PolicySubCoverage', 'PolicyAudit', 'Person', 'PartyRoleRelationship', 'PartyAssociation', 'Organization')
)
,json_columns as (
select 1 as rn, * from claim_schema_input p
where 1=1
and isnull(p.parent, '') <> 'Root'
and isnull(p.att_type, '') not in ('object', 'array')
and isnull(p.db_column, '') not in ('ETLCreateDateTime', 'ETLUpdateDateTime', 'ProcessDateTime')
)
select * from (
select 
case when j.rn is not null then 1 else 0 end as JSON_EXIST, 
case when m.COLUMN_NAME is not null then 1 else 0 end as MODEL_EXIST, 
* 
from json_columns j
full join model_columns m on m.TABLE_NAME = j.db_table and m.COLUMN_NAME = j.db_column
where 1=1
--exclude xxxSourceCode = xxSK
--and not (j.att_name = j.parent+'SourceCode'
) a where (JSON_EXIST = 0 or MODEL_EXIST = 0)
--and att_name like 'north%'
order by JSON_EXIST desc, /*rowno asc,*/ parent, att_name, TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME
GO
