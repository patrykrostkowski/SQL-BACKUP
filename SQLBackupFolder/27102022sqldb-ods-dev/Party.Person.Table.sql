USE [sqldb-ods-dev]
GO
/****** Object:  Table [Party].[Person]    Script Date: 27.10.2022 12:26:56 ******/
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
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_Person]    Script Date: 27.10.2022 12:28:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_Person] ON [Party].[Person]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Party].[Person]  WITH NOCHECK ADD  CONSTRAINT [FK_DriverLicenseStateSK_Person] FOREIGN KEY([DriverLicenseStateSK])
REFERENCES [Typelist].[State] ([StateSK])
GO
ALTER TABLE [Party].[Person] NOCHECK CONSTRAINT [FK_DriverLicenseStateSK_Person]
GO
ALTER TABLE [Party].[Person]  WITH NOCHECK ADD  CONSTRAINT [FK_PartySK_Person] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[Person] NOCHECK CONSTRAINT [FK_PartySK_Person]
GO
ALTER TABLE [Party].[Person]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_Person] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Party].[Person] NOCHECK CONSTRAINT [FK_SourceSystemSK_Person]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A Party who''s type is an individual' , @level0type=N'SCHEMA',@level0name=N'Party', @level1type=N'TABLE',@level1name=N'Person'
GO
