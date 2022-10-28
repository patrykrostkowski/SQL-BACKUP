USE [sqldb-ods-dev]
GO
/****** Object:  Table [Config].[PartyType]    Script Date: 28.10.2022 11:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Config].[PartyType](
	[PartyTypeID] [int] IDENTITY(2,1) NOT NULL,
	[SourceSystemCode] [varchar](255) NOT NULL,
	[PartyTypeCode] [varchar](255) NOT NULL,
	[Placeholder] [varchar](255) NULL,
	[PartyType] [varchar](255) NOT NULL
) ON [PRIMARY]
GO
