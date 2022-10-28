USE [sqldb-ods-dev]
GO
/****** Object:  Table [Claim].[ClaimBond]    Script Date: 28.10.2022 12:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Claim].[ClaimBond](
	[ClaimBondSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[ClaimSK] [int] NULL,
	[ClaimCurrencySK] [int] NOT NULL,
	[BondFormNum] [varchar](100) NOT NULL,
	[BondFormName] [varchar](255) NULL,
	[BondDesc] [varchar](500) NULL,
	[BondAmt] [decimal](19, 4) NULL,
	[BondClaimAmt] [decimal](19, 4) NULL,
	[BondLimitAmt] [decimal](19, 4) NULL,
	[EffectiveDate] [date] NULL,
	[ExpirationDate] [date] NULL,
	[BrokerSK] [int] NOT NULL,
	[ProductSK] [int] NULL,
	[WritingCompanySK] [int] NOT NULL,
	[PolicyStatusSK] [int] NULL,
	[StandardIndustryCodeSK] [int] NULL,
	[NorthAmericanIndustryClassificationSK] [int] NULL,
 CONSTRAINT [PK_ClaimBond] PRIMARY KEY CLUSTERED 
(
	[ClaimBondSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_ClaimBond]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_ClaimBond] ON [Claim].[ClaimBond]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Claim].[ClaimBond]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimCurrencySK_ClaimBond] FOREIGN KEY([ClaimCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Claim].[ClaimBond] NOCHECK CONSTRAINT [FK_ClaimCurrencySK_ClaimBond]
GO
ALTER TABLE [Claim].[ClaimBond]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimSK_ClaimBond] FOREIGN KEY([ClaimSK])
REFERENCES [Claim].[Claim] ([ClaimSK])
GO
ALTER TABLE [Claim].[ClaimBond] NOCHECK CONSTRAINT [FK_ClaimSK_ClaimBond]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A contract / agreement between an insured and writing company each committing themselves to fulfill one or more obligations as outlined in a policy declaration.' , @level0type=N'SCHEMA',@level0name=N'Claim', @level1type=N'TABLE',@level1name=N'ClaimBond'
GO
