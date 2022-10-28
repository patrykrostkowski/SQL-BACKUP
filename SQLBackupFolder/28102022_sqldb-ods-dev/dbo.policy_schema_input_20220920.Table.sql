USE [sqldb-ods-dev]
GO
/****** Object:  Table [dbo].[policy_schema_input_20220920]    Script Date: 28.10.2022 13:36:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[policy_schema_input_20220920](
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
