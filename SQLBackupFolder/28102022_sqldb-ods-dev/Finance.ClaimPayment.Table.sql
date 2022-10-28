USE [sqldb-ods-dev]
GO
/****** Object:  Table [Finance].[ClaimPayment]    Script Date: 28.10.2022 11:09:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Finance].[ClaimPayment](
	[ClaimPaymentSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[FinancialReportingPeriodSK] [int] NOT NULL,
	[ClaimTransactionSK] [int] NOT NULL,
	[TransactionStatusSK] [int] NULL,
	[ClaimantSK] [int] NULL,
	[SequenceNum] [int] NOT NULL,
	[CheckTypeSK] [int] NULL,
	[InvoiceNum] [varchar](255) NULL,
	[CheckNum] [varchar](255) NULL,
	[CheckDate] [date] NULL,
	[PayeeName] [varchar](255) NULL,
	[PayeeTypeSK] [int] NOT NULL,
	[PaymentMethodSK] [int] NULL,
	[BankAccountSK] [int] NULL,
	[BankAccountTypeSK] [int] NULL,
	[BankRoutingNum] [varchar](15) NULL,
	[PaymentDate] [date] NULL,
	[MailToName] [varchar](255) NULL,
	[MailToAddress] [varchar](255) NULL,
	[IsReportabldeInd] [tinyint] NULL,
	[ReportableAmt] [decimal](19, 4) NULL,
	[CommentTxt] [varchar](250) NULL,
 CONSTRAINT [PK_ClaimPayment] PRIMARY KEY CLUSTERED 
(
	[ClaimPaymentSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_ClaimPayment]    Script Date: 28.10.2022 11:11:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_ClaimPayment] ON [Finance].[ClaimPayment]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Finance].[ClaimPayment]  WITH NOCHECK ADD  CONSTRAINT [FK_BankAccountSK_ClaimPayment] FOREIGN KEY([BankAccountSK])
REFERENCES [Typelist].[BankAccount] ([BankAccountSK])
GO
ALTER TABLE [Finance].[ClaimPayment] NOCHECK CONSTRAINT [FK_BankAccountSK_ClaimPayment]
GO
ALTER TABLE [Finance].[ClaimPayment]  WITH NOCHECK ADD  CONSTRAINT [FK_BankAccountTypeSK_ClaimPayment] FOREIGN KEY([BankAccountTypeSK])
REFERENCES [Typelist].[BankAccountType] ([BankAccountTypeSK])
GO
ALTER TABLE [Finance].[ClaimPayment] NOCHECK CONSTRAINT [FK_BankAccountTypeSK_ClaimPayment]
GO
ALTER TABLE [Finance].[ClaimPayment]  WITH NOCHECK ADD  CONSTRAINT [FK_CheckTypeSK_ClaimPayment] FOREIGN KEY([CheckTypeSK])
REFERENCES [Typelist].[CheckType] ([CheckTypeSK])
GO
ALTER TABLE [Finance].[ClaimPayment] NOCHECK CONSTRAINT [FK_CheckTypeSK_ClaimPayment]
GO
ALTER TABLE [Finance].[ClaimPayment]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimantSK_ClaimPayment] FOREIGN KEY([ClaimantSK])
REFERENCES [Claim].[Claimant] ([ClaimantSK])
GO
ALTER TABLE [Finance].[ClaimPayment] NOCHECK CONSTRAINT [FK_ClaimantSK_ClaimPayment]
GO
ALTER TABLE [Finance].[ClaimPayment]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimTransactionSK_ClaimPayment] FOREIGN KEY([ClaimTransactionSK])
REFERENCES [Finance].[ClaimTransaction] ([ClaimTransactionSK])
GO
ALTER TABLE [Finance].[ClaimPayment] NOCHECK CONSTRAINT [FK_ClaimTransactionSK_ClaimPayment]
GO
ALTER TABLE [Finance].[ClaimPayment]  WITH NOCHECK ADD  CONSTRAINT [FK_FinancialReportingPeriodSK_ClaimPayment] FOREIGN KEY([FinancialReportingPeriodSK])
REFERENCES [Typelist].[FinancialReportingPeriod] ([FinancialReportingPeriodSK])
GO
ALTER TABLE [Finance].[ClaimPayment] NOCHECK CONSTRAINT [FK_FinancialReportingPeriodSK_ClaimPayment]
GO
ALTER TABLE [Finance].[ClaimPayment]  WITH NOCHECK ADD  CONSTRAINT [FK_PayeeTypeSK_ClaimPayment] FOREIGN KEY([PayeeTypeSK])
REFERENCES [Typelist].[PayeeType] ([PayeeTypeSK])
GO
ALTER TABLE [Finance].[ClaimPayment] NOCHECK CONSTRAINT [FK_PayeeTypeSK_ClaimPayment]
GO
ALTER TABLE [Finance].[ClaimPayment]  WITH NOCHECK ADD  CONSTRAINT [FK_PaymentMethodSK_ClaimPayment] FOREIGN KEY([PaymentMethodSK])
REFERENCES [Typelist].[PaymentMethod] ([PaymentMethodSK])
GO
ALTER TABLE [Finance].[ClaimPayment] NOCHECK CONSTRAINT [FK_PaymentMethodSK_ClaimPayment]
GO
ALTER TABLE [Finance].[ClaimPayment]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClaimPayment] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Finance].[ClaimPayment] NOCHECK CONSTRAINT [FK_SourceSystemSK_ClaimPayment]
GO
ALTER TABLE [Finance].[ClaimPayment]  WITH NOCHECK ADD  CONSTRAINT [FK_TransactionStatusSK_ClaimPayment] FOREIGN KEY([TransactionStatusSK])
REFERENCES [Typelist].[TransactionStatus] ([TransactionStatusSK])
GO
ALTER TABLE [Finance].[ClaimPayment] NOCHECK CONSTRAINT [FK_TransactionStatusSK_ClaimPayment]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Represents the payment method  of a  claim transaction.  Exampless Check, EFT, Wire Transfer and the details of each' , @level0type=N'SCHEMA',@level0name=N'Finance', @level1type=N'TABLE',@level1name=N'ClaimPayment'
GO
