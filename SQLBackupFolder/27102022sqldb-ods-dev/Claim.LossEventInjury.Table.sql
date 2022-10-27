USE [sqldb-ods-dev]
GO
/****** Object:  Table [Claim].[LossEventInjury]    Script Date: 27.10.2022 12:26:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Claim].[LossEventInjury](
	[LossEventInjurySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[LossEventSK] [int] NOT NULL,
	[ClaimantSK] [int] NULL,
	[MedicalTreatmentSK] [int] NULL,
	[InjuryTypeSK] [int] NULL,
	[InjuryCauseTypeSK] [int] NULL,
	[BodyPartInjuryTypeSK] [int] NULL,
	[IsDisabledDueToAccidentInd] [tinyint] NULL,
	[IsLostWagesInd] [tinyint] NULL,
	[IsAmbulanceUsedInd] [tinyint] NULL,
 CONSTRAINT [PK_LossEventInjury] PRIMARY KEY CLUSTERED 
(
	[LossEventInjurySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_LossEventInjury]    Script Date: 27.10.2022 12:28:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_LossEventInjury] ON [Claim].[LossEventInjury]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Claim].[LossEventInjury]  WITH NOCHECK ADD  CONSTRAINT [FK_BodyPartInjuryTypeSK_LossEventInjury] FOREIGN KEY([BodyPartInjuryTypeSK])
REFERENCES [Typelist].[BodyPartInjuryType] ([BodyPartInjuryTypeSK])
GO
ALTER TABLE [Claim].[LossEventInjury] NOCHECK CONSTRAINT [FK_BodyPartInjuryTypeSK_LossEventInjury]
GO
ALTER TABLE [Claim].[LossEventInjury]  WITH NOCHECK ADD  CONSTRAINT [FK_InjuryCauseTypeSK_LossEventInjury] FOREIGN KEY([InjuryCauseTypeSK])
REFERENCES [Typelist].[InjuryCauseType] ([InjuryCauseTypeSK])
GO
ALTER TABLE [Claim].[LossEventInjury] NOCHECK CONSTRAINT [FK_InjuryCauseTypeSK_LossEventInjury]
GO
ALTER TABLE [Claim].[LossEventInjury]  WITH NOCHECK ADD  CONSTRAINT [FK_InjuryTypeSK_LossEventInjury] FOREIGN KEY([InjuryTypeSK])
REFERENCES [Typelist].[InjuryType] ([InjuryTypeSK])
GO
ALTER TABLE [Claim].[LossEventInjury] NOCHECK CONSTRAINT [FK_InjuryTypeSK_LossEventInjury]
GO
ALTER TABLE [Claim].[LossEventInjury]  WITH NOCHECK ADD  CONSTRAINT [FK_LossEventSK_LossEventInjury] FOREIGN KEY([LossEventSK])
REFERENCES [Claim].[LossEvent] ([LossEventSK])
GO
ALTER TABLE [Claim].[LossEventInjury] NOCHECK CONSTRAINT [FK_LossEventSK_LossEventInjury]
GO
ALTER TABLE [Claim].[LossEventInjury]  WITH NOCHECK ADD  CONSTRAINT [FK_MedicalTreatmentSK_LossEventInjury] FOREIGN KEY([MedicalTreatmentSK])
REFERENCES [Typelist].[MedicalTreatment] ([MedicalTreatmentSK])
GO
ALTER TABLE [Claim].[LossEventInjury] NOCHECK CONSTRAINT [FK_MedicalTreatmentSK_LossEventInjury]
GO
ALTER TABLE [Claim].[LossEventInjury]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_LossEventInjury] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[LossEventInjury] NOCHECK CONSTRAINT [FK_SourceSystemSK_LossEventInjury]
GO
ALTER TABLE [Claim].[LossEventInjury]  WITH NOCHECK ADD  CONSTRAINT [RefClaimant1064] FOREIGN KEY([ClaimantSK])
REFERENCES [Claim].[Claimant] ([ClaimantSK])
GO
ALTER TABLE [Claim].[LossEventInjury] NOCHECK CONSTRAINT [RefClaimant1064]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Specifics of an  injury loss event' , @level0type=N'SCHEMA',@level0name=N'Claim', @level1type=N'TABLE',@level1name=N'LossEventInjury'
GO
