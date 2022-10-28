USE [sqldb-ods-dev]
GO
/****** Object:  Table [Party].[ContactPointWeb]    Script Date: 28.10.2022 13:36:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Party].[ContactPointWeb](
	[ContactPointWebSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[ContactPointSK] [int] NOT NULL,
	[WebURLName] [varchar](50) NOT NULL,
	[WebURLDesc] [varchar](100) NULL,
	[IsPrimaryInd] [tinyint] NOT NULL,
 CONSTRAINT [PK_ContactPointWeb] PRIMARY KEY CLUSTERED 
(
	[ContactPointWebSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_ContactPointWeb]    Script Date: 28.10.2022 13:37:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_ContactPointWeb] ON [Party].[ContactPointWeb]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Party].[ContactPointWeb]  WITH NOCHECK ADD  CONSTRAINT [FK_ContactPointSK_ContactPointWeb] FOREIGN KEY([ContactPointSK])
REFERENCES [Party].[ContactPoint] ([ContactPointSK])
GO
ALTER TABLE [Party].[ContactPointWeb] NOCHECK CONSTRAINT [FK_ContactPointSK_ContactPointWeb]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This contact point represents one or many  internet web pate links  as a means of contact.' , @level0type=N'SCHEMA',@level0name=N'Party', @level1type=N'TABLE',@level1name=N'ContactPointWeb'
GO
