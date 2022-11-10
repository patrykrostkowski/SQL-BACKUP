USE [DataMagnifier]
GO
/****** Object:  Table [Claim].[ClaimPolicy]    Script Date: 10.11.2022 14:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Claim].[ClaimPolicy]') AND type in (N'U'))
BEGIN
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
	[PolicyStatusSK] [int] NOT NULL,
	[PolicyTypeSK] [int] NULL,
	[ProductSK] [int] NULL,
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_CoverageTriggerSK_ClaimPolicy]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimPolicy]'))
ALTER TABLE [Claim].[ClaimPolicy]  WITH CHECK ADD  CONSTRAINT [FK_CoverageTriggerSK_ClaimPolicy] FOREIGN KEY([CoverageTriggerSK])
REFERENCES [TypeList].[CoverageTrigger] ([CoverageTriggerSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_CoverageTriggerSK_ClaimPolicy]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimPolicy]'))
ALTER TABLE [Claim].[ClaimPolicy] CHECK CONSTRAINT [FK_CoverageTriggerSK_ClaimPolicy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_PolicyCurrencySK_ClaimPolicy]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimPolicy]'))
ALTER TABLE [Claim].[ClaimPolicy]  WITH CHECK ADD  CONSTRAINT [FK_PolicyCurrencySK_ClaimPolicy] FOREIGN KEY([PolicyCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_PolicyCurrencySK_ClaimPolicy]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimPolicy]'))
ALTER TABLE [Claim].[ClaimPolicy] CHECK CONSTRAINT [FK_PolicyCurrencySK_ClaimPolicy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_PolicyStatusSK_ClaimPolicy]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimPolicy]'))
ALTER TABLE [Claim].[ClaimPolicy]  WITH CHECK ADD  CONSTRAINT [FK_PolicyStatusSK_ClaimPolicy] FOREIGN KEY([PolicyStatusSK])
REFERENCES [TypeList].[PolicyStatus] ([PolicyStatusSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_PolicyStatusSK_ClaimPolicy]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimPolicy]'))
ALTER TABLE [Claim].[ClaimPolicy] CHECK CONSTRAINT [FK_PolicyStatusSK_ClaimPolicy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_PolicyTypeSK_ClaimPolicy]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimPolicy]'))
ALTER TABLE [Claim].[ClaimPolicy]  WITH CHECK ADD  CONSTRAINT [FK_PolicyTypeSK_ClaimPolicy] FOREIGN KEY([PolicyTypeSK])
REFERENCES [TypeList].[PolicyType] ([PolicyTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_PolicyTypeSK_ClaimPolicy]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimPolicy]'))
ALTER TABLE [Claim].[ClaimPolicy] CHECK CONSTRAINT [FK_PolicyTypeSK_ClaimPolicy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ProductSK_ClaimPolicy]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimPolicy]'))
ALTER TABLE [Claim].[ClaimPolicy]  WITH CHECK ADD  CONSTRAINT [FK_ProductSK_ClaimPolicy] FOREIGN KEY([ProductSK])
REFERENCES [TypeList].[Product] ([ProductSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ProductSK_ClaimPolicy]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimPolicy]'))
ALTER TABLE [Claim].[ClaimPolicy] CHECK CONSTRAINT [FK_ProductSK_ClaimPolicy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SourceSystemSK_ClaimPolicy]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimPolicy]'))
ALTER TABLE [Claim].[ClaimPolicy]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClaimPolicy] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SourceSystemSK_ClaimPolicy]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimPolicy]'))
ALTER TABLE [Claim].[ClaimPolicy] CHECK CONSTRAINT [FK_SourceSystemSK_ClaimPolicy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_WritingCompanySK_ClaimPolicy]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimPolicy]'))
ALTER TABLE [Claim].[ClaimPolicy]  WITH CHECK ADD  CONSTRAINT [FK_WritingCompanySK_ClaimPolicy] FOREIGN KEY([WritingCompanySK])
REFERENCES [Party].[WritingCompany] ([WritingCompanySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_WritingCompanySK_ClaimPolicy]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimPolicy]'))
ALTER TABLE [Claim].[ClaimPolicy] CHECK CONSTRAINT [FK_WritingCompanySK_ClaimPolicy]
GO
