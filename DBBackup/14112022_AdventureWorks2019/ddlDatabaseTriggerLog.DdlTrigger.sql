﻿USE [AdventureWorks2019]
GO
/****** Object:  DdlTrigger [ddlDatabaseTriggerLog]    Script Date: 14.11.2022 12:04:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE parent_class_desc = 'DATABASE' AND name = N'ddlDatabaseTriggerLog')
EXECUTE dbo.sp_executesql N'

CREATE TRIGGER [ddlDatabaseTriggerLog] ON DATABASE 
FOR DDL_DATABASE_LEVEL_EVENTS AS 
BEGIN
    SET NOCOUNT ON;

    DECLARE @data XML;
    DECLARE @schema sysname;
    DECLARE @object sysname;
    DECLARE @eventType sysname;

    SET @data = EVENTDATA();
    SET @eventType = @data.value(''(/EVENT_INSTANCE/EventType)[1]'', ''sysname'');
    SET @schema = @data.value(''(/EVENT_INSTANCE/SchemaName)[1]'', ''sysname'');
    SET @object = @data.value(''(/EVENT_INSTANCE/ObjectName)[1]'', ''sysname'') 

    IF @object IS NOT NULL
        PRINT ''  '' + @eventType + '' - '' + @schema + ''.'' + @object;
    ELSE
        PRINT ''  '' + @eventType + '' - '' + @schema;

    IF @eventType IS NULL
        PRINT CONVERT(nvarchar(max), @data);

    INSERT [dbo].[DatabaseLog] 
        (
        [PostTime], 
        [DatabaseUser], 
        [Event], 
        [Schema], 
        [Object], 
        [TSQL], 
        [XmlEvent]
        ) 
    VALUES 
        (
        GETDATE(), 
        CONVERT(sysname, CURRENT_USER), 
        @eventType, 
        CONVERT(sysname, @schema), 
        CONVERT(sysname, @object), 
        @data.value(''(/EVENT_INSTANCE/TSQLCommand)[1]'', ''nvarchar(max)''), 
        @data
        );
END;
'
GO
DISABLE TRIGGER [ddlDatabaseTriggerLog] ON DATABASE
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'TRIGGER',N'ddlDatabaseTriggerLog', NULL,NULL, NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Database trigger to audit all of the DDL changes made to the AdventureWorks 2016 database.' , @level0type=N'TRIGGER',@level0name=N'ddlDatabaseTriggerLog'
GO
