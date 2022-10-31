USE [DataMagnifier]
GO
/****** Object:  Table [Finance].[ClaimSummary]    Script Date: 31.10.2022 13:29:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Finance].[ClaimSummary](
	[ClaimSummarySK] [int] IDENTITY(2,1) NOT NULL,
	[ClaimSK] [int] NOT NULL,
	[ClaimCoverageSK] [int] NOT NULL,
	[CauseCode] [varchar](15) NULL,
	[CauseDesc] [varchar](255) NULL,
	[ClassCode] [varchar](15) NULL,
	[ClassDesc] [varchar](255) NULL,
	[StatusCode] [varchar](15) NULL,
	[StatusDesc] [varchar](255) NULL,
	[SubLineCode] [varchar](10) NULL,
	[DomicileStateSK] [int] NOT NULL,
	[DomicileStateCode] [varchar](10) NULL,
	[AnnualStatementLineofBusinessSK] [int] NOT NULL,
	[AnnualStatementLineofBusinessCode] [varchar](20) NULL,
	[BureauLineName] [varchar](10) NULL,
	[BaseCurrencySK] [int] NULL,
	[ReportingCurrencySK] [int] NULL,
	[OriginalCurrencySK] [int] NULL,
	[LossPaidBaseAmt] [decimal](14, 4) NULL,
	[LossPaidOriginalAmt] [decimal](19, 4) NULL,
	[LossPaidReportingAmt] [decimal](19, 4) NULL,
	[LossReserveBaseAmt] [decimal](19, 4) NULL,
	[LossReserveOriginalAmt] [decimal](19, 4) NULL,
	[LossReserveReportingAmt] [decimal](19, 4) NULL,
	[LossRecoveryBaseAmt] [decimal](19, 4) NULL,
	[LossRecoveryOriginalAmt] [decimal](19, 4) NULL,
	[LossRecoveryReportingAmt] [decimal](19, 4) NULL,
	[LossExpectedRecoveryAmt] [decimal](19, 4) NULL,
	[ALAEPaidBaseAmt] [decimal](19, 4) NULL,
	[ALAEPaidOriginalAmt] [decimal](19, 4) NULL,
	[ALAEPaidReportingAmt] [decimal](19, 4) NULL,
	[ALAEReserveBaseAmt] [decimal](19, 4) NULL,
	[ALAEReserveOriginalAmt] [decimal](19, 4) NULL,
	[ALAEReserveReportingAmt] [decimal](19, 4) NULL,
	[ALAERecoveryBaseAmt] [decimal](19, 4) NULL,
	[ALAERecoveryOriginalAmt] [decimal](19, 4) NULL,
	[ALAERecoveryReportingAmt] [decimal](19, 4) NULL,
	[ALAEExpectedRecoveryBaseAmt] [decimal](19, 4) NULL,
	[ALAEExpectedRecoveryOriginalAmt] [decimal](19, 4) NULL,
	[ALAEExpectedRecoveryReportingAmt] [decimal](19, 4) NULL,
	[ULAEPaidBaseAmt] [decimal](19, 4) NULL,
	[ULAEPaidOriginalAmt] [decimal](19, 4) NULL,
	[ULAEPaidReportingAmt] [decimal](19, 4) NULL,
	[ULAEReserveBaseAmt] [decimal](19, 4) NULL,
	[ULAEReserveOriginalAmt] [decimal](19, 4) NULL,
	[ULAEReserveReportingAmt] [decimal](19, 4) NULL,
	[ULAERecoveryBaseAmt] [decimal](19, 4) NULL,
	[ULAERecoveryOriginalAmt] [decimal](19, 4) NULL,
	[ULAERecoveryReportingAmt] [decimal](19, 4) NULL,
	[ULAEExpectedRecoveryBaseAmt] [decimal](19, 4) NULL,
	[ULAEExpectedRecoveryOriginalAmt] [decimal](19, 4) NULL,
	[ULAEExpectedRecoveryReportingAmt] [decimal](19, 4) NULL,
	[MedicalPaidBaseAmt] [decimal](19, 4) NULL,
	[MedicalPaidOriginalAmt] [decimal](19, 4) NULL,
	[MedicalPaidReportingAmt] [decimal](19, 4) NULL,
	[MedicalReserveBaseAmt] [decimal](19, 4) NULL,
	[MedicalReserveOriginalAmt] [decimal](19, 4) NULL,
	[MedicalReserveReportingAmt] [decimal](19, 4) NULL,
	[MedicalRecoveryBaseAmt] [decimal](19, 4) NULL,
	[MedicalRecoveryOriginalAmt] [decimal](19, 4) NULL,
	[MedicalRecoveryReportingAmt] [decimal](19, 4) NULL,
	[MedicalExpectedRecoveryBaseAmt] [decimal](19, 4) NULL,
	[MedicalExpectedRecoveryOriginalAmt] [decimal](19, 4) NULL,
	[MedicalExpectedRecoveryReportingAmt] [decimal](19, 4) NULL,
	[VocationRehabPaidBaseAmt] [decimal](19, 4) NULL,
	[VocationRehabPaidOriginalAmt] [decimal](19, 4) NULL,
	[VocationRehabPaidReportingAmt] [decimal](19, 4) NULL,
	[VocationRehabReserveBaseAmt] [decimal](19, 4) NULL,
	[VocationRehabReserveOriginalAmt] [decimal](19, 4) NULL,
	[VocationRehabReserveReportingAmt] [decimal](19, 4) NULL,
	[VocationRehabRecoveryBaseAmt] [decimal](19, 4) NULL,
	[VocationRehabRecoveryOriginalAmt] [decimal](19, 4) NULL,
	[VocationRehabRecoveryReportingAmt] [decimal](19, 4) NULL,
	[VocationRehabExpectedRecoveryBaseAmt] [decimal](19, 4) NULL,
	[VocationRehabExpectedRecoveryOriginalAmt] [decimal](19, 4) NULL,
	[VocationRehabExpectedRecoveryReportingAmt] [decimal](19, 4) NULL,
 CONSTRAINT [PK_ClaimSummary] PRIMARY KEY CLUSTERED 
(
	[ClaimSummarySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Finance].[ClaimSummary]  WITH CHECK ADD  CONSTRAINT [FK_AnnualStatementLineofBusinessSK_ClaimSummary] FOREIGN KEY([AnnualStatementLineofBusinessSK])
REFERENCES [TypeList].[AnnualStatementLineofBusiness] ([AnnualStatementLineofBusinessSK])
GO
ALTER TABLE [Finance].[ClaimSummary] CHECK CONSTRAINT [FK_AnnualStatementLineofBusinessSK_ClaimSummary]
GO
ALTER TABLE [Finance].[ClaimSummary]  WITH CHECK ADD  CONSTRAINT [FK_BaseCurrencySK_ClaimSummary] FOREIGN KEY([BaseCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[ClaimSummary] CHECK CONSTRAINT [FK_BaseCurrencySK_ClaimSummary]
GO
ALTER TABLE [Finance].[ClaimSummary]  WITH CHECK ADD  CONSTRAINT [FK_ClaimCoverageSK_ClaimSummary] FOREIGN KEY([ClaimCoverageSK])
REFERENCES [Claim].[ClaimCoverage] ([ClaimCoverageSK])
GO
ALTER TABLE [Finance].[ClaimSummary] CHECK CONSTRAINT [FK_ClaimCoverageSK_ClaimSummary]
GO
ALTER TABLE [Finance].[ClaimSummary]  WITH CHECK ADD  CONSTRAINT [FK_ClaimSK_ClaimSummary] FOREIGN KEY([ClaimSK])
REFERENCES [Claim].[Claim] ([ClaimSK])
GO
ALTER TABLE [Finance].[ClaimSummary] CHECK CONSTRAINT [FK_ClaimSK_ClaimSummary]
GO
ALTER TABLE [Finance].[ClaimSummary]  WITH CHECK ADD  CONSTRAINT [FK_DomicileStateSK_ClaimSummary] FOREIGN KEY([DomicileStateSK])
REFERENCES [TypeList].[State] ([StateSK])
GO
ALTER TABLE [Finance].[ClaimSummary] CHECK CONSTRAINT [FK_DomicileStateSK_ClaimSummary]
GO
ALTER TABLE [Finance].[ClaimSummary]  WITH CHECK ADD  CONSTRAINT [FK_OriginalCurrencySK_ClaimSummary] FOREIGN KEY([OriginalCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[ClaimSummary] CHECK CONSTRAINT [FK_OriginalCurrencySK_ClaimSummary]
GO
ALTER TABLE [Finance].[ClaimSummary]  WITH CHECK ADD  CONSTRAINT [FK_ReportingCurrencySK_ClaimSummary] FOREIGN KEY([ReportingCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[ClaimSummary] CHECK CONSTRAINT [FK_ReportingCurrencySK_ClaimSummary]
GO
