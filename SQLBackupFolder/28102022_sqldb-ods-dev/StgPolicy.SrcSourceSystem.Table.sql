USE [sqldb-ods-dev]
GO
/****** Object:  Table [StgPolicy].[SrcSourceSystem]    Script Date: 28.10.2022 13:37:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [StgPolicy].[SrcSourceSystem](
	[SourceSystemCode] [nvarchar](255) NULL,
	[SourceSystemName] [nvarchar](255) NULL
) ON [PRIMARY]
GO
