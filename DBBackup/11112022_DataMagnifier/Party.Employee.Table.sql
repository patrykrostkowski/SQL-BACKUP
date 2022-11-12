USE [DataMagnifier]
GO
/****** Object:  Table [Party].[Employee]    Script Date: 12.11.2022 09:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Party].[Employee]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_PartySK_Employee]') AND parent_object_id = OBJECT_ID(N'[Party].[Employee]'))
ALTER TABLE [Party].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_PartySK_Employee] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_PartySK_Employee]') AND parent_object_id = OBJECT_ID(N'[Party].[Employee]'))
ALTER TABLE [Party].[Employee] CHECK CONSTRAINT [FK_PartySK_Employee]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_SourceSystemSK_Employee]') AND parent_object_id = OBJECT_ID(N'[Party].[Employee]'))
ALTER TABLE [Party].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_Employee] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_SourceSystemSK_Employee]') AND parent_object_id = OBJECT_ID(N'[Party].[Employee]'))
ALTER TABLE [Party].[Employee] CHECK CONSTRAINT [FK_SourceSystemSK_Employee]
GO
