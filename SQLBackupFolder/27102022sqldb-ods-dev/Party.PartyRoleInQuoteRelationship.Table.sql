USE [sqldb-ods-dev]
GO
/****** Object:  Table [Party].[PartyRoleInQuoteRelationship]    Script Date: 27.10.2022 12:26:55 ******/
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
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_PartyRoleInQuoteRelationship]    Script Date: 27.10.2022 12:28:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_PartyRoleInQuoteRelationship] ON [Party].[PartyRoleInQuoteRelationship]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Party].[PartyRoleInQuoteRelationship]  WITH NOCHECK ADD  CONSTRAINT [FK_PartyRoleSK_PartyRoleInQuoteRelationship] FOREIGN KEY([PartyRoleSK])
REFERENCES [Typelist].[PartyRole] ([PartyRoleSK])
GO
ALTER TABLE [Party].[PartyRoleInQuoteRelationship] NOCHECK CONSTRAINT [FK_PartyRoleSK_PartyRoleInQuoteRelationship]
GO
ALTER TABLE [Party].[PartyRoleInQuoteRelationship]  WITH NOCHECK ADD  CONSTRAINT [FK_PartySK_PartyRoleInQuoteRelationship] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[PartyRoleInQuoteRelationship] NOCHECK CONSTRAINT [FK_PartySK_PartyRoleInQuoteRelationship]
GO
ALTER TABLE [Party].[PartyRoleInQuoteRelationship]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteSK_PartyRoleInQuoteRelationship] FOREIGN KEY([QuoteSK])
REFERENCES [PreBind].[Quote] ([QuoteSK])
GO
ALTER TABLE [Party].[PartyRoleInQuoteRelationship] NOCHECK CONSTRAINT [FK_QuoteSK_PartyRoleInQuoteRelationship]
GO
ALTER TABLE [Party].[PartyRoleInQuoteRelationship]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteTransSK_PartyRoleInQuoteRelationship] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
ALTER TABLE [Party].[PartyRoleInQuoteRelationship] NOCHECK CONSTRAINT [FK_QuoteTransSK_PartyRoleInQuoteRelationship]
GO
ALTER TABLE [Party].[PartyRoleInQuoteRelationship]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_PartyRoleInQuoteRelationship] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Party].[PartyRoleInQuoteRelationship] NOCHECK CONSTRAINT [FK_SourceSystemSK_PartyRoleInQuoteRelationship]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A party playing the role in the quoting process .  For example, the party identifier  playing the role of underwriter , surveyor,  insured, account holder or head of household during the quoting workflow process' , @level0type=N'SCHEMA',@level0name=N'Party', @level1type=N'TABLE',@level1name=N'PartyRoleInQuoteRelationship'
GO
