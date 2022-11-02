USE [DataMagnifier]
GO
/****** Object:  Table [Party].[PartyRoleInClaimRelationship]    Script Date: 02.11.2022 14:57:41 ******/
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
ALTER TABLE [Party].[PartyRoleInClaimRelationship]  WITH CHECK ADD  CONSTRAINT [FK_ClaimSK_PartyRoleInClaimRelationship] FOREIGN KEY([ClaimSK])
REFERENCES [Claim].[Claim] ([ClaimSK])
GO
ALTER TABLE [Party].[PartyRoleInClaimRelationship] CHECK CONSTRAINT [FK_ClaimSK_PartyRoleInClaimRelationship]
GO
ALTER TABLE [Party].[PartyRoleInClaimRelationship]  WITH CHECK ADD  CONSTRAINT [FK_LossEventSK_PartyRoleInClaimRelationship] FOREIGN KEY([LossEventSK])
REFERENCES [Claim].[LossEvent] ([LossEventSK])
GO
ALTER TABLE [Party].[PartyRoleInClaimRelationship] CHECK CONSTRAINT [FK_LossEventSK_PartyRoleInClaimRelationship]
GO
ALTER TABLE [Party].[PartyRoleInClaimRelationship]  WITH CHECK ADD  CONSTRAINT [FK_LossOccurrenceSK_PartyRoleInClaimRelationship] FOREIGN KEY([LossOccurrenceSK])
REFERENCES [Claim].[LossOccurrence] ([LossOccurrenceSK])
GO
ALTER TABLE [Party].[PartyRoleInClaimRelationship] CHECK CONSTRAINT [FK_LossOccurrenceSK_PartyRoleInClaimRelationship]
GO
ALTER TABLE [Party].[PartyRoleInClaimRelationship]  WITH CHECK ADD  CONSTRAINT [FK_PartyRoleSK_PartyRoleInClaimRelationship] FOREIGN KEY([PartyRoleSK])
REFERENCES [TypeList].[PartyRole] ([PartyRoleSK])
GO
ALTER TABLE [Party].[PartyRoleInClaimRelationship] CHECK CONSTRAINT [FK_PartyRoleSK_PartyRoleInClaimRelationship]
GO
ALTER TABLE [Party].[PartyRoleInClaimRelationship]  WITH CHECK ADD  CONSTRAINT [FK_PartySK_PartyRoleInClaimRelationship] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[PartyRoleInClaimRelationship] CHECK CONSTRAINT [FK_PartySK_PartyRoleInClaimRelationship]
GO
ALTER TABLE [Party].[PartyRoleInClaimRelationship]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PartyRoleInClaimRelationship] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Party].[PartyRoleInClaimRelationship] CHECK CONSTRAINT [FK_SourceSystemSK_PartyRoleInClaimRelationship]
GO
