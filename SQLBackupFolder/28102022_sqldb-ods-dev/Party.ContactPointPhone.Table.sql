USE [sqldb-ods-dev]
GO
/****** Object:  Table [Party].[ContactPointPhone]    Script Date: 28.10.2022 15:04:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Party].[ContactPointPhone](
	[ContactPointPhoneSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[ContactPointSK] [int] NOT NULL,
	[PhoneNum] [varchar](20) NOT NULL,
	[PhoneExtension] [varchar](20) NULL,
	[PhoneTypeSK] [int] NULL,
	[IsPrimaryInd] [tinyint] NOT NULL,
 CONSTRAINT [PK_ContactPointPhone] PRIMARY KEY CLUSTERED 
(
	[ContactPointPhoneSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_ContactPointPhone]    Script Date: 28.10.2022 15:06:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_ContactPointPhone] ON [Party].[ContactPointPhone]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Party].[ContactPointPhone]  WITH NOCHECK ADD  CONSTRAINT [FK_ContactPointSK_ContactPointPhone] FOREIGN KEY([ContactPointSK])
REFERENCES [Party].[ContactPoint] ([ContactPointSK])
GO
ALTER TABLE [Party].[ContactPointPhone] NOCHECK CONSTRAINT [FK_ContactPointSK_ContactPointPhone]
GO
ALTER TABLE [Party].[ContactPointPhone]  WITH NOCHECK ADD  CONSTRAINT [FK_PhoneTypeSK_ContactPointPhone] FOREIGN KEY([PhoneTypeSK])
REFERENCES [Typelist].[PhoneType] ([PhoneTypeSK])
GO
ALTER TABLE [Party].[ContactPointPhone] NOCHECK CONSTRAINT [FK_PhoneTypeSK_ContactPointPhone]
GO
ALTER TABLE [Party].[ContactPointPhone]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_ContactPointPhone] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Party].[ContactPointPhone] NOCHECK CONSTRAINT [FK_SourceSystemSK_ContactPointPhone]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This contact point represents one or many  phone numbers as a means of contact.' , @level0type=N'SCHEMA',@level0name=N'Party', @level1type=N'TABLE',@level1name=N'ContactPointPhone'
GO
