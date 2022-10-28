USE [sqldb-ods-dev]
GO
/****** Object:  Table [Claim].[ClaimAudit]    Script Date: 28.10.2022 11:09:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Claim].[ClaimAudit](
	[ClaimAuditSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[ClaimSK] [int] NOT NULL,
	[ClaimantSK] [int] NULL,
	[ClaimPolicySK] [int] NULL,
	[AuditTransactionSK] [int] NOT NULL,
	[EventDateTime] [datetime] NOT NULL,
	[AuditDesc] [varchar](255) NULL,
 CONSTRAINT [PK_ClaimAudit] PRIMARY KEY CLUSTERED 
(
	[ClaimAuditSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_ClaimAudit]    Script Date: 28.10.2022 11:11:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_ClaimAudit] ON [Claim].[ClaimAudit]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Claim].[ClaimAudit]  WITH NOCHECK ADD  CONSTRAINT [FK_AuditTransactionSK_ClaimAudit] FOREIGN KEY([AuditTransactionSK])
REFERENCES [Typelist].[AuditTransaction] ([AuditTransactionSK])
GO
ALTER TABLE [Claim].[ClaimAudit] NOCHECK CONSTRAINT [FK_AuditTransactionSK_ClaimAudit]
GO
ALTER TABLE [Claim].[ClaimAudit]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimantSK_ClaimAudit] FOREIGN KEY([ClaimantSK])
REFERENCES [Claim].[Claimant] ([ClaimantSK])
GO
ALTER TABLE [Claim].[ClaimAudit] NOCHECK CONSTRAINT [FK_ClaimantSK_ClaimAudit]
GO
ALTER TABLE [Claim].[ClaimAudit]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimPolicySK_ClaimAudit] FOREIGN KEY([ClaimPolicySK])
REFERENCES [Claim].[ClaimPolicy] ([ClaimPolicySK])
GO
ALTER TABLE [Claim].[ClaimAudit] NOCHECK CONSTRAINT [FK_ClaimPolicySK_ClaimAudit]
GO
ALTER TABLE [Claim].[ClaimAudit]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimSK_ClaimAudit] FOREIGN KEY([ClaimSK])
REFERENCES [Claim].[Claim] ([ClaimSK])
GO
ALTER TABLE [Claim].[ClaimAudit] NOCHECK CONSTRAINT [FK_ClaimSK_ClaimAudit]
GO
ALTER TABLE [Claim].[ClaimAudit]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClaimAudit] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[ClaimAudit] NOCHECK CONSTRAINT [FK_SourceSystemSK_ClaimAudit]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A list of claim  related audit transactions' , @level0type=N'SCHEMA',@level0name=N'Claim', @level1type=N'TABLE',@level1name=N'ClaimAudit'
GO
