USE [sqldb-ods-dev]
GO
/****** Object:  Table [Claim].[MedcasehospitalPlan]    Script Date: 28.10.2022 11:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Claim].[MedcasehospitalPlan](
	[MedcasehospitalPlanSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[MedicalCaseSK] [int] NOT NULL,
	[PlanNum] [varchar](20) NULL,
	[PlanStatusCode] [varchar](10) NULL,
	[PlanStatusDesc] [varchar](255) NULL,
	[EffectiveDate] [date] NULL,
	[ExpirationDate] [date] NULL,
	[ApprovalCode] [varchar](255) NULL,
	[ApprovalDesc] [varchar](255) NULL,
	[ConversionSourceCode] [varchar](255) NULL,
	[ConversionSourceDesc] [varchar](255) NULL,
	[ConversionDate] [date] NULL,
	[AdmissionDate] [date] NULL,
	[DischargeDate] [date] NULL,
	[IsSurgeryRequiredInd] [tinyint] NULL,
	[ContactName] [varchar](255) NULL,
	[MedicalProtocolCode] [varchar](255) NULL,
	[MedicalProtocolDesc] [varchar](255) NULL,
	[RequestedAssistantSurgeonCode] [varchar](255) NULL,
	[ApprovedAssistantSurgeoncode] [varchar](255) NULL,
	[RequestedPlaceOfServiceCode] [varchar](255) NULL,
	[RequestedPlaceOfServiceDesc] [varchar](255) NULL,
	[RequestedLengthOfStay] [int] NULL,
	[RequestedWeeksOfTreatment] [int] NULL,
	[RequestedTreatmentsPerWeek] [int] NULL,
	[RequestedNumberOfTreatments] [int] NULL,
	[RequestedModifiedDutyReturntoWorkDate] [date] NULL,
	[RequestedFullDutyReturntoWorkDate] [date] NULL,
	[RequestedPreOpDay] [smallint] NULL,
	[ApprovedPlaceOfServiceCode] [varchar](255) NULL,
	[ApprovedPlaceOfServiceDesc] [varchar](255) NULL,
	[ApprovedLengthOfStay] [int] NULL,
	[ApprovedWeeksOfTreatment] [int] NULL,
	[ApprovedTreatmentsPerWeek] [int] NULL,
	[ApprovedNumberOfTreatments] [int] NULL,
	[ApprovedModifiedDutyReturntoWorkDate] [date] NULL,
	[ApprovedFullDutyReturntoWorkDate] [date] NULL,
	[ApprovedPreOpDay] [smallint] NULL,
	[ApprovedByName] [varchar](255) NULL,
	[ActualAssistantSurgeonCode] [varchar](255) NULL,
	[ActualPlaceOfServiceCode] [varchar](255) NULL,
	[ActualPlaceOfServiceDesc] [varchar](255) NULL,
	[ActualLengthOfStay] [int] NULL,
	[ActualWeeksOfTreatment] [int] NULL,
	[ActualTreatmentsPerWeek] [int] NULL,
	[ActualNumberOfTreatments] [int] NULL,
	[ActualModifiedDutyReturntoWorkDate] [date] NULL,
	[ActualFullDutyReturntoWorkDate] [date] NULL,
 CONSTRAINT [PK_MedcasehospitalPlan] PRIMARY KEY CLUSTERED 
(
	[MedcasehospitalPlanSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_MedcasehospitalPlan]    Script Date: 28.10.2022 11:11:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_MedcasehospitalPlan] ON [Claim].[MedcasehospitalPlan]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Claim].[MedcasehospitalPlan]  WITH NOCHECK ADD  CONSTRAINT [FK_MedicalCaseSK_MedcasehospitalPlan] FOREIGN KEY([MedicalCaseSK])
REFERENCES [Claim].[MedicalCase] ([MedicalCaseSK])
GO
ALTER TABLE [Claim].[MedcasehospitalPlan] NOCHECK CONSTRAINT [FK_MedicalCaseSK_MedcasehospitalPlan]
GO
ALTER TABLE [Claim].[MedcasehospitalPlan]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_MedcasehospitalPlan] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[MedcasehospitalPlan] NOCHECK CONSTRAINT [FK_SourceSystemSK_MedcasehospitalPlan]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the hospital fees of a medical case associated with a claimant' , @level0type=N'SCHEMA',@level0name=N'Claim', @level1type=N'TABLE',@level1name=N'MedcasehospitalPlan'
GO
