USE [DataMagnifier]
GO
/****** Object:  Table [Party].[Person]    Script Date: 02.11.2022 12:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
ALTER TABLE [Party].[Person]  WITH CHECK ADD  CONSTRAINT [FK_DriverLicenseStateSK_Person] FOREIGN KEY([DriverLicenseStateSK])
REFERENCES [TypeList].[State] ([StateSK])
GO
ALTER TABLE [Party].[Person] CHECK CONSTRAINT [FK_DriverLicenseStateSK_Person]
GO
ALTER TABLE [Party].[Person]  WITH CHECK ADD  CONSTRAINT [FK_PartySK_Person] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[Person] CHECK CONSTRAINT [FK_PartySK_Person]
GO
ALTER TABLE [Party].[Person]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_Person] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Party].[Person] CHECK CONSTRAINT [FK_SourceSystemSK_Person]
GO
