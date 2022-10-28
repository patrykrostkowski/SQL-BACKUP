USE [sqldb-ods-dev]
GO
/****** Object:  Table [dbo].[prebind_schema_input]    Script Date: 28.10.2022 11:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prebind_schema_input](
	[rowno] [float] NULL,
	[level] [nvarchar](255) NULL,
	[master] [nvarchar](255) NULL,
	[ignore] [nvarchar](255) NULL,
	[parent] [nvarchar](255) NULL,
	[att_name] [nvarchar](255) NULL,
	[att_type] [nvarchar](255) NULL,
	[keyfield] [nvarchar](255) NULL,
	[description] [nvarchar](255) NULL,
	[scope] [nvarchar](255) NULL,
	[comments] [nvarchar](255) NULL,
	[db_table] [nvarchar](255) NULL,
	[db_column] [nvarchar](255) NULL,
	[db_definition] [nvarchar](255) NULL,
	[dbdatatype] [nvarchar](255) NULL
) ON [PRIMARY]
GO
