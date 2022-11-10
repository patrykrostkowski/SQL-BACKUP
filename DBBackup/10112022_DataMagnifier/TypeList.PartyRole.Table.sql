﻿USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[PartyRole]    Script Date: 10.11.2022 14:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TypeList].[PartyRole]') AND type in (N'U'))
BEGIN
CREATE TABLE [TypeList].[PartyRole](
	[PartyRoleSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[PartyRoleCode] [varchar](20) NOT NULL,
	[PartyRoleName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PartyRole] PRIMARY KEY CLUSTERED 
(
	[PartyRoleSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_PartyRole]') AND parent_object_id = OBJECT_ID(N'[TypeList].[PartyRole]'))
ALTER TABLE [TypeList].[PartyRole]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PartyRole] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_PartyRole]') AND parent_object_id = OBJECT_ID(N'[TypeList].[PartyRole]'))
ALTER TABLE [TypeList].[PartyRole] CHECK CONSTRAINT [FK_SourceSystemSK_PartyRole]
GO
