USE [sqldb-ods-dev]
GO
/****** Object:  Table [Party].[Insured]    Script Date: 27.10.2022 12:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Party].[Insured](
	[InsuredSK] [int] IDENTITY(2,1) NOT NULL,
	[PartySK] [int] NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[AccountNum] [varchar](256) NULL,
	[ParentName] [varchar](256) NULL,
	[ParentDUNSNum] [varchar](256) NULL,
	[DBAName] [varchar](256) NULL,
	[USTickerSymbolName] [varchar](256) NULL,
	[DomicileCountrySK] [int] NOT NULL,
	[DomicileStateSK] [int] NULL,
	[TotalEmployeesNum] [int] NULL,
	[MarketValueAmt] [decimal](19, 4) NULL,
	[SICCode] [varchar](20) NULL,
	[NorthAmericanIndustryClassificationSK] [int] NULL,
	[PrimaryDBAIndustryName] [varchar](256) NULL,
	[StateOfIncorporationName] [varchar](256) NULL,
 CONSTRAINT [PK_Insured] PRIMARY KEY CLUSTERED 
(
	[InsuredSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_Insured]    Script Date: 27.10.2022 12:28:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_Insured] ON [Party].[Insured]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Party].[Insured]  WITH NOCHECK ADD  CONSTRAINT [FK_DomicileCountrySK_Insured] FOREIGN KEY([DomicileCountrySK])
REFERENCES [Typelist].[Country] ([CountrySK])
GO
ALTER TABLE [Party].[Insured] NOCHECK CONSTRAINT [FK_DomicileCountrySK_Insured]
GO
ALTER TABLE [Party].[Insured]  WITH NOCHECK ADD  CONSTRAINT [FK_DomicileStateSK_Insured] FOREIGN KEY([DomicileStateSK])
REFERENCES [Typelist].[State] ([StateSK])
GO
ALTER TABLE [Party].[Insured] NOCHECK CONSTRAINT [FK_DomicileStateSK_Insured]
GO
ALTER TABLE [Party].[Insured]  WITH NOCHECK ADD  CONSTRAINT [FK_PartySK_Insured] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[Insured] NOCHECK CONSTRAINT [FK_PartySK_Insured]
GO
ALTER TABLE [Party].[Insured]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_Insured] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Party].[Insured] NOCHECK CONSTRAINT [FK_SourceSystemSK_Insured]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A Party playing the role of insured.  A person or organization whose interest in the subject matter of the insurance is protected under the insurance contract. The insured does not necessarily need to be the account holder or the beneficiary.' , @level0type=N'SCHEMA',@level0name=N'Party', @level1type=N'TABLE',@level1name=N'Insured'
GO
