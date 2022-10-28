USE [sqldb-ods-dev]
GO
/****** Object:  Table [Claim].[LitigationDetail]    Script Date: 28.10.2022 13:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Claim].[LitigationDetail](
	[LitigationDetailSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[LitigationSK] [int] NOT NULL,
	[OpenDate] [date] NULL,
	[ServedDate] [date] NULL,
	[ReceivedDate] [date] NULL,
	[CityName] [varchar](50) NULL,
	[CountyName] [varchar](50) NULL,
	[PostalCode] [varchar](10) NULL,
	[LitigationStatusSK] [int] NULL,
	[IsTrialInd] [tinyint] NULL,
	[TrialDate] [date] NULL,
	[CloseDate] [date] NULL,
	[FirstPartyLiabilityPct] [decimal](8, 2) NULL,
	[ThirdPartyfLiabilityPct] [decimal](8, 2) NULL,
	[PermanentDisabilityPct] [decimal](8, 2) NULL,
	[LitigationSuitAmt] [decimal](19, 4) NULL,
	[EstimatedExpenseAmt] [decimal](19, 4) NULL,
	[EstimatedBodilyInjuryAmt] [decimal](19, 4) NULL,
	[EstimatedOtherAmt] [decimal](19, 4) NULL,
	[DeductibleAmt] [decimal](19, 4) NULL,
	[EstimatedAttorneyHighAmt] [decimal](19, 4) NULL,
	[EstimatedAttorneyLowAmt] [decimal](19, 4) NULL,
	[EstmatedVerdictRangeHighAmt] [decimal](19, 4) NULL,
	[EstimatedVerdictRangeLowAmt] [decimal](19, 4) NULL,
	[IsEvaluationSentInd] [tinyint] NULL,
	[IsInsurerNotifiedInd] [tinyint] NULL,
	[IsExcessInsurerNotifiedInd] [tinyint] NULL,
	[ReferralDate] [date] NULL,
	[IsDiscoveryCompleteInd] [tinyint] NULL,
	[PreTrialConferenceDate] [date] NULL,
	[ArbitrationDate] [date] NULL,
	[ArbitratorNum] [varchar](15) NULL,
	[MediationDate] [date] NULL,
	[MediatorNum] [varchar](15) NULL,
	[StatuteOfLimitationsDate] [date] NULL,
	[CourtNum] [varchar](15) NULL,
	[DocketNum] [varchar](15) NULL,
	[JudgeNum] [varchar](15) NULL,
	[VerdictDate] [date] NULL,
	[VerdictCode] [varchar](10) NULL,
	[VerdictAmt] [decimal](19, 4) NULL,
	[IsAppealedInd] [tinyint] NULL,
 CONSTRAINT [PK_LitigationDetail] PRIMARY KEY CLUSTERED 
(
	[LitigationDetailSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_LitigationDetail]    Script Date: 28.10.2022 13:37:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_LitigationDetail] ON [Claim].[LitigationDetail]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Claim].[LitigationDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_LitigationSK_LitigationDetail] FOREIGN KEY([LitigationSK])
REFERENCES [Claim].[Litigation] ([LitigationSK])
GO
ALTER TABLE [Claim].[LitigationDetail] NOCHECK CONSTRAINT [FK_LitigationSK_LitigationDetail]
GO
ALTER TABLE [Claim].[LitigationDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_LitigationDetail] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[LitigationDetail] NOCHECK CONSTRAINT [FK_SourceSystemSK_LitigationDetail]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The findings and other details associated with Litigation proceedings' , @level0type=N'SCHEMA',@level0name=N'Claim', @level1type=N'TABLE',@level1name=N'LitigationDetail'
GO
