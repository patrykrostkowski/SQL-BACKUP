USE [sqldb-ods-dev]
GO
/****** Object:  Table [Config].[SourceSystemRelationshipConfig]    Script Date: 27.10.2022 12:26:37 ******/
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
