USE [DataMagnifier]
GO
/****** Object:  Table [Finance].[ClaimTransaction]    Script Date: 31.10.2022 12:09:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
ALTER TABLE [Finance].[ClaimTransaction]  WITH CHECK ADD  CONSTRAINT [FK_AmountCategorySK_ClaimTransaction] FOREIGN KEY([AmountCategorySK])
REFERENCES [TypeList].[AmountType] ([AmountTypeSK])
GO
ALTER TABLE [Finance].[ClaimTransaction] CHECK CONSTRAINT [FK_AmountCategorySK_ClaimTransaction]
GO
ALTER TABLE [Finance].[ClaimTransaction]  WITH CHECK ADD  CONSTRAINT [FK_AuthorizationStatusSK_ClaimTransaction] FOREIGN KEY([AuthorizationStatusSK])
REFERENCES [TypeList].[AuthorizationStatus] ([AuthorizationStatusSK])
GO
ALTER TABLE [Finance].[ClaimTransaction] CHECK CONSTRAINT [FK_AuthorizationStatusSK_ClaimTransaction]
GO
ALTER TABLE [Finance].[ClaimTransaction]  WITH CHECK ADD  CONSTRAINT [FK_BaseCurrencySK_ClaimTransaction] FOREIGN KEY([BaseCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[ClaimTransaction] CHECK CONSTRAINT [FK_BaseCurrencySK_ClaimTransaction]
GO
ALTER TABLE [Finance].[ClaimTransaction]  WITH CHECK ADD  CONSTRAINT [FK_ClaimCoverageSK_ClaimTransaction] FOREIGN KEY([ClaimCoverageSK])
REFERENCES [Claim].[ClaimCoverage] ([ClaimCoverageSK])
GO
ALTER TABLE [Finance].[ClaimTransaction] CHECK CONSTRAINT [FK_ClaimCoverageSK_ClaimTransaction]
GO
ALTER TABLE [Finance].[ClaimTransaction]  WITH CHECK ADD  CONSTRAINT [FK_ClaimSK_ClaimTransaction] FOREIGN KEY([ClaimSK])
REFERENCES [Claim].[Claim] ([ClaimSK])
GO
ALTER TABLE [Finance].[ClaimTransaction] CHECK CONSTRAINT [FK_ClaimSK_ClaimTransaction]
GO
ALTER TABLE [Finance].[ClaimTransaction]  WITH CHECK ADD  CONSTRAINT [FK_ClaimTransactionTypeSK_ClaimTransaction] FOREIGN KEY([ClaimTransactionTypeSK])
REFERENCES [TypeList].[ClaimTransactionType] ([ClaimTransactionTypeSK])
GO
ALTER TABLE [Finance].[ClaimTransaction] CHECK CONSTRAINT [FK_ClaimTransactionTypeSK_ClaimTransaction]
GO
ALTER TABLE [Finance].[ClaimTransaction]  WITH CHECK ADD  CONSTRAINT [FK_LossOccurrenceSK_ClaimTransaction] FOREIGN KEY([LossOccurrenceSK])
REFERENCES [Claim].[LossOccurrence] ([LossOccurrenceSK])
GO
ALTER TABLE [Finance].[ClaimTransaction] CHECK CONSTRAINT [FK_LossOccurrenceSK_ClaimTransaction]
GO
ALTER TABLE [Finance].[ClaimTransaction]  WITH CHECK ADD  CONSTRAINT [FK_OriginalCurrencySK_ClaimTransaction] FOREIGN KEY([OriginalCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[ClaimTransaction] CHECK CONSTRAINT [FK_OriginalCurrencySK_ClaimTransaction]
GO
ALTER TABLE [Finance].[ClaimTransaction]  WITH CHECK ADD  CONSTRAINT [FK_PaymentTypeSK_ClaimTransaction] FOREIGN KEY([PaymentTypeSK])
REFERENCES [TypeList].[PaymentType] ([PaymentTypeSK])
GO
ALTER TABLE [Finance].[ClaimTransaction] CHECK CONSTRAINT [FK_PaymentTypeSK_ClaimTransaction]
GO
ALTER TABLE [Finance].[ClaimTransaction]  WITH CHECK ADD  CONSTRAINT [FK_ReportingCurrencySK_ClaimTransaction] FOREIGN KEY([ReportingCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[ClaimTransaction] CHECK CONSTRAINT [FK_ReportingCurrencySK_ClaimTransaction]
GO
ALTER TABLE [Finance].[ClaimTransaction]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClaimTransaction] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Finance].[ClaimTransaction] CHECK CONSTRAINT [FK_SourceSystemSK_ClaimTransaction]
GO
ALTER TABLE [Finance].[ClaimTransaction]  WITH CHECK ADD  CONSTRAINT [FK_WritingCompanySK_ClaimTransaction] FOREIGN KEY([WritingCompanySK])
REFERENCES [Party].[WritingCompany] ([WritingCompanySK])
GO
ALTER TABLE [Finance].[ClaimTransaction] CHECK CONSTRAINT [FK_WritingCompanySK_ClaimTransaction]
GO
