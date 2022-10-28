USE [sqldb-ods-dev]
GO
/****** Object:  Table [Policy].[PolicyAudit]    Script Date: 28.10.2022 15:04:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_PolicyAudit]    Script Date: 28.10.2022 15:06:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_PolicyAudit] ON [Policy].[PolicyAudit]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Policy].[PolicyAudit]  WITH NOCHECK ADD  CONSTRAINT [FK_AuditTransactionSK_PolicyAudit] FOREIGN KEY([AuditTransactionSK])
REFERENCES [Typelist].[AuditTransaction] ([AuditTransactionSK])
GO
ALTER TABLE [Policy].[PolicyAudit] NOCHECK CONSTRAINT [FK_AuditTransactionSK_PolicyAudit]
GO
ALTER TABLE [Policy].[PolicyAudit]  WITH NOCHECK ADD  CONSTRAINT [FK_InsuredSK_PolicyAudit] FOREIGN KEY([InsuredSK])
REFERENCES [Party].[Insured] ([InsuredSK])
GO
ALTER TABLE [Policy].[PolicyAudit] NOCHECK CONSTRAINT [FK_InsuredSK_PolicyAudit]
GO
ALTER TABLE [Policy].[PolicyAudit]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyTransSK_PolicyAudit] FOREIGN KEY([PolicyTransSK])
REFERENCES [Policy].[PolicyTrans] ([PolicyTransSK])
GO
ALTER TABLE [Policy].[PolicyAudit] NOCHECK CONSTRAINT [FK_PolicyTransSK_PolicyAudit]
GO
ALTER TABLE [Policy].[PolicyAudit]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyAudit] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[PolicyAudit] NOCHECK CONSTRAINT [FK_SourceSystemSK_PolicyAudit]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Maintains notes, comments or other miscellaneous communication submitted by underwriters or other users into a Policy Administration application. Provides an audit trail on written communication of policy transactions.' , @level0type=N'SCHEMA',@level0name=N'Policy', @level1type=N'TABLE',@level1name=N'PolicyAudit'
GO
