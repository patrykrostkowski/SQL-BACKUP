USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [dbo].[gen_json_schema]    Script Date: 27.10.2022 12:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   procedure [dbo].[gen_json_schema] @domain varchar(10), @debug varchar(1) = '0', @att_name varchar(100) = 'Root', @parent varchar(100) = null, @master varchar(100) = null, @att_type varchar(100) = null, @path varchar(1000) = null
as
--exec [dbo].[gen_json_schema] 'Policy', '0' --debug set to ON
--exec [dbo].[gen_json_schema] 'Claim', '1' --debug set to ON
--exec [dbo].[gen_json_schema] 'PreBind', '1' --debug set to ON
--exec [dbo].[gen_json_schema] 'EarnedPrem', '1' --debug set to ON
declare @c_rowno int,
	@c_level varchar(100), 
	@c_parent varchar(100),
	@c_master varchar(100),
	@c_att_name varchar(100), 
	@c_att_type varchar(100), 
	@c_keyfield varchar(100), 
	@c_description varchar(1000),
	@c_db_table varchar(100),
	@c_db_column varchar(100),
	@c_dbdatatype varchar(100),
	@c_db_definition varchar(1000),
	@first_row int = 1,
	@new_path varchar(1000),
	@att_desc varchar(1000),
	@obj_desc varchar(1000)

declare c_fields cursor FAST_FORWARD LOCAL for
	select isnull(rowno, 0) as rowno, 
		isnull(level, '') as level, 
		isnull(parent, '') as parent, 
		isnull(master, '') as master, 
		isnull(att_name, '') as att_name, 
		isnull(att_type, '') as att_type, 
		isnull(keyfield, '') as keyfield, 
		isnull(description, '') as description,
		isnull(db_table, '') as db_table,
		isnull(db_column, '') as db_column,
		isnull(dbdatatype, '') as dbdatatype,
		isnull(db_description, '') as db_definition
	from dbo.policy_schema_input
	where isnull(parent, '') = isnull(@att_name, '')
		and (isnull(master, '') = isnull(@master, '') or isnull(@master, '') = '')
		and isnull(ignore, '') <> 'yes'
		and @domain = 'Policy'

	union all

	select isnull(rowno, 0) as rowno, 
		isnull(level, '') as level, 
		isnull(parent, '') as parent, 
		isnull(master, '') as master, 
		isnull(att_name, '') as att_name, 
		isnull(att_type, '') as att_type, 
		isnull(keyfield, '') as keyfield, 
		isnull(description, '') as description,
		isnull(db_table, '') as db_table,
		isnull(db_column, '') as db_column,
		isnull(dbdatatype, '') as dbdatatype,
		isnull(db_definition, '') as db_definition
	from dbo.claim_schema_input
	where isnull(parent, '') = isnull(@att_name, '')
		and (isnull(master, '') = isnull(@master, '') or isnull(@master, '') = '')
		and isnull(ignore, '') <> 'yes'
		and @domain = 'Claim'

	union all

	select isnull(rowno, 0) as rowno, 
		isnull(level, '') as level, 
		isnull(parent, '') as parent, 
		isnull(master, '') as master, 
		isnull(att_name, '') as att_name,
		isnull(att_type, '') as att_type, 
		isnull(keyfield, '') as keyfield, 
		isnull(description, '') as description,
		isnull(db_table, '') as db_table,
		isnull(db_column, '') as db_column,
		isnull(dbdatatype, '') as dbdatatype,
		isnull(db_definition, '') as db_definition
	from dbo.prebind_schema_input
	where isnull(parent, '') = isnull(@att_name, '')
		and (isnull(master, '') = isnull(@master, '') or isnull(@master, '') = '')
		and isnull(ignore, '') <> 'yes'
		and @domain = 'PreBind'

	union all

	select isnull(rowno, 0) as rowno, 
		isnull(level, '') as level, 
		isnull(parent, '') as parent, 
		isnull(master, '') as master, 
		isnull(att_name, '') as att_name,
		isnull(att_type, '') as att_type, 
		isnull(keyfield, '') as keyfield, 
		isnull(description, '') as description,
		isnull(db_table, '') as db_table,
		isnull(db_column, '') as db_column,
		isnull(dbdatatype, '') as dbdatatype,
		isnull(db_definition, '') as db_definition
	from dbo.earnedprem_schema_input
	where isnull(parent, '') = isnull(@att_name, '')
		and (isnull(master, '') = isnull(@master, '') or isnull(@master, '') = '')
		and isnull(ignore, '') <> 'yes'
		and @domain = 'EarnedPrem'
	order by rowno

if @att_name = 'Root'
begin
	print '{'
	print '"$schema": "http://json-schema.org/draft-07/schema#",'
	print '"title": "Root",'
	print '"description": "Root",'
	print '"type": "object",'
	print '"properties": {'
	set @path = '#'
end

open c_fields  
fetch next from c_fields into @c_rowno, @c_level, @c_parent, @c_master, @c_att_name, @c_att_type, @c_keyfield, @c_description, @c_db_table, @c_db_column, @c_dbdatatype, @c_db_definition

