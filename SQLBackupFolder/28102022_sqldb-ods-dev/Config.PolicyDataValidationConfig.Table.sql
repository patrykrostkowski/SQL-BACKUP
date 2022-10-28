USE [sqldb-ods-dev]
GO
/****** Object:  Table [Config].[PolicyDataValidationConfig]    Script Date: 28.10.2022 15:04:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Config].[PolicyDataValidationConfig](
	[JoinCondition] [varchar](max) NULL,
	[WhereCondition] [varchar](max) NULL,
	[IsActive] [tinyint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
