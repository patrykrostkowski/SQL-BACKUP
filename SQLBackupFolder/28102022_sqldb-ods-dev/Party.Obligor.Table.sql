USE [sqldb-ods-dev]
GO
/****** Object:  Table [Party].[Obligor]    Script Date: 28.10.2022 15:04:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Party].[Obligor](
	[ObligorSK] [int] IDENTITY(2,1) NOT NULL,
	[PartySK] [int] NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PrincipalStatusSK] [image] NOT NULL,
	[ObligorNum] [varchar](50) NOT NULL,
	[ObligorName] [varchar](100) NOT NULL,
	[BondFormNum] [varchar](50) NOT NULL,
	[BondFormName] [varchar](100) NOT NULL,
	[ObligationEffectiveDate] [date] NOT NULL,
	[ObligationStateSK] [int] NOT NULL,
	[ObligorStatusSK] [int] NOT NULL,
	[WritingCompanySK] [int] NOT NULL,
	[RenewableTypeSK] [int] NULL,
	[CancellationProvisionSK] [int] NULL,
	[NextRenewalDaysNum] [int] NULL,
	[IsCancellationInd] [tinyint] NULL,
	[IsRenewableInd] [tinyint] NULL,
	[IsContinuousInd] [tinyint] NULL,
	[IsContinuousLetterSentInd] [tinyint] NULL,
	[BPIDName] [varchar](50) NULL,
	[StandardIndustryCodeSK] [int] NULL,
	[NAICCode] [varchar](25) NULL,
	[IsFederalInd] [tinyint] NULL,
 CONSTRAINT [PK_Obligor] PRIMARY KEY CLUSTERED 
(
	[ObligorSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_Obligor]    Script Date: 28.10.2022 15:06:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_Obligor] ON [Party].[Obligor]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Party].[Obligor]  WITH NOCHECK ADD  CONSTRAINT [FK_PartySK_Obligor] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[Obligor] NOCHECK CONSTRAINT [FK_PartySK_Obligor]
GO
ALTER TABLE [Party].[Obligor]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_Obligor] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Party].[Obligor] NOCHECK CONSTRAINT [FK_SourceSystemSK_Obligor]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'a person or organization that is bound by an obligation to another. In a bonding situation, this party, commonly called the "principal," purchases a bond to protect the party to whom it owes an obligation. For example, under a performance bond, the obligor is the contractor that is required to perform the specified work for the project owner.' , @level0type=N'SCHEMA',@level0name=N'Party', @level1type=N'TABLE',@level1name=N'Obligor'
GO