while @@FETCH_STATUS = 0  
begin
	if @first_row = 0
		print ','

	select @att_desc = '', 
		@obj_desc = ''

	--if @c_att_type in ('array', 'object')
	--	--select top 1 @obj_desc = [Entity/Table Definition] 
	--	select top 1 @obj_desc = [Table  Definition] 
	--	from dbo.DMTables 
	--	where [Table Name] = @c_att_name
	--else
	--	--select top 1 @att_desc = [Attribute/Column Definition] 
	--	select top 1 @att_desc = [Column Definition] 
	--	from [dbo].[DMColumns] 
	--	where [Table Name] = @c_parent 
	--	and [Column Name] = @c_att_name

	select @att_desc = isnull(replace(replace(@att_desc, char(10), ''), char(13), ''), ''), 
		@obj_desc = isnull(replace(replace(@obj_desc, char(10), ''), char(13), ''), '')

	if @c_att_type = 'array'
	begin
		set @new_path = @path + '/' + @c_att_name
		print '"' + @c_att_name + '": {'
		print '"$id": "' + @new_path + '",'
		print '"title": "' + @c_att_name + '",'
		--print '"description": "' + @c_description + '",'
		--print '"description": "' + @obj_desc + '",'
		print '"description": "' + case when isnull(@c_description, '') = '' then @c_db_definition else @c_description end + '",'
		print '"type": "' + @c_att_type + '",'
		print '"items": {'
		set @new_path = @path + '/' + @c_att_name + '/items'
		print '"$id": "' + @new_path + '",'
		print '"title": "Items",'
		print '"type": "object",'
		print '"properties": {'
		exec dbo.[gen_json_schema] @domain, @debug, @c_att_name, @c_parent, @c_master, @c_att_type, @new_path
		print '}}}'
	end
	else if @c_att_type = 'object'
	begin
		set @new_path = @path + '/' + @c_att_name
		print '"' + @c_att_name + '": {'
		print '"$id": "' + @new_path + '",'
		print '"title": "' + @c_att_name + '",'
		--print '"description": "' + @c_description + '",'
		--print '"description": "' + @obj_desc + '",'
		print '"description": "' + case when isnull(@c_description, '') = '' then @c_db_definition else @c_description end + '",'
		print '"type": "' + @c_att_type + '",'
		print '"properties": {'
		exec dbo.[gen_json_schema] @domain, @debug, @c_att_name, @c_parent, @c_master, @c_att_type, @new_path
		print '}}'
	end
	else
	begin
		set @new_path = @path + '/' + @c_att_name
		print '"' + @c_att_name + '": {'
		print '"$id": "' + @new_path + '",'
		print '"title": "' + @c_att_name + '",'
		--print '"description": "' + @c_description + '",'
		--print '"description": "' + @att_desc + '",'
		print '"description": "' + case when isnull(@c_description, '') = '' then @c_db_definition else @c_description end + '",'
		print '"type": "' + @c_att_type + '",'
		--DEBUG AREA START
		if @debug = '1'
		begin
			--select c.TABLE_SCHEMA, c.TABLE_NAME, c.COLUMN_NAME from INFORMATION_SCHEMA.TABLES t
			--join INFORMATION_SCHEMA.COLUMNS c on t.TABLE_NAME = c.TABLE_NAME and t.TABLE_SCHEMA = c.TABLE_SCHEMA
			--where t.TABLE_TYPE = 'BASE TABLE'
			--	and c.TABLE_NAME = @c_db_table
			--	and c.COLUMN_NAME = @c_db_column
			if @c_att_type = 'string' and @c_dbdatatype in ('date', 'datetime')
				print '"pattern": "[2][0][2][0-1]-[0][1-9]-[0-2][1-8]T[0-1][1-4]:[0-5][0-9]:[0-5][0-9][.]000",'
			else if @c_att_type = 'string'
				print '"pattern": "[a-z]{3}",'
			else if @c_att_type = 'integer' and @c_dbdatatype in ('tinyint') and @c_att_name like '%Ind'
				print '"pattern": "[01]",'
			else if @c_att_type = 'integer'
				print '"pattern": "[1-9]{2,5}",'
			else if @c_att_type = 'number' and @c_att_name in ('LatitudeId','LongitudeId')
				print '"pattern": "[1-9][0-9][0-9][.][0-9]{6}",'
			else if @c_att_type = 'number'
				print '"pattern": "[1-9][0-9]{1,5}[.][0-9][0-9]",'
		end
		else
		begin
			if @c_att_type = 'string'
				print '"pattern": "^.*$",'
		end
		--DEBUG AREA END
		if @c_keyfield = 'yes'
			print '"$keyfield": true,'
		print '"comment": "' + '' + '"'
		print '}'
	end

	set @first_row = 0
	fetch next from c_fields into @c_rowno, @c_level, @c_parent, @c_master, @c_att_name, @c_att_type, @c_keyfield, @c_description, @c_db_table, @c_db_column, @c_dbdatatype, @c_db_definition
end
close c_fields 
deallocate c_fields

if @att_name = 'Root'
begin
	print '}}'
end
GO
