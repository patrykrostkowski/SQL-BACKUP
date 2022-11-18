USE [DataMagnifier]
GO
/****** Object:  Table [Config].[TypeListConfig]    Script Date: 18.11.2022 16:41:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Config].[TypeListConfig](
	[ConfigID] [int] IDENTITY(2,1) NOT NULL,
	[DomainName] [varchar](255) NOT NULL,
	[TypeListName] [varchar](255) NOT NULL,
	[SourceName] [varchar](255) NOT NULL,
	[Active] [bit] NOT NULL,
	[CodeFieldName] [varchar](255) NOT NULL,
	[DescFieldName] [varchar](255) NOT NULL,
	[SourceSchemaName] [varchar](255) NOT NULL,
	[TypeListSchemaName] [varchar](255) NOT NULL
) ON [PRIMARY]
GO
