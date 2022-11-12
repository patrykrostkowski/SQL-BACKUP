USE [DataMagnifier]
GO
/****** Object:  Table [Claim].[ClaimBond]    Script Date: 12.11.2022 09:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Claim].[ClaimBond]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimCurrencySK_ClaimBond]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimBond]'))
ALTER TABLE [Claim].[ClaimBond]  WITH CHECK ADD  CONSTRAINT [FK_ClaimCurrencySK_ClaimBond] FOREIGN KEY([ClaimCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimCurrencySK_ClaimBond]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimBond]'))
ALTER TABLE [Claim].[ClaimBond] CHECK CONSTRAINT [FK_ClaimCurrencySK_ClaimBond]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimSK_ClaimBond]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimBond]'))
ALTER TABLE [Claim].[ClaimBond]  WITH CHECK ADD  CONSTRAINT [FK_ClaimSK_ClaimBond] FOREIGN KEY([ClaimSK])
REFERENCES [Claim].[Claim] ([ClaimSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimSK_ClaimBond]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimBond]'))
ALTER TABLE [Claim].[ClaimBond] CHECK CONSTRAINT [FK_ClaimSK_ClaimBond]
GO
