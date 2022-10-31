USE [DataMagnifier]
GO
/****** Object:  Table [Party].[Insured]    Script Date: 31.10.2022 13:29:15 ******/
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
ALTER TABLE [Party].[Insured]  WITH CHECK ADD  CONSTRAINT [FK_DomicileCountrySK_Insured] FOREIGN KEY([DomicileCountrySK])
REFERENCES [TypeList].[Country] ([CountrySK])
GO
ALTER TABLE [Party].[Insured] CHECK CONSTRAINT [FK_DomicileCountrySK_Insured]
GO
ALTER TABLE [Party].[Insured]  WITH CHECK ADD  CONSTRAINT [FK_DomicileStateSK_Insured] FOREIGN KEY([DomicileStateSK])
REFERENCES [TypeList].[State] ([StateSK])
GO
ALTER TABLE [Party].[Insured] CHECK CONSTRAINT [FK_DomicileStateSK_Insured]
GO
ALTER TABLE [Party].[Insured]  WITH CHECK ADD  CONSTRAINT [FK_PartySK_Insured] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[Insured] CHECK CONSTRAINT [FK_PartySK_Insured]
GO
ALTER TABLE [Party].[Insured]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_Insured] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Party].[Insured] CHECK CONSTRAINT [FK_SourceSystemSK_Insured]
GO
