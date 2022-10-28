USE [sqldb-ods-dev]
GO
/****** Object:  Table [Policy].[Driver]    Script Date: 28.10.2022 13:36:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[Driver](
	[DriverSK] [int] IDENTITY(2,1) NOT NULL,
	[SequenceNum] [int] NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[LastName] [varchar](255) NULL,
	[ProcessDateTime] [datetime2](0) NOT NULL,
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
	[IsRestrictedInd] [tinyint] NULL,
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
 CONSTRAINT [PK_Driver] PRIMARY KEY CLUSTERED 
(
	[DriverSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_Driver]    Script Date: 28.10.2022 13:37:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_Driver] ON [Policy].[Driver]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Policy].[Driver]  WITH NOCHECK ADD  CONSTRAINT [FK_DriverLicenseStateSK_Driver] FOREIGN KEY([DriverLicenseStateSK])
REFERENCES [Typelist].[State] ([StateSK])
GO
ALTER TABLE [Policy].[Driver] NOCHECK CONSTRAINT [FK_DriverLicenseStateSK_Driver]
GO
ALTER TABLE [Policy].[Driver]  WITH NOCHECK ADD  CONSTRAINT [FK_DriverRoleTypeSK_Driver] FOREIGN KEY([DriverRoleTypeSK])
REFERENCES [Typelist].[DriverRoleType] ([DriverRoleTypeSK])
GO
ALTER TABLE [Policy].[Driver] NOCHECK CONSTRAINT [FK_DriverRoleTypeSK_Driver]
GO
ALTER TABLE [Policy].[Driver]  WITH NOCHECK ADD  CONSTRAINT [FK_PartySK_Driver] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Policy].[Driver] NOCHECK CONSTRAINT [FK_PartySK_Driver]
GO
ALTER TABLE [Policy].[Driver]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_Driver] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[Driver] NOCHECK CONSTRAINT [FK_SourceSystemSK_Driver]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A person specified as a driver whose  name(s)  appears in the policy and/or policy declarations as a driver, and not as an excluded driver.' , @level0type=N'SCHEMA',@level0name=N'Policy', @level1type=N'TABLE',@level1name=N'Driver'
GO
