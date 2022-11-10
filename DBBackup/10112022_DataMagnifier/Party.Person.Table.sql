USE [DataMagnifier]
GO
/****** Object:  Table [Party].[Person]    Script Date: 10.11.2022 14:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Party].[Person]') AND type in (N'U'))
BEGIN
CREATE TABLE [Party].[Person](
	[PersonSK] [int] IDENTITY(2,1) NOT NULL,
	[PartySK] [int] NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[DriverLicenseStateSK] [int] NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_DriverLicenseStateSK_Person]') AND parent_object_id = OBJECT_ID(N'[Party].[Person]'))
ALTER TABLE [Party].[Person]  WITH CHECK ADD  CONSTRAINT [FK_DriverLicenseStateSK_Person] FOREIGN KEY([DriverLicenseStateSK])
REFERENCES [TypeList].[State] ([StateSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_DriverLicenseStateSK_Person]') AND parent_object_id = OBJECT_ID(N'[Party].[Person]'))
ALTER TABLE [Party].[Person] CHECK CONSTRAINT [FK_DriverLicenseStateSK_Person]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_PartySK_Person]') AND parent_object_id = OBJECT_ID(N'[Party].[Person]'))
ALTER TABLE [Party].[Person]  WITH CHECK ADD  CONSTRAINT [FK_PartySK_Person] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_PartySK_Person]') AND parent_object_id = OBJECT_ID(N'[Party].[Person]'))
ALTER TABLE [Party].[Person] CHECK CONSTRAINT [FK_PartySK_Person]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_SourceSystemSK_Person]') AND parent_object_id = OBJECT_ID(N'[Party].[Person]'))
ALTER TABLE [Party].[Person]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_Person] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_SourceSystemSK_Person]') AND parent_object_id = OBJECT_ID(N'[Party].[Person]'))
ALTER TABLE [Party].[Person] CHECK CONSTRAINT [FK_SourceSystemSK_Person]
GO
