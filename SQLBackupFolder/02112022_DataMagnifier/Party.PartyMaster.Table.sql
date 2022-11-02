USE [DataMagnifier]
GO
/****** Object:  Table [Party].[PartyMaster]    Script Date: 02.11.2022 13:09:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Party].[PartyMaster](
	[PartySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[SourceMasterNum] [varchar](20) NULL,
	[PartyTypeSK] [int] NOT NULL,
	[PartyReferenceDesc] [varchar](50) NULL,
	[FirstName] [varchar](255) NULL,
	[MiddleName] [varchar](255) NULL,
	[LastName] [varchar](255) NULL,
	[FullName] [varchar](50) NULL,
	[GenderCode] [varchar](20) NOT NULL,
	[MaritalStatusCode] [varchar](20) NOT NULL,
	[BirthDate] [date] NULL,
	[SocialSecurityNum] [varchar](9) NULL,
	[OccupationDesc] [varchar](50) NULL,
	[DriverLicenseNum] [varchar](30) NULL,
	[DriverLicenseStateSK] [int] NULL,
	[OrganizationName] [varchar](255) NULL,
	[LegalName] [varchar](255) NULL,
	[FEINNum] [varchar](9) NULL,
	[DBAName] [varchar](50) NULL,
	[ContactFirstName] [varchar](50) NULL,
	[ContactMiddleName] [varchar](50) NULL,
	[ContactLastName] [varchar](50) NULL,
	[Contact	Full	Name] [varchar](100) NULL,
	[TaxIdNum] [varchar](20) NULL,
	[SICCode] [varchar](20) NULL,
	[SICDesc] [varchar](100) NULL,
	[NorthAmericanIndustryClassificationCode] [varchar](25) NULL,
	[NorthAmericanIndustryClassificationDesc] [varchar](50) NULL,
	[OwnershipTypeSK] [int] NULL,
 CONSTRAINT [PK_PartyMaster] PRIMARY KEY CLUSTERED 
(
	[PartySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Party].[PartyMaster]  WITH CHECK ADD  CONSTRAINT [FK_DriverLicenseStateSK_PartyMaster] FOREIGN KEY([DriverLicenseStateSK])
REFERENCES [TypeList].[State] ([StateSK])
GO
ALTER TABLE [Party].[PartyMaster] CHECK CONSTRAINT [FK_DriverLicenseStateSK_PartyMaster]
GO
ALTER TABLE [Party].[PartyMaster]  WITH CHECK ADD  CONSTRAINT [FK_OwnershipTypeSK_PartyMaster] FOREIGN KEY([OwnershipTypeSK])
REFERENCES [TypeList].[OwnershipType] ([OwnershipTypeSK])
GO
ALTER TABLE [Party].[PartyMaster] CHECK CONSTRAINT [FK_OwnershipTypeSK_PartyMaster]
GO
ALTER TABLE [Party].[PartyMaster]  WITH CHECK ADD  CONSTRAINT [FK_PartyTypeSK_PartyMaster] FOREIGN KEY([PartyTypeSK])
REFERENCES [TypeList].[PartyType] ([PartyTypeSK])
GO
ALTER TABLE [Party].[PartyMaster] CHECK CONSTRAINT [FK_PartyTypeSK_PartyMaster]
GO
ALTER TABLE [Party].[PartyMaster]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PartyMaster] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Party].[PartyMaster] CHECK CONSTRAINT [FK_SourceSystemSK_PartyMaster]
GO
