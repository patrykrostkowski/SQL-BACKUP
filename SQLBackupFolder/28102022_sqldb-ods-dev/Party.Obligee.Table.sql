USE [sqldb-ods-dev]
GO
/****** Object:  Table [Party].[Obligee]    Script Date: 28.10.2022 12:26:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Party].[Obligee](
	[ObligeeSK] [int] IDENTITY(2,1) NOT NULL,
	[PartySK] [int] NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PrincipalStatusSK] [image] NOT NULL,
	[ObligeeStatusSK] [int] NOT NULL,
	[DBAName] [varchar](255) NULL,
	[IsFortune500CompanyInd] [tinyint] NULL,
	[CreditScoreNum] [int] NULL,
	[PrincipalDate] [date] NULL,
	[DirectCollectCode] [varchar](25) NULL,
	[IsBankruptcyInd] [tinyint] NULL,
	[BankcruptcyStatusSK] [int] NULL,
	[BankcruptcyTypeSK] [int] NULL,
	[BPIDName] [varchar](50) NULL,
	[StandardIndustryCodeSK] [int] NULL,
	[NAICCode] [varchar](25) NULL,
	[IsClaimActivityInd] [tinyint] NULL,
	[OwnershipTypeSK] [int] NULL,
	[SynopsisDesc] [varchar](255) NULL,
	[IsSubsidiaryStatusInd] [tinyint] NULL,
	[EstimatedAnnualPremiumAmt] [decimal](19, 4) NULL,
	[IsFederalInd] [tinyint] NULL,
 CONSTRAINT [PK_Obligee] PRIMARY KEY CLUSTERED 
(
	[ObligeeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_Obligee]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_Obligee] ON [Party].[Obligee]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Party].[Obligee]  WITH NOCHECK ADD  CONSTRAINT [FK_PartySK_Obligee] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[Obligee] NOCHECK CONSTRAINT [FK_PartySK_Obligee]
GO
ALTER TABLE [Party].[Obligee]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_Obligee] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Party].[Obligee] NOCHECK CONSTRAINT [FK_SourceSystemSK_Obligee]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Obligee' , @level0type=N'SCHEMA',@level0name=N'Party', @level1type=N'TABLE',@level1name=N'Obligee'
GO
