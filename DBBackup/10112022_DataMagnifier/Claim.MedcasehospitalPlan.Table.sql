USE [DataMagnifier]
GO
/****** Object:  Table [Claim].[MedcasehospitalPlan]    Script Date: 10.11.2022 14:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Claim].[MedcasehospitalPlan]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_MedicalCaseSK_MedcasehospitalPlan]') AND parent_object_id = OBJECT_ID(N'[Claim].[MedcasehospitalPlan]'))
ALTER TABLE [Claim].[MedcasehospitalPlan]  WITH CHECK ADD  CONSTRAINT [FK_MedicalCaseSK_MedcasehospitalPlan] FOREIGN KEY([MedicalCaseSK])
REFERENCES [Claim].[MedicalCase] ([MedicalCaseSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_MedicalCaseSK_MedcasehospitalPlan]') AND parent_object_id = OBJECT_ID(N'[Claim].[MedcasehospitalPlan]'))
ALTER TABLE [Claim].[MedcasehospitalPlan] CHECK CONSTRAINT [FK_MedicalCaseSK_MedcasehospitalPlan]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SourceSystemSK_MedcasehospitalPlan]') AND parent_object_id = OBJECT_ID(N'[Claim].[MedcasehospitalPlan]'))
ALTER TABLE [Claim].[MedcasehospitalPlan]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_MedcasehospitalPlan] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SourceSystemSK_MedcasehospitalPlan]') AND parent_object_id = OBJECT_ID(N'[Claim].[MedcasehospitalPlan]'))
ALTER TABLE [Claim].[MedcasehospitalPlan] CHECK CONSTRAINT [FK_SourceSystemSK_MedcasehospitalPlan]
GO
