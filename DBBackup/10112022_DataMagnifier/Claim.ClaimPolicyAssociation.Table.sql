USE [DataMagnifier]
GO
/****** Object:  Table [Claim].[ClaimPolicyAssociation]    Script Date: 10.11.2022 14:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Claim].[ClaimPolicyAssociation]') AND type in (N'U'))
BEGIN
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
	[PolicySK] [int] NOT NULL,
 CONSTRAINT [PK_ClaimPolicyAssociation] PRIMARY KEY CLUSTERED 
(
	[ClaimPolicyAssociationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimPolicySK_ClaimPolicyAssociation]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimPolicyAssociation]'))
ALTER TABLE [Claim].[ClaimPolicyAssociation]  WITH CHECK ADD  CONSTRAINT [FK_ClaimPolicySK_ClaimPolicyAssociation] FOREIGN KEY([ClaimPolicySK])
REFERENCES [Claim].[ClaimPolicy] ([ClaimPolicySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimPolicySK_ClaimPolicyAssociation]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimPolicyAssociation]'))
ALTER TABLE [Claim].[ClaimPolicyAssociation] CHECK CONSTRAINT [FK_ClaimPolicySK_ClaimPolicyAssociation]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimSK_ClaimPolicyAssociation]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimPolicyAssociation]'))
ALTER TABLE [Claim].[ClaimPolicyAssociation]  WITH CHECK ADD  CONSTRAINT [FK_ClaimSK_ClaimPolicyAssociation] FOREIGN KEY([ClaimSK])
REFERENCES [Claim].[Claim] ([ClaimSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimSK_ClaimPolicyAssociation]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimPolicyAssociation]'))
ALTER TABLE [Claim].[ClaimPolicyAssociation] CHECK CONSTRAINT [FK_ClaimSK_ClaimPolicyAssociation]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_PolicySK_ClaimPolicyAssociation]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimPolicyAssociation]'))
ALTER TABLE [Claim].[ClaimPolicyAssociation]  WITH CHECK ADD  CONSTRAINT [FK_PolicySK_ClaimPolicyAssociation] FOREIGN KEY([PolicySK])
REFERENCES [Policy].[Policy] ([PolicySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_PolicySK_ClaimPolicyAssociation]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimPolicyAssociation]'))
ALTER TABLE [Claim].[ClaimPolicyAssociation] CHECK CONSTRAINT [FK_PolicySK_ClaimPolicyAssociation]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SourceSystemSK_ClaimPolicyAssociation]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimPolicyAssociation]'))
ALTER TABLE [Claim].[ClaimPolicyAssociation]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClaimPolicyAssociation] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SourceSystemSK_ClaimPolicyAssociation]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimPolicyAssociation]'))
ALTER TABLE [Claim].[ClaimPolicyAssociation] CHECK CONSTRAINT [FK_SourceSystemSK_ClaimPolicyAssociation]
GO
