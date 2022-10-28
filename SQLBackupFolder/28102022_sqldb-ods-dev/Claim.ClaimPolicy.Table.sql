USE [sqldb-ods-dev]
GO
/****** Object:  Table [Claim].[ClaimPolicy]    Script Date: 28.10.2022 12:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Claim].[ClaimPolicy](
	[ClaimPolicySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PolicyNum] [varchar](40) NULL,
	[TermNum] [varchar](10) NULL,
	[PolicyStatusSK] [int] NOT NULL,
	[PolicyTypeSK] [int] NULL,
	[ProductSK] [int] NULL,
	[LineofBusinessSK] [int] NULL,
	[CoverageTriggerSK] [int] NULL,
	[WritingCompanySK] [int] NULL,
	[PolicyCurrencySK] [int] NOT NULL,
	[EffectiveDate] [date] NULL,
	[ExpirationDate] [date] NULL,
	[OriginalEffectiveDate] [date] NULL,
	[CancellationDate] [date] NULL,
	[ReportingDate] [date] NULL,
	[RetroactiveDate] [date] NULL,
	[AccountNum] [varchar](40) NULL,
	[UnderwritingYear] [int] NULL,
	[NotesInfo] [varchar](255) NULL,
	[TreatyCoverageSharePct] [decimal](8, 2) NULL,
	[AnnualAggregateDeductibleAmt] [decimal](19, 4) NULL,
	[LayerRetentionAmt] [decimal](19, 4) NULL,
	[MinimumPremiumAmt] [decimal](19, 4) NULL,
	[OccurrenceLimitAmt] [decimal](19, 4) NULL,
	[NumOfReinstatements] [varchar](30) NULL,
	[TotalVehicleCount] [int] NULL,
	[TotalPropertyCount] [int] NULL,
 CONSTRAINT [PK_ClaimPolicy] PRIMARY KEY CLUSTERED 
(
	[ClaimPolicySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_ClaimPolicy]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_ClaimPolicy] ON [Claim].[ClaimPolicy]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Claim].[ClaimPolicy]  WITH NOCHECK ADD  CONSTRAINT [FK_CoverageTriggerSK_ClaimPolicy] FOREIGN KEY([CoverageTriggerSK])
REFERENCES [Typelist].[CoverageTrigger] ([CoverageTriggerSK])
GO
ALTER TABLE [Claim].[ClaimPolicy] NOCHECK CONSTRAINT [FK_CoverageTriggerSK_ClaimPolicy]
GO
ALTER TABLE [Claim].[ClaimPolicy]  WITH NOCHECK ADD  CONSTRAINT [FK_LineofBusinessSK_ClaimPolicy] FOREIGN KEY([LineofBusinessSK])
REFERENCES [Typelist].[LineofBusiness] ([LineofBusinessSK])
GO
ALTER TABLE [Claim].[ClaimPolicy] NOCHECK CONSTRAINT [FK_LineofBusinessSK_ClaimPolicy]
GO
ALTER TABLE [Claim].[ClaimPolicy]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyCurrencySK_ClaimPolicy] FOREIGN KEY([PolicyCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Claim].[ClaimPolicy] NOCHECK CONSTRAINT [FK_PolicyCurrencySK_ClaimPolicy]
GO
ALTER TABLE [Claim].[ClaimPolicy]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyStatusSK_ClaimPolicy] FOREIGN KEY([PolicyStatusSK])
REFERENCES [Typelist].[PolicyStatus] ([PolicyStatusSK])
GO
ALTER TABLE [Claim].[ClaimPolicy] NOCHECK CONSTRAINT [FK_PolicyStatusSK_ClaimPolicy]
GO
ALTER TABLE [Claim].[ClaimPolicy]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyTypeSK_ClaimPolicy] FOREIGN KEY([PolicyTypeSK])
REFERENCES [Typelist].[PolicyType] ([PolicyTypeSK])
GO
ALTER TABLE [Claim].[ClaimPolicy] NOCHECK CONSTRAINT [FK_PolicyTypeSK_ClaimPolicy]
GO
ALTER TABLE [Claim].[ClaimPolicy]  WITH NOCHECK ADD  CONSTRAINT [FK_ProductSK_ClaimPolicy] FOREIGN KEY([ProductSK])
REFERENCES [Typelist].[Product] ([ProductSK])
GO
ALTER TABLE [Claim].[ClaimPolicy] NOCHECK CONSTRAINT [FK_ProductSK_ClaimPolicy]
GO
ALTER TABLE [Claim].[ClaimPolicy]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClaimPolicy] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[ClaimPolicy] NOCHECK CONSTRAINT [FK_SourceSystemSK_ClaimPolicy]
GO
ALTER TABLE [Claim].[ClaimPolicy]  WITH NOCHECK ADD  CONSTRAINT [FK_WritingCompanySK_ClaimPolicy] FOREIGN KEY([WritingCompanySK])
REFERENCES [Party].[WritingCompany] ([WritingCompanySK])
GO
ALTER TABLE [Claim].[ClaimPolicy] NOCHECK CONSTRAINT [FK_WritingCompanySK_ClaimPolicy]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The issuing Policy of a reported claim.  The policy may not be for a current inforce policy, but active  for the loss report date and may have since been cancelled, expired or renewed.' , @level0type=N'SCHEMA',@level0name=N'Claim', @level1type=N'TABLE',@level1name=N'ClaimPolicy'
GO
