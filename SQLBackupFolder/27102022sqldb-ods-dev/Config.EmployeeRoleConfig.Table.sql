﻿USE [sqldb-ods-dev]
GO
/****** Object:  Table [Config].[EmployeeRoleConfig]    Script Date: 27.10.2022 12:26:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Config].[EmployeeRoleConfig](
	[SourceSystemCode] [varchar](50) NOT NULL,
	[RoleCode] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
