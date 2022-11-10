USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[PolicyAudit]    Script Date: 10.11.2022 14:36:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Policy].[PolicyAudit]') AND type in (N'U'))
BEGIN
CREATE TABLE [Policy].[PolicyAudit](
	[PolicyAuditSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PolicyTransSK] [int] NULL,
	[InsuredSK] [int] NULL,
	[AuditTransactionSK] [int] NOT NULL,
	[AuditTransactionDateTime] [datetime] NOT NULL,
	[AuditDesc] [varchar](255) NULL,
	[CurrentValue] [varchar](255) NULL,
	[NewValue] [varchar](255) NULL,
 CONSTRAINT [PK_PolicyAudit] PRIMARY KEY CLUSTERED 
(
	[PolicyAuditSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_AuditTransactionSK_PolicyAudit]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyAudit]'))
ALTER TABLE [Policy].[PolicyAudit]  WITH CHECK ADD  CONSTRAINT [FK_AuditTransactionSK_PolicyAudit] FOREIGN KEY([AuditTransactionSK])
REFERENCES [TypeList].[AuditTransaction] ([AuditTransactionSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_AuditTransactionSK_PolicyAudit]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyAudit]'))
ALTER TABLE [Policy].[PolicyAudit] CHECK CONSTRAINT [FK_AuditTransactionSK_PolicyAudit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_InsuredSK_PolicyAudit]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyAudit]'))
ALTER TABLE [Policy].[PolicyAudit]  WITH CHECK ADD  CONSTRAINT [FK_InsuredSK_PolicyAudit] FOREIGN KEY([InsuredSK])
REFERENCES [Party].[Insured] ([InsuredSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_InsuredSK_PolicyAudit]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyAudit]'))
ALTER TABLE [Policy].[PolicyAudit] CHECK CONSTRAINT [FK_InsuredSK_PolicyAudit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyTransSK_PolicyAudit]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyAudit]'))
ALTER TABLE [Policy].[PolicyAudit]  WITH CHECK ADD  CONSTRAINT [FK_PolicyTransSK_PolicyAudit] FOREIGN KEY([PolicyTransSK])
REFERENCES [Policy].[PolicyTrans] ([PolicyTransSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyTransSK_PolicyAudit]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyAudit]'))
ALTER TABLE [Policy].[PolicyAudit] CHECK CONSTRAINT [FK_PolicyTransSK_PolicyAudit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_PolicyAudit]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyAudit]'))
ALTER TABLE [Policy].[PolicyAudit]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyAudit] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_PolicyAudit]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyAudit]'))
ALTER TABLE [Policy].[PolicyAudit] CHECK CONSTRAINT [FK_SourceSystemSK_PolicyAudit]
GO
