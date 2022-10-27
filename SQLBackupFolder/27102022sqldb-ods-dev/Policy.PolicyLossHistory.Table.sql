USE [sqldb-ods-dev]
GO
/****** Object:  Table [Policy].[PolicyLossHistory]    Script Date: 27.10.2022 12:27:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[PolicyLossHistory](
	[PolicyLossHistorySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteNum] [varchar](20) NULL,
	[PolicyNum] [varchar](100) NULL,
	[PolicySK] [int] NOT NULL,
	[SuffixPolicyRenewalNum] [varchar](20) NULL,
	[AddressLine1] [varchar](50) NULL,
	[AddressLine2] [varchar](50) NULL,
	[AddressLine3] [varchar](50) NULL,
	[AddressLine4] [varchar](50) NULL,
	[CityName] [varchar](50) NULL,
	[StateName] [varchar](50) NULL,
	[PostalCode] [varchar](20) NULL,
	[LossReportingFromDate] [date] NULL,
	[LossReportingToDate] [date] NULL,
	[ClaimNum] [varchar](50) NULL,
	[ReopenReasonDesc] [varchar](100) NULL,
	[CoverageName] [varchar](50) NULL,
	[CauseofLossName] [varchar](50) NULL,
	[CauseofLossSK] [int] NULL,
	[CarsDamagedNum] [int] NULL,
	[BaseCurrencySK] [int] NULL,
	[NetPaidBaseAmt] [decimal](19, 4) NULL,
	[AdjustedPaidBaseAmt] [decimal](19, 4) NULL,
	[DeductibleAppliedBaseAmt] [decimal](19, 4) NULL,
	[NetIncurredLossBaseAmt] [decimal](19, 4) NULL,
	[EndorsementCode] [varchar](20) NULL,
	[LossLevelCode] [varchar](20) NULL,
	[EndorsementSessionNum] [varchar](20) NULL,
	[EndorsementEffectiveDate] [date] NULL,
 CONSTRAINT [PK_PolicyLossHistory] PRIMARY KEY CLUSTERED 
(
	[PolicyLossHistorySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_PolicyLossHistory]    Script Date: 27.10.2022 12:28:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_PolicyLossHistory] ON [Policy].[PolicyLossHistory]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Policy].[PolicyLossHistory]  WITH NOCHECK ADD  CONSTRAINT [FK_BaseCurrencySK_PolicyLossHistory] FOREIGN KEY([BaseCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[PolicyLossHistory] NOCHECK CONSTRAINT [FK_BaseCurrencySK_PolicyLossHistory]
GO
ALTER TABLE [Policy].[PolicyLossHistory]  WITH CHECK ADD  CONSTRAINT [FK_CauseofLossSK_PolicyLossHistory] FOREIGN KEY([CauseofLossSK])
REFERENCES [Typelist].[CauseofLoss] ([CauseofLossSK])
GO
ALTER TABLE [Policy].[PolicyLossHistory] CHECK CONSTRAINT [FK_CauseofLossSK_PolicyLossHistory]
GO
ALTER TABLE [Policy].[PolicyLossHistory]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicySK_PolicyLossHistory] FOREIGN KEY([PolicySK])
REFERENCES [Policy].[Policy] ([PolicySK])
GO
ALTER TABLE [Policy].[PolicyLossHistory] NOCHECK CONSTRAINT [FK_PolicySK_PolicyLossHistory]
GO
ALTER TABLE [Policy].[PolicyLossHistory]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyLossHistory] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[PolicyLossHistory] NOCHECK CONSTRAINT [FK_SourceSystemSK_PolicyLossHistory]
GO
