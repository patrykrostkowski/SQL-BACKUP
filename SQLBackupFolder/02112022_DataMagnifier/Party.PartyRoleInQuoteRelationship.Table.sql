USE [DataMagnifier]
GO
/****** Object:  Table [Party].[PartyRoleInQuoteRelationship]    Script Date: 02.11.2022 09:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Party].[PartyRoleInQuoteRelationship](
	[PartyRoleInQuoteRelationshipSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PartySK] [int] NOT NULL,
	[PartyRoleSK] [int] NOT NULL,
	[QuoteSK] [int] NOT NULL,
	[QuoteTransSK] [int] NOT NULL,
	[EffectiveDate] [date] NULL,
	[ExpirationDate] [date] NULL,
	[IsActiveInd] [tinyint] NOT NULL,
 CONSTRAINT [PK_PartyRoleInQuoteRelationship] PRIMARY KEY CLUSTERED 
(
	[PartyRoleInQuoteRelationshipSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Party].[PartyRoleInQuoteRelationship]  WITH CHECK ADD  CONSTRAINT [FK_PartyRoleSK_PartyRoleInQuoteRelationship] FOREIGN KEY([PartyRoleSK])
REFERENCES [TypeList].[PartyRole] ([PartyRoleSK])
GO
ALTER TABLE [Party].[PartyRoleInQuoteRelationship] CHECK CONSTRAINT [FK_PartyRoleSK_PartyRoleInQuoteRelationship]
GO
ALTER TABLE [Party].[PartyRoleInQuoteRelationship]  WITH CHECK ADD  CONSTRAINT [FK_PartySK_PartyRoleInQuoteRelationship] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[PartyRoleInQuoteRelationship] CHECK CONSTRAINT [FK_PartySK_PartyRoleInQuoteRelationship]
GO
ALTER TABLE [Party].[PartyRoleInQuoteRelationship]  WITH CHECK ADD  CONSTRAINT [FK_QuoteSK_PartyRoleInQuoteRelationship] FOREIGN KEY([QuoteSK])
REFERENCES [PreBind].[Quote] ([QuoteSK])
GO
ALTER TABLE [Party].[PartyRoleInQuoteRelationship] CHECK CONSTRAINT [FK_QuoteSK_PartyRoleInQuoteRelationship]
GO
ALTER TABLE [Party].[PartyRoleInQuoteRelationship]  WITH CHECK ADD  CONSTRAINT [FK_QuoteTransSK_PartyRoleInQuoteRelationship] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
ALTER TABLE [Party].[PartyRoleInQuoteRelationship] CHECK CONSTRAINT [FK_QuoteTransSK_PartyRoleInQuoteRelationship]
GO
ALTER TABLE [Party].[PartyRoleInQuoteRelationship]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PartyRoleInQuoteRelationship] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Party].[PartyRoleInQuoteRelationship] CHECK CONSTRAINT [FK_SourceSystemSK_PartyRoleInQuoteRelationship]
GO
