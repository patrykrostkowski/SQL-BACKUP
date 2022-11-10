USE [DataMagnifier]
GO
/****** Object:  Table [Claim].[LossEventInjury]    Script Date: 10.11.2022 14:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Claim].[LossEventInjury]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_InjuryTypeSK_LossEventInjury]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossEventInjury]'))
ALTER TABLE [Claim].[LossEventInjury]  WITH CHECK ADD  CONSTRAINT [FK_InjuryTypeSK_LossEventInjury] FOREIGN KEY([InjuryTypeSK])
REFERENCES [TypeList].[InjuryType] ([InjuryTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_InjuryTypeSK_LossEventInjury]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossEventInjury]'))
ALTER TABLE [Claim].[LossEventInjury] CHECK CONSTRAINT [FK_InjuryTypeSK_LossEventInjury]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_LossEventSK_LossEventInjury]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossEventInjury]'))
ALTER TABLE [Claim].[LossEventInjury]  WITH CHECK ADD  CONSTRAINT [FK_LossEventSK_LossEventInjury] FOREIGN KEY([LossEventSK])
REFERENCES [Claim].[LossEvent] ([LossEventSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_LossEventSK_LossEventInjury]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossEventInjury]'))
ALTER TABLE [Claim].[LossEventInjury] CHECK CONSTRAINT [FK_LossEventSK_LossEventInjury]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_MedicalTreatmentSK_LossEventInjury]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossEventInjury]'))
ALTER TABLE [Claim].[LossEventInjury]  WITH CHECK ADD  CONSTRAINT [FK_MedicalTreatmentSK_LossEventInjury] FOREIGN KEY([MedicalTreatmentSK])
REFERENCES [TypeList].[MedicalTreatment] ([MedicalTreatmentSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_MedicalTreatmentSK_LossEventInjury]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossEventInjury]'))
ALTER TABLE [Claim].[LossEventInjury] CHECK CONSTRAINT [FK_MedicalTreatmentSK_LossEventInjury]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SourceSystemSK_LossEventInjury]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossEventInjury]'))
ALTER TABLE [Claim].[LossEventInjury]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_LossEventInjury] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SourceSystemSK_LossEventInjury]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossEventInjury]'))
ALTER TABLE [Claim].[LossEventInjury] CHECK CONSTRAINT [FK_SourceSystemSK_LossEventInjury]
GO
