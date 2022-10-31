USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[PolicyLossHistory]    Script Date: 31.10.2022 13:29:16 ******/
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
	[Sourcecode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteNum] [varchar](20) NULL,
	[PolicyNum] [varchar](100) NULL,
	[PolicySK] [int] NOT NULL,
	[PolicyCoverageSK] [int] NOT NULL,
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
	[ClaimSK] [int] NULL,
	[ReopenReasonSK] [int] NULL,
	[CoverageName] [varchar](50) NULL,
	[ClaimCoverageSK] [int] NOT NULL,
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
	[PolicyPropertySK] [int] NULL,
	[EndorsementSessionNum] [varchar](20) NULL,
	[EndorsementEffectiveDate] [date] NULL,
 CONSTRAINT [PK_PolicyLossHistory] PRIMARY KEY CLUSTERED 
(
	[PolicyLossHistorySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Policy].[PolicyLossHistory]  WITH CHECK ADD  CONSTRAINT [FK_BaseCurrencySK_PolicyLossHistory] FOREIGN KEY([BaseCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[PolicyLossHistory] CHECK CONSTRAINT [FK_BaseCurrencySK_PolicyLossHistory]
GO
ALTER TABLE [Policy].[PolicyLossHistory]  WITH CHECK ADD  CONSTRAINT [FK_ClaimCoverageSK_PolicyLossHistory] FOREIGN KEY([ClaimCoverageSK])
REFERENCES [Claim].[ClaimCoverage] ([ClaimCoverageSK])
GO
ALTER TABLE [Policy].[PolicyLossHistory] CHECK CONSTRAINT [FK_ClaimCoverageSK_PolicyLossHistory]
GO
ALTER TABLE [Policy].[PolicyLossHistory]  WITH CHECK ADD  CONSTRAINT [FK_PolicyCoverageSK_PolicyLossHistory] FOREIGN KEY([PolicyCoverageSK])
REFERENCES [Policy].[PolicyCoverage] ([PolicyCoverageSK])
GO
ALTER TABLE [Policy].[PolicyLossHistory] CHECK CONSTRAINT [FK_PolicyCoverageSK_PolicyLossHistory]
GO
ALTER TABLE [Policy].[PolicyLossHistory]  WITH CHECK ADD  CONSTRAINT [FK_PolicySK_PolicyLossHistory] FOREIGN KEY([PolicySK])
REFERENCES [Policy].[Policy] ([PolicySK])
GO
ALTER TABLE [Policy].[PolicyLossHistory] CHECK CONSTRAINT [FK_PolicySK_PolicyLossHistory]
GO
ALTER TABLE [Policy].[PolicyLossHistory]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyLossHistory] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[PolicyLossHistory] CHECK CONSTRAINT [FK_SourceSystemSK_PolicyLossHistory]
GO
