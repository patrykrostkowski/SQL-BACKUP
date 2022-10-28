﻿USE [sqldb-ods-dev]
GO
/****** Object:  Table [Config].[TransTypeConfig]    Script Date: 28.10.2022 12:26:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Config].[TransTypeConfig](
	[SourceSystemCode] [varchar](20) NOT NULL,
	[SourceTransType] [varchar](20) NOT NULL,
	[DestTransType] [varchar](20) NOT NULL
) ON [PRIMARY]
GO
