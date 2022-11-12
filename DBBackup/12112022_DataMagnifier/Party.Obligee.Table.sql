USE [DataMagnifier]
GO
/****** Object:  Table [Party].[Obligee]    Script Date: 12.11.2022 09:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Party].[Obligee]') AND type in (N'U'))
BEGIN
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
 CONSTRAINT [PK_Obligee] PRIMARY KEY NONCLUSTERED 
(
	[ObligeeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_PartySK_Obligee]') AND parent_object_id = OBJECT_ID(N'[Party].[Obligee]'))
ALTER TABLE [Party].[Obligee]  WITH CHECK ADD  CONSTRAINT [FK_PartySK_Obligee] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_PartySK_Obligee]') AND parent_object_id = OBJECT_ID(N'[Party].[Obligee]'))
ALTER TABLE [Party].[Obligee] CHECK CONSTRAINT [FK_PartySK_Obligee]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_SourceSystemSK_Obligee]') AND parent_object_id = OBJECT_ID(N'[Party].[Obligee]'))
ALTER TABLE [Party].[Obligee]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_Obligee] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_SourceSystemSK_Obligee]') AND parent_object_id = OBJECT_ID(N'[Party].[Obligee]'))
ALTER TABLE [Party].[Obligee] CHECK CONSTRAINT [FK_SourceSystemSK_Obligee]
GO
