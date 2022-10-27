﻿USE [sqldb-ods-dev]
GO
/****** Object:  Table [Config].[PolicyDataValidationConfig]    Script Date: 27.10.2022 12:26:36 ******/
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
