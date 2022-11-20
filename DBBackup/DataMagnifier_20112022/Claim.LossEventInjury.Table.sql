USE [DataMagnifier]
GO
/****** Object:  Table [Claim].[LossEventInjury]    Script Date: 20.11.2022 19:02:22 ******/
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
	[MedicalTreatmentSK] [int] NULL,
	[InjuryTypeSK] [int] NULL,
	[IsDisabledDueToAccidentInd] [tinyint] NULL,
	[IsLostWagesInd] [tinyint] NULL,
	[IsAmbulanceUsedInd] [tinyint] NULL,
 CONSTRAINT [PK_LossEventInjury] PRIMARY KEY CLUSTERED 
(
	[LossEventInjurySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Claim].[LossEventInjury]  WITH CHECK ADD  CONSTRAINT [FK_InjuryTypeSK_LossEventInjury] FOREIGN KEY([InjuryTypeSK])
REFERENCES [TypeList].[InjuryType] ([InjuryTypeSK])
GO
ALTER TABLE [Claim].[LossEventInjury] CHECK CONSTRAINT [FK_InjuryTypeSK_LossEventInjury]
GO
ALTER TABLE [Claim].[LossEventInjury]  WITH CHECK ADD  CONSTRAINT [FK_LossEventSK_LossEventInjury] FOREIGN KEY([LossEventSK])
REFERENCES [Claim].[LossEvent] ([LossEventSK])
GO
ALTER TABLE [Claim].[LossEventInjury] CHECK CONSTRAINT [FK_LossEventSK_LossEventInjury]
GO
ALTER TABLE [Claim].[LossEventInjury]  WITH CHECK ADD  CONSTRAINT [FK_MedicalTreatmentSK_LossEventInjury] FOREIGN KEY([MedicalTreatmentSK])
REFERENCES [TypeList].[MedicalTreatment] ([MedicalTreatmentSK])
GO
ALTER TABLE [Claim].[LossEventInjury] CHECK CONSTRAINT [FK_MedicalTreatmentSK_LossEventInjury]
GO
ALTER TABLE [Claim].[LossEventInjury]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_LossEventInjury] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[LossEventInjury] CHECK CONSTRAINT [FK_SourceSystemSK_LossEventInjury]
GO
