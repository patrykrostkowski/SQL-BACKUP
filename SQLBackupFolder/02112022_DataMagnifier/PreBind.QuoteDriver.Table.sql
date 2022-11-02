﻿USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteDriver]    Script Date: 02.11.2022 12:46:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteDriver](
	[QuoteDriverSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[SequenceNum] [int] NULL,
	[LastName] [varchar](255) NULL,
	[FirstName] [varchar](255) NULL,
	[FullName] [varchar](255) NULL,
	[PartySK] [int] NULL,
	[DriverRoleTypeSK] [int] NULL,
	[IsPrimaryDriverInd] [tinyint] NOT NULL,
	[GenderCode] [varchar](255) NULL,
	[GenderDesc] [varchar](255) NULL,
	[BirthDate] [date] NULL,
	[DriverLicenseNum] [varchar](50) NULL,
	[LicensePermitNum] [varchar](255) NULL,
	[LicenseEffectiveDate] [date] NULL,
	[DeathDate] [date] NULL,
	[DriverLicenseStateSK] [int] NULL,
	[LicenseTypeCode] [varchar](255) NULL,
	[LicenseTypeDesc] [varchar](255) NULL,
	[LicenseClassCode] [varchar](255) NULL,
	[LicenseClassDesc] [varchar](255) NULL,
	[LicenseStatusCode] [varchar](255) NULL,
	[LicenseStatusDesc] [varchar](255) NULL,
	[MaritalStatusCode] [varchar](255) NULL,
	[MaritalStatusDesc] [varchar](255) NULL,
	[OccupationClassCode] [varchar](255) NULL,
	[TitleRelationshipCode] [varchar](255) NULL,
	[EmployerCode] [varchar](255) NULL,
	[EmployerDesc] [varchar](255) NULL,
	[LengthTimeEmployedNum] [decimal](18, 10) NULL,
	[LengthTimeCurrentOccupationNum] [decimal](18, 10) NULL,
	[LengthTimeWithPreviousEmployerNum] [decimal](18, 10) NULL,
	[IsDoNotSolicitInd] [tinyint] NULL,
	[AssignedRiskReasonCode] [varchar](255) NULL,
	[DriverViolationInformationCode] [varchar](255) NULL,
	[DefensiveDriverDate] [date] NULL,
	[DefensiveDriverExpirationDate] [date] NULL,
	[DefensiveDriverCode] [varchar](255) NULL,
	[IsDistantStudentInd] [tinyint] NULL,
	[IsDriverAssignedRiskInd] [tinyint] NULL,
	[DriverRelationsipToApplicantCode] [varchar](255) NULL,
	[DriverTrainingCompletionDate] [date] NULL,
	[IsDriverTrainingInd] [tinyint] NULL,
	[DriverTypeCode] [varchar](255) NULL,
	[IsGoodDriverInd] [tinyint] NULL,
	[GoodStudentDate] [date] NULL,
	[GoodStudentExpirationDate] [date] NULL,
	[GoodStudentCode] [varchar](255) NULL,
	[MatureDriverDate] [date] NULL,
	[IsMatureDriverInd] [tinyint] NULL,
	[ReinstatementDate] [date] NULL,
	[IsResidentCustodyInd] [tinyint] NULL,
	[IsRestrictedInd] [varchar](255) NULL,
	[SuspensionRevocationDate] [date] NULL,
	[SuspensionRevocationReasonCode] [varchar](255) NULL,
	[OccupationClassDesc] [varchar](255) NULL,
	[TitleRelationshipDesc] [varchar](255) NULL,
	[AssignedRiskReasonDesc] [varchar](255) NULL,
	[DriverViolationInformationDesc] [varchar](255) NULL,
	[DefensiveDriverDesc] [varchar](255) NULL,
	[DriverRelationsipToApplicantDesc] [varchar](255) NULL,
	[DriverTypeDesc] [varchar](255) NULL,
	[GoodStudentDesc] [varchar](255) NULL,
	[SuspensionRevocationReasonDesc] [varchar](255) NULL,
 CONSTRAINT [PK_QuoteDriver] PRIMARY KEY CLUSTERED 
(
	[QuoteDriverSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteDriver]  WITH CHECK ADD  CONSTRAINT [FK_DriverLicenseStateSK_QuoteDriver] FOREIGN KEY([DriverLicenseStateSK])
REFERENCES [TypeList].[State] ([StateSK])
GO
ALTER TABLE [PreBind].[QuoteDriver] CHECK CONSTRAINT [FK_DriverLicenseStateSK_QuoteDriver]
GO
ALTER TABLE [PreBind].[QuoteDriver]  WITH CHECK ADD  CONSTRAINT [FK_DriverRoleTypeSK_QuoteDriver] FOREIGN KEY([DriverRoleTypeSK])
REFERENCES [TypeList].[DriverRoleType] ([DriverRoleTypeSK])
GO
ALTER TABLE [PreBind].[QuoteDriver] CHECK CONSTRAINT [FK_DriverRoleTypeSK_QuoteDriver]
GO
ALTER TABLE [PreBind].[QuoteDriver]  WITH CHECK ADD  CONSTRAINT [FK_PartySK_QuoteDriver] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [PreBind].[QuoteDriver] CHECK CONSTRAINT [FK_PartySK_QuoteDriver]
GO
ALTER TABLE [PreBind].[QuoteDriver]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteDriver] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteDriver] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteDriver]
GO
