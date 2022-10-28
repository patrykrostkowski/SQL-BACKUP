USE [sqldb-ods-dev]
GO
/****** Object:  Table [Config].[EmployeeRoleConfig]    Script Date: 28.10.2022 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Config].[EmployeeRoleConfig](
	[SourceSystemCode] [varchar](50) NOT NULL,
	[RoleCode] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
