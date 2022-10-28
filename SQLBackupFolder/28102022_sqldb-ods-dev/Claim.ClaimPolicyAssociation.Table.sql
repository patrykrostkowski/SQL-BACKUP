USE [sqldb-ods-dev]
GO
/****** Object:  Table [Claim].[ClaimPolicyAssociation]    Script Date: 28.10.2022 15:04:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Claim].[ClaimPolicyAssociation](
	[ClaimPolicyAssociationId] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[ClaimSK] [int] NOT NULL,
	[ClaimPolicySK] [int] NOT NULL,
	[PolicySK] [int] NULL,
 CONSTRAINT [PK_ClaimPolicyAssociation] PRIMARY KEY CLUSTERED 
(
	[ClaimPolicyAssociationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_ClaimPolicyAssociation]    Script Date: 28.10.2022 15:06:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_ClaimPolicyAssociation] ON [Claim].[ClaimPolicyAssociation]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Claim].[ClaimPolicyAssociation]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimPolicySK_ClaimPolicyAssociation] FOREIGN KEY([ClaimPolicySK])
REFERENCES [Claim].[ClaimPolicy] ([ClaimPolicySK])
GO
ALTER TABLE [Claim].[ClaimPolicyAssociation] NOCHECK CONSTRAINT [FK_ClaimPolicySK_ClaimPolicyAssociation]
GO
ALTER TABLE [Claim].[ClaimPolicyAssociation]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimSK_ClaimPolicyAssociation] FOREIGN KEY([ClaimSK])
REFERENCES [Claim].[Claim] ([ClaimSK])
GO
ALTER TABLE [Claim].[ClaimPolicyAssociation] NOCHECK CONSTRAINT [FK_ClaimSK_ClaimPolicyAssociation]
GO
ALTER TABLE [Claim].[ClaimPolicyAssociation]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicySK_ClaimPolicyAssociation] FOREIGN KEY([PolicySK])
REFERENCES [Policy].[Policy] ([PolicySK])
GO
ALTER TABLE [Claim].[ClaimPolicyAssociation] NOCHECK CONSTRAINT [FK_PolicySK_ClaimPolicyAssociation]
GO
ALTER TABLE [Claim].[ClaimPolicyAssociation]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClaimPolicyAssociation] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[ClaimPolicyAssociation] NOCHECK CONSTRAINT [FK_SourceSystemSK_ClaimPolicyAssociation]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A list of all claims associated with the claimpolicy as well as any active inforce polices' , @level0type=N'SCHEMA',@level0name=N'Claim', @level1type=N'TABLE',@level1name=N'ClaimPolicyAssociation'
GO
