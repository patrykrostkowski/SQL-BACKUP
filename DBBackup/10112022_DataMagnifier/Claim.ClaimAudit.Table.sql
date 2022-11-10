USE [DataMagnifier]
GO
/****** Object:  Table [Claim].[ClaimAudit]    Script Date: 10.11.2022 14:35:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Claim].[ClaimAudit]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_AuditTransactionSK_ClaimAudit]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimAudit]'))
ALTER TABLE [Claim].[ClaimAudit]  WITH CHECK ADD  CONSTRAINT [FK_AuditTransactionSK_ClaimAudit] FOREIGN KEY([AuditTransactionSK])
REFERENCES [TypeList].[AuditTransaction] ([AuditTransactionSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_AuditTransactionSK_ClaimAudit]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimAudit]'))
ALTER TABLE [Claim].[ClaimAudit] CHECK CONSTRAINT [FK_AuditTransactionSK_ClaimAudit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimantSK_ClaimAudit]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimAudit]'))
ALTER TABLE [Claim].[ClaimAudit]  WITH CHECK ADD  CONSTRAINT [FK_ClaimantSK_ClaimAudit] FOREIGN KEY([ClaimantSK])
REFERENCES [Claim].[Claimant] ([ClaimantSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimantSK_ClaimAudit]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimAudit]'))
ALTER TABLE [Claim].[ClaimAudit] CHECK CONSTRAINT [FK_ClaimantSK_ClaimAudit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimPolicySK_ClaimAudit]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimAudit]'))
ALTER TABLE [Claim].[ClaimAudit]  WITH CHECK ADD  CONSTRAINT [FK_ClaimPolicySK_ClaimAudit] FOREIGN KEY([ClaimPolicySK])
REFERENCES [Claim].[ClaimPolicy] ([ClaimPolicySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimPolicySK_ClaimAudit]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimAudit]'))
ALTER TABLE [Claim].[ClaimAudit] CHECK CONSTRAINT [FK_ClaimPolicySK_ClaimAudit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimSK_ClaimAudit]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimAudit]'))
ALTER TABLE [Claim].[ClaimAudit]  WITH CHECK ADD  CONSTRAINT [FK_ClaimSK_ClaimAudit] FOREIGN KEY([ClaimSK])
REFERENCES [Claim].[Claim] ([ClaimSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimSK_ClaimAudit]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimAudit]'))
ALTER TABLE [Claim].[ClaimAudit] CHECK CONSTRAINT [FK_ClaimSK_ClaimAudit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SourceSystemSK_ClaimAudit]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimAudit]'))
ALTER TABLE [Claim].[ClaimAudit]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClaimAudit] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SourceSystemSK_ClaimAudit]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimAudit]'))
ALTER TABLE [Claim].[ClaimAudit] CHECK CONSTRAINT [FK_SourceSystemSK_ClaimAudit]
GO
