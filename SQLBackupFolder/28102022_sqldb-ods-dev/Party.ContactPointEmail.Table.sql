USE [sqldb-ods-dev]
GO
/****** Object:  Table [Party].[ContactPointEmail]    Script Date: 28.10.2022 11:09:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Party].[ContactPointEmail](
	[ContactPointEmailSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NULL,
	[ContactPointSK] [int] NOT NULL,
	[EmailAddress] [varchar](50) NOT NULL,
	[IsPrimaryInd] [tinyint] NOT NULL,
 CONSTRAINT [PK_ContactPointEmail] PRIMARY KEY CLUSTERED 
(
	[ContactPointEmailSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_ContactPointEmail]    Script Date: 28.10.2022 11:11:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_ContactPointEmail] ON [Party].[ContactPointEmail]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Party].[ContactPointEmail]  WITH NOCHECK ADD  CONSTRAINT [FK_ContactPointSK_ContactPointEmail] FOREIGN KEY([ContactPointSK])
REFERENCES [Party].[ContactPoint] ([ContactPointSK])
GO
ALTER TABLE [Party].[ContactPointEmail] NOCHECK CONSTRAINT [FK_ContactPointSK_ContactPointEmail]
GO
ALTER TABLE [Party].[ContactPointEmail]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_ContactPointEmail] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Party].[ContactPointEmail] NOCHECK CONSTRAINT [FK_SourceSystemSK_ContactPointEmail]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This contact point represents one or many  email address as a means of contact.' , @level0type=N'SCHEMA',@level0name=N'Party', @level1type=N'TABLE',@level1name=N'ContactPointEmail'
GO
