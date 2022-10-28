USE [sqldb-ods-dev]
GO
/****** Object:  Table [dbo].[DMColumns]    Script Date: 28.10.2022 13:36:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DMColumns](
	[Table Name] [nvarchar](255) NULL,
	[Column Name] [nvarchar](255) NULL,
	[Column Definition] [nvarchar](255) NULL,
	[Attribute Notes] [nvarchar](255) NULL
) ON [PRIMARY]
GO
