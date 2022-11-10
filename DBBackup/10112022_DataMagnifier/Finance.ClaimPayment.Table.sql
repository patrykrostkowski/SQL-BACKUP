USE [DataMagnifier]
GO
/****** Object:  Table [Finance].[ClaimPayment]    Script Date: 10.11.2022 14:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Finance].[ClaimPayment]') AND type in (N'U'))
BEGIN
CREATE TABLE [Finance].[ClaimPayment](
	[ClaimPaymentSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[ClaimTransactionSK] [int] NOT NULL,
	[TransactionStatusSK] [int] NULL,
	[ClaimantSK] [int] NULL,
	[SequenceNum] [int] NOT NULL,
	[CheckTypeSK] [int] NULL,
	[InvoiceNum] [varchar](255) NULL,
	[CheckNum] [varchar](255) NULL,
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_BankAccountSK_ClaimPayment]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimPayment]'))
ALTER TABLE [Finance].[ClaimPayment]  WITH CHECK ADD  CONSTRAINT [FK_BankAccountSK_ClaimPayment] FOREIGN KEY([BankAccountSK])
REFERENCES [TypeList].[BankAccount] ([BankAccountSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_BankAccountSK_ClaimPayment]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimPayment]'))
ALTER TABLE [Finance].[ClaimPayment] CHECK CONSTRAINT [FK_BankAccountSK_ClaimPayment]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_BankAccountTypeSK_ClaimPayment]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimPayment]'))
ALTER TABLE [Finance].[ClaimPayment]  WITH CHECK ADD  CONSTRAINT [FK_BankAccountTypeSK_ClaimPayment] FOREIGN KEY([BankAccountTypeSK])
REFERENCES [TypeList].[BankAccountType] ([BankAccountTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_BankAccountTypeSK_ClaimPayment]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimPayment]'))
ALTER TABLE [Finance].[ClaimPayment] CHECK CONSTRAINT [FK_BankAccountTypeSK_ClaimPayment]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_CheckTypeSK_ClaimPayment]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimPayment]'))
ALTER TABLE [Finance].[ClaimPayment]  WITH CHECK ADD  CONSTRAINT [FK_CheckTypeSK_ClaimPayment] FOREIGN KEY([CheckTypeSK])
REFERENCES [TypeList].[CheckType] ([CheckTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_CheckTypeSK_ClaimPayment]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimPayment]'))
ALTER TABLE [Finance].[ClaimPayment] CHECK CONSTRAINT [FK_CheckTypeSK_ClaimPayment]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ClaimantSK_ClaimPayment]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimPayment]'))
ALTER TABLE [Finance].[ClaimPayment]  WITH CHECK ADD  CONSTRAINT [FK_ClaimantSK_ClaimPayment] FOREIGN KEY([ClaimantSK])
REFERENCES [Claim].[Claimant] ([ClaimantSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ClaimantSK_ClaimPayment]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimPayment]'))
ALTER TABLE [Finance].[ClaimPayment] CHECK CONSTRAINT [FK_ClaimantSK_ClaimPayment]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ClaimTransactionSK_ClaimPayment]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimPayment]'))
ALTER TABLE [Finance].[ClaimPayment]  WITH CHECK ADD  CONSTRAINT [FK_ClaimTransactionSK_ClaimPayment] FOREIGN KEY([ClaimTransactionSK])
REFERENCES [Finance].[ClaimTransaction] ([ClaimTransactionSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ClaimTransactionSK_ClaimPayment]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimPayment]'))
ALTER TABLE [Finance].[ClaimPayment] CHECK CONSTRAINT [FK_ClaimTransactionSK_ClaimPayment]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PayeeTypeSK_ClaimPayment]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimPayment]'))
ALTER TABLE [Finance].[ClaimPayment]  WITH CHECK ADD  CONSTRAINT [FK_PayeeTypeSK_ClaimPayment] FOREIGN KEY([PayeeTypeSK])
REFERENCES [TypeList].[PayeeType] ([PayeeTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PayeeTypeSK_ClaimPayment]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimPayment]'))
ALTER TABLE [Finance].[ClaimPayment] CHECK CONSTRAINT [FK_PayeeTypeSK_ClaimPayment]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PaymentMethodSK_ClaimPayment]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimPayment]'))
ALTER TABLE [Finance].[ClaimPayment]  WITH CHECK ADD  CONSTRAINT [FK_PaymentMethodSK_ClaimPayment] FOREIGN KEY([PaymentMethodSK])
REFERENCES [TypeList].[PaymentMethod] ([PaymentMethodSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PaymentMethodSK_ClaimPayment]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimPayment]'))
ALTER TABLE [Finance].[ClaimPayment] CHECK CONSTRAINT [FK_PaymentMethodSK_ClaimPayment]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_SourceSystemSK_ClaimPayment]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimPayment]'))
ALTER TABLE [Finance].[ClaimPayment]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClaimPayment] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_SourceSystemSK_ClaimPayment]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimPayment]'))
ALTER TABLE [Finance].[ClaimPayment] CHECK CONSTRAINT [FK_SourceSystemSK_ClaimPayment]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_TransactionStatusSK_ClaimPayment]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimPayment]'))
ALTER TABLE [Finance].[ClaimPayment]  WITH CHECK ADD  CONSTRAINT [FK_TransactionStatusSK_ClaimPayment] FOREIGN KEY([TransactionStatusSK])
REFERENCES [TypeList].[TransactionStatus] ([TransactionStatusSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_TransactionStatusSK_ClaimPayment]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimPayment]'))
ALTER TABLE [Finance].[ClaimPayment] CHECK CONSTRAINT [FK_TransactionStatusSK_ClaimPayment]
GO
