USE [DataMagnifier]
GO
/****** Object:  Table [Claim].[ClaimAudit]    Script Date: 31.10.2022 11:42:54 ******/
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
ALTER TABLE [Claim].[ClaimAudit]  WITH CHECK ADD  CONSTRAINT [FK_AuditTransactionSK_ClaimAudit] FOREIGN KEY([AuditTransactionSK])
REFERENCES [TypeList].[AuditTransaction] ([AuditTransactionSK])
GO
ALTER TABLE [Claim].[ClaimAudit] CHECK CONSTRAINT [FK_AuditTransactionSK_ClaimAudit]
GO
ALTER TABLE [Claim].[ClaimAudit]  WITH CHECK ADD  CONSTRAINT [FK_ClaimantSK_ClaimAudit] FOREIGN KEY([ClaimantSK])
REFERENCES [Claim].[Claimant] ([ClaimantSK])
GO
ALTER TABLE [Claim].[ClaimAudit] CHECK CONSTRAINT [FK_ClaimantSK_ClaimAudit]
GO
ALTER TABLE [Claim].[ClaimAudit]  WITH CHECK ADD  CONSTRAINT [FK_ClaimPolicySK_ClaimAudit] FOREIGN KEY([ClaimPolicySK])
REFERENCES [Claim].[ClaimPolicy] ([ClaimPolicySK])
GO
ALTER TABLE [Claim].[ClaimAudit] CHECK CONSTRAINT [FK_ClaimPolicySK_ClaimAudit]
GO
ALTER TABLE [Claim].[ClaimAudit]  WITH CHECK ADD  CONSTRAINT [FK_ClaimSK_ClaimAudit] FOREIGN KEY([ClaimSK])
REFERENCES [Claim].[Claim] ([ClaimSK])
GO
ALTER TABLE [Claim].[ClaimAudit] CHECK CONSTRAINT [FK_ClaimSK_ClaimAudit]
GO
ALTER TABLE [Claim].[ClaimAudit]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClaimAudit] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[ClaimAudit] CHECK CONSTRAINT [FK_SourceSystemSK_ClaimAudit]
GO
