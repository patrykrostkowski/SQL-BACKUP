USE [DataMagnifier]
GO
/****** Object:  Table [Finance].[ClaimTransaction]    Script Date: 10.11.2022 14:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Finance].[ClaimTransaction]') AND type in (N'U'))
BEGIN
CREATE TABLE [Finance].[ClaimTransaction](
	[ClaimTransactionSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[Sourcecode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[ClaimSK] [int] NOT NULL,
	[LossOccurrenceSK] [int] NOT NULL,
	[ClaimCoverageSK] [int] NULL,
	[WritingCompanySK] [int] NOT NULL,
	[AuthorizationStatusSK] [int] NULL,
	[ClaimTransactionTypeSK] [int] NOT NULL,
	[AmountCategorySK] [int] NOT NULL,
	[PaymentTypeSK] [int] NULL,
	[BaseCurrencySK] [int] NOT NULL,
	[OriginalCurrencySK] [int] NULL,
	[ReportingCurrencySK] [int] NULL,
	[TransactionBaseAmt] [decimal](19, 4) NULL,
	[TransactionOriginalAmt] [decimal](19, 4) NULL,
	[TransactionReportingAmt] [decimal](19, 4) NULL,
	[TransactionDate] [date] NULL,
 CONSTRAINT [PK_ClaimTransaction] PRIMARY KEY CLUSTERED 
(
	[ClaimTransactionSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AmountCategorySK_ClaimTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimTransaction]'))
ALTER TABLE [Finance].[ClaimTransaction]  WITH CHECK ADD  CONSTRAINT [FK_AmountCategorySK_ClaimTransaction] FOREIGN KEY([AmountCategorySK])
REFERENCES [TypeList].[AmountType] ([AmountTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AmountCategorySK_ClaimTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimTransaction]'))
ALTER TABLE [Finance].[ClaimTransaction] CHECK CONSTRAINT [FK_AmountCategorySK_ClaimTransaction]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AuthorizationStatusSK_ClaimTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimTransaction]'))
ALTER TABLE [Finance].[ClaimTransaction]  WITH CHECK ADD  CONSTRAINT [FK_AuthorizationStatusSK_ClaimTransaction] FOREIGN KEY([AuthorizationStatusSK])
REFERENCES [TypeList].[AuthorizationStatus] ([AuthorizationStatusSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_AuthorizationStatusSK_ClaimTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimTransaction]'))
ALTER TABLE [Finance].[ClaimTransaction] CHECK CONSTRAINT [FK_AuthorizationStatusSK_ClaimTransaction]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_BaseCurrencySK_ClaimTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimTransaction]'))
ALTER TABLE [Finance].[ClaimTransaction]  WITH CHECK ADD  CONSTRAINT [FK_BaseCurrencySK_ClaimTransaction] FOREIGN KEY([BaseCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_BaseCurrencySK_ClaimTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimTransaction]'))
ALTER TABLE [Finance].[ClaimTransaction] CHECK CONSTRAINT [FK_BaseCurrencySK_ClaimTransaction]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ClaimCoverageSK_ClaimTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimTransaction]'))
ALTER TABLE [Finance].[ClaimTransaction]  WITH CHECK ADD  CONSTRAINT [FK_ClaimCoverageSK_ClaimTransaction] FOREIGN KEY([ClaimCoverageSK])
REFERENCES [Claim].[ClaimCoverage] ([ClaimCoverageSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ClaimCoverageSK_ClaimTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimTransaction]'))
ALTER TABLE [Finance].[ClaimTransaction] CHECK CONSTRAINT [FK_ClaimCoverageSK_ClaimTransaction]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ClaimSK_ClaimTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimTransaction]'))
ALTER TABLE [Finance].[ClaimTransaction]  WITH CHECK ADD  CONSTRAINT [FK_ClaimSK_ClaimTransaction] FOREIGN KEY([ClaimSK])
REFERENCES [Claim].[Claim] ([ClaimSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ClaimSK_ClaimTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimTransaction]'))
ALTER TABLE [Finance].[ClaimTransaction] CHECK CONSTRAINT [FK_ClaimSK_ClaimTransaction]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ClaimTransactionTypeSK_ClaimTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimTransaction]'))
ALTER TABLE [Finance].[ClaimTransaction]  WITH CHECK ADD  CONSTRAINT [FK_ClaimTransactionTypeSK_ClaimTransaction] FOREIGN KEY([ClaimTransactionTypeSK])
REFERENCES [TypeList].[ClaimTransactionType] ([ClaimTransactionTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ClaimTransactionTypeSK_ClaimTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimTransaction]'))
ALTER TABLE [Finance].[ClaimTransaction] CHECK CONSTRAINT [FK_ClaimTransactionTypeSK_ClaimTransaction]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_LossOccurrenceSK_ClaimTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimTransaction]'))
ALTER TABLE [Finance].[ClaimTransaction]  WITH CHECK ADD  CONSTRAINT [FK_LossOccurrenceSK_ClaimTransaction] FOREIGN KEY([LossOccurrenceSK])
REFERENCES [Claim].[LossOccurrence] ([LossOccurrenceSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_LossOccurrenceSK_ClaimTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimTransaction]'))
ALTER TABLE [Finance].[ClaimTransaction] CHECK CONSTRAINT [FK_LossOccurrenceSK_ClaimTransaction]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_OriginalCurrencySK_ClaimTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimTransaction]'))
ALTER TABLE [Finance].[ClaimTransaction]  WITH CHECK ADD  CONSTRAINT [FK_OriginalCurrencySK_ClaimTransaction] FOREIGN KEY([OriginalCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_OriginalCurrencySK_ClaimTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimTransaction]'))
ALTER TABLE [Finance].[ClaimTransaction] CHECK CONSTRAINT [FK_OriginalCurrencySK_ClaimTransaction]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PaymentTypeSK_ClaimTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimTransaction]'))
ALTER TABLE [Finance].[ClaimTransaction]  WITH CHECK ADD  CONSTRAINT [FK_PaymentTypeSK_ClaimTransaction] FOREIGN KEY([PaymentTypeSK])
REFERENCES [TypeList].[PaymentType] ([PaymentTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PaymentTypeSK_ClaimTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimTransaction]'))
ALTER TABLE [Finance].[ClaimTransaction] CHECK CONSTRAINT [FK_PaymentTypeSK_ClaimTransaction]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ReportingCurrencySK_ClaimTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimTransaction]'))
ALTER TABLE [Finance].[ClaimTransaction]  WITH CHECK ADD  CONSTRAINT [FK_ReportingCurrencySK_ClaimTransaction] FOREIGN KEY([ReportingCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ReportingCurrencySK_ClaimTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimTransaction]'))
ALTER TABLE [Finance].[ClaimTransaction] CHECK CONSTRAINT [FK_ReportingCurrencySK_ClaimTransaction]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_SourceSystemSK_ClaimTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimTransaction]'))
ALTER TABLE [Finance].[ClaimTransaction]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClaimTransaction] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_SourceSystemSK_ClaimTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimTransaction]'))
ALTER TABLE [Finance].[ClaimTransaction] CHECK CONSTRAINT [FK_SourceSystemSK_ClaimTransaction]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_WritingCompanySK_ClaimTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimTransaction]'))
ALTER TABLE [Finance].[ClaimTransaction]  WITH CHECK ADD  CONSTRAINT [FK_WritingCompanySK_ClaimTransaction] FOREIGN KEY([WritingCompanySK])
REFERENCES [Party].[WritingCompany] ([WritingCompanySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_WritingCompanySK_ClaimTransaction]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimTransaction]'))
ALTER TABLE [Finance].[ClaimTransaction] CHECK CONSTRAINT [FK_WritingCompanySK_ClaimTransaction]
GO
