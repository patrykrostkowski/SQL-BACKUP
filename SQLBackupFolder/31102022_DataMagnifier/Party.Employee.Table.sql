USE [DataMagnifier]
GO
/****** Object:  Table [Party].[Employee]    Script Date: 31.10.2022 12:03:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Party].[Employee](
	[EmployeeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [date] NOT NULL,
	[ETLUpdateDateTime] [date] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[PartySK] [int] NOT NULL,
	[EmployeeNum] [varchar](20) NULL,
	[HireDate] [date] NULL,
	[ServiceDate] [date] NULL,
	[TerminationDate] [date] NULL,
	[DepartmentCode] [varchar](20) NULL,
	[DepartmentDesc] [varchar](255) NULL,
	[EmployeeTypeCode] [varchar](20) NULL,
	[FullTimeInd] [tinyint] NULL,
	[OccupationCode] [varchar](20) NULL,
	[SocialSecurityNum] [varchar](9) NULL,
	[OccupationDesc] [varchar](255) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Party].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_PartySK_Employee] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[Employee] CHECK CONSTRAINT [FK_PartySK_Employee]
GO
ALTER TABLE [Party].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_Employee] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Party].[Employee] CHECK CONSTRAINT [FK_SourceSystemSK_Employee]
GO
