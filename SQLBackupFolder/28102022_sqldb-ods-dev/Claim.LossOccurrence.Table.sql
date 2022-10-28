USE [sqldb-ods-dev]
GO
/****** Object:  Table [Claim].[LossOccurrence]    Script Date: 28.10.2022 13:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Claim].[LossOccurrence](
	[LossOccurrenceSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[ClaimSK] [int] NOT NULL,
	[SequenceNum] [int] NULL,
	[LossEventSK] [int] NULL,
	[ClaimCoverageSK] [int] NULL,
	[AssignmentStatusSK] [int] NULL,
	[StateSK] [int] NULL,
	[LossOccurrenceTypeSK] [int] NULL,
	[ClaimantSK] [int] NULL,
	[ClosedOutcomeSK] [int] NULL,
	[LossOccurrenceTierSK] [int] NULL,
	[ClaimStrategySK] [int] NULL,
	[ReopenReasonSK] [int] NULL,
	[ValidationLevelSK] [int] NULL,
	[LossPartyTypeSK] [int] NULL,
	[OtherReasonDesc] [varchar](128) NULL,
	[ReOpenDate] [date] NULL,
	[CloseDate] [date] NULL,
	[AssignmentDate] [date] NULL,
	[NotesTxt] [varchar](255) NULL,
	[IsOtherCoverageInd] [tinyint] NULL,
	[IsContactPermittedInd] [tinyint] NULL,
 CONSTRAINT [PK_LossOccurrence] PRIMARY KEY CLUSTERED 
(
	[LossOccurrenceSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_LossOccurrence]    Script Date: 28.10.2022 13:37:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_LossOccurrence] ON [Claim].[LossOccurrence]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Claim].[LossOccurrence]  WITH NOCHECK ADD  CONSTRAINT [FK_AssignmentStatusSK_LossOccurrence] FOREIGN KEY([AssignmentStatusSK])
REFERENCES [Typelist].[AssignmentStatus] ([AssignmentStatusSK])
GO
ALTER TABLE [Claim].[LossOccurrence] NOCHECK CONSTRAINT [FK_AssignmentStatusSK_LossOccurrence]
GO
ALTER TABLE [Claim].[LossOccurrence]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimantSK_LossOccurrence] FOREIGN KEY([ClaimantSK])
REFERENCES [Claim].[Claimant] ([ClaimantSK])
GO
ALTER TABLE [Claim].[LossOccurrence] NOCHECK CONSTRAINT [FK_ClaimantSK_LossOccurrence]
GO
ALTER TABLE [Claim].[LossOccurrence]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimCoverageSK_LossOccurrence] FOREIGN KEY([ClaimCoverageSK])
REFERENCES [Claim].[ClaimCoverage] ([ClaimCoverageSK])
GO
ALTER TABLE [Claim].[LossOccurrence] NOCHECK CONSTRAINT [FK_ClaimCoverageSK_LossOccurrence]
GO
ALTER TABLE [Claim].[LossOccurrence]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimSK_LossOccurrence] FOREIGN KEY([ClaimSK])
REFERENCES [Claim].[Claim] ([ClaimSK])
GO
ALTER TABLE [Claim].[LossOccurrence] NOCHECK CONSTRAINT [FK_ClaimSK_LossOccurrence]
GO
ALTER TABLE [Claim].[LossOccurrence]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimStrategySK_LossOccurrence] FOREIGN KEY([ClaimStrategySK])
REFERENCES [Typelist].[ClaimStrategy] ([ClaimStrategySK])
GO
ALTER TABLE [Claim].[LossOccurrence] NOCHECK CONSTRAINT [FK_ClaimStrategySK_LossOccurrence]
GO
ALTER TABLE [Claim].[LossOccurrence]  WITH NOCHECK ADD  CONSTRAINT [FK_ClosedOutcomeSK_LossOccurrence] FOREIGN KEY([ClosedOutcomeSK])
REFERENCES [Typelist].[ClosedOutcome] ([ClosedOutcomeSK])
GO
ALTER TABLE [Claim].[LossOccurrence] NOCHECK CONSTRAINT [FK_ClosedOutcomeSK_LossOccurrence]
GO
ALTER TABLE [Claim].[LossOccurrence]  WITH NOCHECK ADD  CONSTRAINT [FK_LossEventSK_LossOccurrence] FOREIGN KEY([LossEventSK])
REFERENCES [Claim].[LossEvent] ([LossEventSK])
GO
ALTER TABLE [Claim].[LossOccurrence] NOCHECK CONSTRAINT [FK_LossEventSK_LossOccurrence]
GO
ALTER TABLE [Claim].[LossOccurrence]  WITH NOCHECK ADD  CONSTRAINT [FK_LossOccurrenceTierSK_LossOccurrence] FOREIGN KEY([LossOccurrenceTierSK])
REFERENCES [Typelist].[LossOccurrenceTier] ([LossOccurrenceTierSK])
GO
ALTER TABLE [Claim].[LossOccurrence] NOCHECK CONSTRAINT [FK_LossOccurrenceTierSK_LossOccurrence]
GO
ALTER TABLE [Claim].[LossOccurrence]  WITH NOCHECK ADD  CONSTRAINT [FK_LossOccurrenceTypeSK_LossOccurrence] FOREIGN KEY([LossOccurrenceTypeSK])
REFERENCES [Typelist].[LossOccurrenceType] ([LossOccurrenceTypeSK])
GO
ALTER TABLE [Claim].[LossOccurrence] NOCHECK CONSTRAINT [FK_LossOccurrenceTypeSK_LossOccurrence]
GO
ALTER TABLE [Claim].[LossOccurrence]  WITH NOCHECK ADD  CONSTRAINT [FK_LossPartyTypeSK_LossOccurrence] FOREIGN KEY([LossPartyTypeSK])
REFERENCES [Typelist].[LossPartyType] ([LossPartyTypeSK])
GO
ALTER TABLE [Claim].[LossOccurrence] NOCHECK CONSTRAINT [FK_LossPartyTypeSK_LossOccurrence]
GO
ALTER TABLE [Claim].[LossOccurrence]  WITH NOCHECK ADD  CONSTRAINT [FK_ReopenReasonSK_LossOccurrence] FOREIGN KEY([ReopenReasonSK])
REFERENCES [Typelist].[Reason] ([ReasonSK])
GO
ALTER TABLE [Claim].[LossOccurrence] NOCHECK CONSTRAINT [FK_ReopenReasonSK_LossOccurrence]
GO
ALTER TABLE [Claim].[LossOccurrence]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_LossOccurrence] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[LossOccurrence] NOCHECK CONSTRAINT [FK_SourceSystemSK_LossOccurrence]
GO
ALTER TABLE [Claim].[LossOccurrence]  WITH NOCHECK ADD  CONSTRAINT [FK_StateSK_LossOccurrence] FOREIGN KEY([StateSK])
REFERENCES [Typelist].[State] ([StateSK])
GO
ALTER TABLE [Claim].[LossOccurrence] NOCHECK CONSTRAINT [FK_StateSK_LossOccurrence]
GO
ALTER TABLE [Claim].[LossOccurrence]  WITH NOCHECK ADD  CONSTRAINT [FK_ValidationLevelSK_LossOccurrence] FOREIGN KEY([ValidationLevelSK])
REFERENCES [Typelist].[ValidationLevel] ([ValidationLevelSK])
GO
ALTER TABLE [Claim].[LossOccurrence] NOCHECK CONSTRAINT [FK_ValidationLevelSK_LossOccurrence]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An loss occurrence (aka exposure) is the base of one or several claims. Loss occurrence is associated to a loss event. The loss occurrence is qualified by a date, a location, a type, a potential cause, eventual circumstances.' , @level0type=N'SCHEMA',@level0name=N'Claim', @level1type=N'TABLE',@level1name=N'LossOccurrence'
GO
