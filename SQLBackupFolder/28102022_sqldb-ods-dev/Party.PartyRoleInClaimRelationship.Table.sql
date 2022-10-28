USE [sqldb-ods-dev]
GO
/****** Object:  Table [Party].[PartyRoleInClaimRelationship]    Script Date: 28.10.2022 13:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Party].[PartyRoleInClaimRelationship](
	[PartyRoleInClaimRelationshipSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[ClaimSK] [int] NULL,
	[LossEventSK] [int] NULL,
	[LossOccurrenceSK] [int] NULL,
	[PartyRoleSK] [int] NOT NULL,
	[PartySK] [int] NOT NULL,
	[EffectiveDate] [date] NULL,
	[ExpirationDate] [date] NULL,
	[IsActiveInd] [tinyint] NOT NULL,
 CONSTRAINT [PK_PartyRoleInClaimRelationship] PRIMARY KEY CLUSTERED 
(
	[PartyRoleInClaimRelationshipSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_PartyRoleInClaimRelationship]    Script Date: 28.10.2022 13:37:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_PartyRoleInClaimRelationship] ON [Party].[PartyRoleInClaimRelationship]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Party].[PartyRoleInClaimRelationship]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimSK_PartyRoleInClaimRelationship] FOREIGN KEY([ClaimSK])
REFERENCES [Claim].[Claim] ([ClaimSK])
GO
ALTER TABLE [Party].[PartyRoleInClaimRelationship] NOCHECK CONSTRAINT [FK_ClaimSK_PartyRoleInClaimRelationship]
GO
ALTER TABLE [Party].[PartyRoleInClaimRelationship]  WITH NOCHECK ADD  CONSTRAINT [FK_LossEventSK_PartyRoleInClaimRelationship] FOREIGN KEY([LossEventSK])
REFERENCES [Claim].[LossEvent] ([LossEventSK])
GO
ALTER TABLE [Party].[PartyRoleInClaimRelationship] NOCHECK CONSTRAINT [FK_LossEventSK_PartyRoleInClaimRelationship]
GO
ALTER TABLE [Party].[PartyRoleInClaimRelationship]  WITH NOCHECK ADD  CONSTRAINT [FK_LossOccurrenceSK_PartyRoleInClaimRelationship] FOREIGN KEY([LossOccurrenceSK])
REFERENCES [Claim].[LossOccurrence] ([LossOccurrenceSK])
GO
ALTER TABLE [Party].[PartyRoleInClaimRelationship] NOCHECK CONSTRAINT [FK_LossOccurrenceSK_PartyRoleInClaimRelationship]
GO
ALTER TABLE [Party].[PartyRoleInClaimRelationship]  WITH NOCHECK ADD  CONSTRAINT [FK_PartyRoleSK_PartyRoleInClaimRelationship] FOREIGN KEY([PartyRoleSK])
REFERENCES [Typelist].[PartyRole] ([PartyRoleSK])
GO
ALTER TABLE [Party].[PartyRoleInClaimRelationship] NOCHECK CONSTRAINT [FK_PartyRoleSK_PartyRoleInClaimRelationship]
GO
ALTER TABLE [Party].[PartyRoleInClaimRelationship]  WITH NOCHECK ADD  CONSTRAINT [FK_PartySK_PartyRoleInClaimRelationship] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[PartyRoleInClaimRelationship] NOCHECK CONSTRAINT [FK_PartySK_PartyRoleInClaimRelationship]
GO
ALTER TABLE [Party].[PartyRoleInClaimRelationship]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_PartyRoleInClaimRelationship] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Party].[PartyRoleInClaimRelationship] NOCHECK CONSTRAINT [FK_SourceSystemSK_PartyRoleInClaimRelationship]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A party playing the role in the context of a claim, claim event or occurrence.  For example, the party identifier  playing the role of adjuster  claimant, adjuster, representative, claimee, expert or third party role in claim.' , @level0type=N'SCHEMA',@level0name=N'Party', @level1type=N'TABLE',@level1name=N'PartyRoleInClaimRelationship'
GO
