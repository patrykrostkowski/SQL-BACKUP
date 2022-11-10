USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[PolicyForm]    Script Date: 10.11.2022 14:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Policy].[PolicyForm]') AND type in (N'U'))
BEGIN
CREATE TABLE [Policy].[PolicyForm](
	[PolicyFormSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NULL,
	[ETLUpdateDateTime] [datetime] NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PolicySK] [int] NOT NULL,
	[PolicyFormNum] [varchar](20) NOT NULL,
	[PolicyFormDesc] [varchar](255) NULL,
	[PolicyTransSK] [int] NULL,
 CONSTRAINT [PK_PolicyForm] PRIMARY KEY CLUSTERED 
(
	[PolicyFormSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicySK_PolicyForm]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyForm]'))
ALTER TABLE [Policy].[PolicyForm]  WITH CHECK ADD  CONSTRAINT [FK_PolicySK_PolicyForm] FOREIGN KEY([PolicySK])
REFERENCES [Policy].[Policy] ([PolicySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicySK_PolicyForm]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyForm]'))
ALTER TABLE [Policy].[PolicyForm] CHECK CONSTRAINT [FK_PolicySK_PolicyForm]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyTransSK_PolicyForm]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyForm]'))
ALTER TABLE [Policy].[PolicyForm]  WITH CHECK ADD  CONSTRAINT [FK_PolicyTransSK_PolicyForm] FOREIGN KEY([PolicyTransSK])
REFERENCES [Policy].[PolicyTrans] ([PolicyTransSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyTransSK_PolicyForm]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyForm]'))
ALTER TABLE [Policy].[PolicyForm] CHECK CONSTRAINT [FK_PolicyTransSK_PolicyForm]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_PolicyForm]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyForm]'))
ALTER TABLE [Policy].[PolicyForm]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyForm] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_PolicyForm]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyForm]'))
ALTER TABLE [Policy].[PolicyForm] CHECK CONSTRAINT [FK_SourceSystemSK_PolicyForm]
GO
