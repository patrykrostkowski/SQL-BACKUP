USE [DataMagnifier]
GO
/****** Object:  Table [Claim].[ClaimPolicyAssociation]    Script Date: 08.11.2022 08:11:11 ******/
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
	[PolicySK] [int] NOT NULL,
 CONSTRAINT [PK_ClaimPolicyAssociation] PRIMARY KEY CLUSTERED 
(
	[ClaimPolicyAssociationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Claim].[ClaimPolicyAssociation]  WITH CHECK ADD  CONSTRAINT [FK_ClaimPolicySK_ClaimPolicyAssociation] FOREIGN KEY([ClaimPolicySK])
REFERENCES [Claim].[ClaimPolicy] ([ClaimPolicySK])
GO
ALTER TABLE [Claim].[ClaimPolicyAssociation] CHECK CONSTRAINT [FK_ClaimPolicySK_ClaimPolicyAssociation]
GO
ALTER TABLE [Claim].[ClaimPolicyAssociation]  WITH CHECK ADD  CONSTRAINT [FK_ClaimSK_ClaimPolicyAssociation] FOREIGN KEY([ClaimSK])
REFERENCES [Claim].[Claim] ([ClaimSK])
GO
ALTER TABLE [Claim].[ClaimPolicyAssociation] CHECK CONSTRAINT [FK_ClaimSK_ClaimPolicyAssociation]
GO
ALTER TABLE [Claim].[ClaimPolicyAssociation]  WITH CHECK ADD  CONSTRAINT [FK_PolicySK_ClaimPolicyAssociation] FOREIGN KEY([PolicySK])
REFERENCES [Policy].[Policy] ([PolicySK])
GO
ALTER TABLE [Claim].[ClaimPolicyAssociation] CHECK CONSTRAINT [FK_PolicySK_ClaimPolicyAssociation]
GO
ALTER TABLE [Claim].[ClaimPolicyAssociation]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClaimPolicyAssociation] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[ClaimPolicyAssociation] CHECK CONSTRAINT [FK_SourceSystemSK_ClaimPolicyAssociation]
GO
