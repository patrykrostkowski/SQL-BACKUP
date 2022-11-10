﻿USE [DataMagnifier]
GO
/****** Object:  Table [Claim].[LossOccurrence]    Script Date: 10.11.2022 14:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Claim].[LossOccurrence]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_AssignmentStatusSK_LossOccurrence]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossOccurrence]'))
ALTER TABLE [Claim].[LossOccurrence]  WITH CHECK ADD  CONSTRAINT [FK_AssignmentStatusSK_LossOccurrence] FOREIGN KEY([AssignmentStatusSK])
REFERENCES [TypeList].[AssignmentStatus] ([AssignmentStatusSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_AssignmentStatusSK_LossOccurrence]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossOccurrence]'))
ALTER TABLE [Claim].[LossOccurrence] CHECK CONSTRAINT [FK_AssignmentStatusSK_LossOccurrence]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimantSK_LossOccurrence]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossOccurrence]'))
ALTER TABLE [Claim].[LossOccurrence]  WITH CHECK ADD  CONSTRAINT [FK_ClaimantSK_LossOccurrence] FOREIGN KEY([ClaimantSK])
REFERENCES [Claim].[Claimant] ([ClaimantSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimantSK_LossOccurrence]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossOccurrence]'))
ALTER TABLE [Claim].[LossOccurrence] CHECK CONSTRAINT [FK_ClaimantSK_LossOccurrence]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimCoverageSK_LossOccurrence]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossOccurrence]'))
ALTER TABLE [Claim].[LossOccurrence]  WITH CHECK ADD  CONSTRAINT [FK_ClaimCoverageSK_LossOccurrence] FOREIGN KEY([ClaimCoverageSK])
REFERENCES [Claim].[ClaimCoverage] ([ClaimCoverageSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimCoverageSK_LossOccurrence]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossOccurrence]'))
ALTER TABLE [Claim].[LossOccurrence] CHECK CONSTRAINT [FK_ClaimCoverageSK_LossOccurrence]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimSK_LossOccurrence]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossOccurrence]'))
ALTER TABLE [Claim].[LossOccurrence]  WITH CHECK ADD  CONSTRAINT [FK_ClaimSK_LossOccurrence] FOREIGN KEY([ClaimSK])
REFERENCES [Claim].[Claim] ([ClaimSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimSK_LossOccurrence]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossOccurrence]'))
ALTER TABLE [Claim].[LossOccurrence] CHECK CONSTRAINT [FK_ClaimSK_LossOccurrence]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimStrategySK_LossOccurrence]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossOccurrence]'))
ALTER TABLE [Claim].[LossOccurrence]  WITH CHECK ADD  CONSTRAINT [FK_ClaimStrategySK_LossOccurrence] FOREIGN KEY([ClaimStrategySK])
REFERENCES [TypeList].[ClaimStrategy] ([ClaimStrategySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimStrategySK_LossOccurrence]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossOccurrence]'))
ALTER TABLE [Claim].[LossOccurrence] CHECK CONSTRAINT [FK_ClaimStrategySK_LossOccurrence]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClosedOutcomeSK_LossOccurrence]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossOccurrence]'))
ALTER TABLE [Claim].[LossOccurrence]  WITH CHECK ADD  CONSTRAINT [FK_ClosedOutcomeSK_LossOccurrence] FOREIGN KEY([ClosedOutcomeSK])
REFERENCES [TypeList].[ClosedOutcome] ([ClosedOutcomeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClosedOutcomeSK_LossOccurrence]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossOccurrence]'))
ALTER TABLE [Claim].[LossOccurrence] CHECK CONSTRAINT [FK_ClosedOutcomeSK_LossOccurrence]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_LossEventSK_LossOccurrence]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossOccurrence]'))
ALTER TABLE [Claim].[LossOccurrence]  WITH CHECK ADD  CONSTRAINT [FK_LossEventSK_LossOccurrence] FOREIGN KEY([LossEventSK])
REFERENCES [Claim].[LossEvent] ([LossEventSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_LossEventSK_LossOccurrence]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossOccurrence]'))
ALTER TABLE [Claim].[LossOccurrence] CHECK CONSTRAINT [FK_LossEventSK_LossOccurrence]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_LossOccurrenceTierSK_LossOccurrence]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossOccurrence]'))
ALTER TABLE [Claim].[LossOccurrence]  WITH CHECK ADD  CONSTRAINT [FK_LossOccurrenceTierSK_LossOccurrence] FOREIGN KEY([LossOccurrenceTierSK])
REFERENCES [TypeList].[LossOccurrenceTier] ([LossOccurrenceTierSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_LossOccurrenceTierSK_LossOccurrence]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossOccurrence]'))
ALTER TABLE [Claim].[LossOccurrence] CHECK CONSTRAINT [FK_LossOccurrenceTierSK_LossOccurrence]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_LossOccurrenceTypeSK_LossOccurrence]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossOccurrence]'))
ALTER TABLE [Claim].[LossOccurrence]  WITH CHECK ADD  CONSTRAINT [FK_LossOccurrenceTypeSK_LossOccurrence] FOREIGN KEY([LossOccurrenceTypeSK])
REFERENCES [TypeList].[LossOccurrenceType] ([LossOccurrenceTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_LossOccurrenceTypeSK_LossOccurrence]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossOccurrence]'))
ALTER TABLE [Claim].[LossOccurrence] CHECK CONSTRAINT [FK_LossOccurrenceTypeSK_LossOccurrence]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_LossPartyTypeSK_LossOccurrence]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossOccurrence]'))
ALTER TABLE [Claim].[LossOccurrence]  WITH CHECK ADD  CONSTRAINT [FK_LossPartyTypeSK_LossOccurrence] FOREIGN KEY([LossPartyTypeSK])
REFERENCES [TypeList].[LossPartyType] ([LossPartyTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_LossPartyTypeSK_LossOccurrence]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossOccurrence]'))
ALTER TABLE [Claim].[LossOccurrence] CHECK CONSTRAINT [FK_LossPartyTypeSK_LossOccurrence]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ReopenReasonSK_LossOccurrence]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossOccurrence]'))
ALTER TABLE [Claim].[LossOccurrence]  WITH CHECK ADD  CONSTRAINT [FK_ReopenReasonSK_LossOccurrence] FOREIGN KEY([ReopenReasonSK])
REFERENCES [TypeList].[Reason] ([ReasonSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ReopenReasonSK_LossOccurrence]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossOccurrence]'))
ALTER TABLE [Claim].[LossOccurrence] CHECK CONSTRAINT [FK_ReopenReasonSK_LossOccurrence]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SourceSystemSK_LossOccurrence]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossOccurrence]'))
ALTER TABLE [Claim].[LossOccurrence]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_LossOccurrence] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SourceSystemSK_LossOccurrence]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossOccurrence]'))
ALTER TABLE [Claim].[LossOccurrence] CHECK CONSTRAINT [FK_SourceSystemSK_LossOccurrence]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_StateSK_LossOccurrence]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossOccurrence]'))
ALTER TABLE [Claim].[LossOccurrence]  WITH CHECK ADD  CONSTRAINT [FK_StateSK_LossOccurrence] FOREIGN KEY([StateSK])
REFERENCES [TypeList].[State] ([StateSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_StateSK_LossOccurrence]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossOccurrence]'))
ALTER TABLE [Claim].[LossOccurrence] CHECK CONSTRAINT [FK_StateSK_LossOccurrence]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ValidationLevelSK_LossOccurrence]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossOccurrence]'))
ALTER TABLE [Claim].[LossOccurrence]  WITH CHECK ADD  CONSTRAINT [FK_ValidationLevelSK_LossOccurrence] FOREIGN KEY([ValidationLevelSK])
REFERENCES [TypeList].[ValidationLevel] ([ValidationLevelSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ValidationLevelSK_LossOccurrence]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossOccurrence]'))
ALTER TABLE [Claim].[LossOccurrence] CHECK CONSTRAINT [FK_ValidationLevelSK_LossOccurrence]
GO
