USE [sqldb-ods-dev]
GO
/****** Object:  Table [Config].[SourceSystemRelationshipConfig]    Script Date: 28.10.2022 11:09:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Config].[SourceSystemRelationshipConfig](
	[PolicySourceSystemCode] [varchar](50) NULL,
	[ClaimSOurceSystemCode] [varchar](50) NULL,
	[EarningsSourceSystemCode] [varchar](50) NULL
) ON [PRIMARY]
GO
