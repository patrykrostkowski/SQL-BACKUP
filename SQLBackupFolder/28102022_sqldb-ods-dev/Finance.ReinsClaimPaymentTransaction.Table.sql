USE [sqldb-ods-dev]
GO
/****** Object:  Table [Finance].[ReinsClaimPaymentTransaction]    Script Date: 28.10.2022 11:09:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Finance].[ReinsClaimPaymentTransaction](
	[ReinsClaimPaymentTransactionSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[FinancialReportingPeriodSK] [int] NULL,
	[TreatySK] [int] NOT NULL,
	[ClaimSK] [int] NULL,
	[ReinsClaimnum] [varchar](25) NULL,
	[PolicySK] [int] NOT NULL,
	[ReinsurerCompanyCode] [varchar](25) NULL,
	[ClaimTransactionTypeSK] [int] NOT NULL,
	[ReinsTransactionNum] [int] NULL,
	[BaseCurrencySK] [int] NOT NULL,
	[CededLossPaidBaseAmt] [decimal](19, 4) NULL,
	[CededLossExpenseBaseAmt] [decimal](19, 4) NULL,
	[CededLossReserveBaseAmt] [decimal](19, 4) NULL,
	[CededALAEReserveBaseAmt] [decimal](19, 4) NULL,
	[CededULAEReserveBaseAmt] [decimal](19, 4) NULL,
 CONSTRAINT [PK_ReinsClaimPayment] PRIMARY KEY CLUSTERED 
(
	[ReinsClaimPaymentTransactionSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_ReinsClaimPaymentTransaction]    Script Date: 28.10.2022 11:11:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_ReinsClaimPaymentTransaction] ON [Finance].[ReinsClaimPaymentTransaction]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Finance].[ReinsClaimPaymentTransaction]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimSK_ReinsClaimPayment] FOREIGN KEY([ClaimSK])
REFERENCES [Claim].[Claim] ([ClaimSK])
GO
ALTER TABLE [Finance].[ReinsClaimPaymentTransaction] NOCHECK CONSTRAINT [FK_ClaimSK_ReinsClaimPayment]
GO
ALTER TABLE [Finance].[ReinsClaimPaymentTransaction]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimTransactionTypeSK_ReinsClaimPayment] FOREIGN KEY([ClaimTransactionTypeSK])
REFERENCES [Typelist].[ClaimTransactionType] ([ClaimTransactionTypeSK])
GO
ALTER TABLE [Finance].[ReinsClaimPaymentTransaction] NOCHECK CONSTRAINT [FK_ClaimTransactionTypeSK_ReinsClaimPayment]
GO
ALTER TABLE [Finance].[ReinsClaimPaymentTransaction]  WITH NOCHECK ADD  CONSTRAINT [FK_CurrencySK_ReinsClaimPayment] FOREIGN KEY([BaseCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[ReinsClaimPaymentTransaction] NOCHECK CONSTRAINT [FK_CurrencySK_ReinsClaimPayment]
GO
ALTER TABLE [Finance].[ReinsClaimPaymentTransaction]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicySK_ReinsClaimPayment] FOREIGN KEY([PolicySK])
REFERENCES [Policy].[Policy] ([PolicySK])
GO
ALTER TABLE [Finance].[ReinsClaimPaymentTransaction] NOCHECK CONSTRAINT [FK_PolicySK_ReinsClaimPayment]
GO
ALTER TABLE [Finance].[ReinsClaimPaymentTransaction]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_ReinsClaimPayment] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Finance].[ReinsClaimPaymentTransaction] NOCHECK CONSTRAINT [FK_SourceSystemSK_ReinsClaimPayment]
GO
ALTER TABLE [Finance].[ReinsClaimPaymentTransaction]  WITH NOCHECK ADD  CONSTRAINT [RefTreaty958] FOREIGN KEY([TreatySK])
REFERENCES [Reins].[Treaty] ([TreatySK])
GO
ALTER TABLE [Finance].[ReinsClaimPaymentTransaction] NOCHECK CONSTRAINT [RefTreaty958]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The payments made to the insurance company to offset losses based on  a claim.  The reinsurer bears a portion of the losses based on a pre-negotiated percentage. The reinsurer also reimburses the insurer for processing, business acquisition, and writing costs.' , @level0type=N'SCHEMA',@level0name=N'Finance', @level1type=N'TABLE',@level1name=N'ReinsClaimPaymentTransaction'
GO
