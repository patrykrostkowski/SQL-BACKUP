USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[ContactPointType]    Script Date: 28.10.2022 12:27:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[ContactPointType](
	[ContactPointTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[ContactPointTypeCode] [varchar](20) NOT NULL,
	[ContactPointTypeName] [varchar](50) NULL,
 CONSTRAINT [PK_ContactPointType] PRIMARY KEY CLUSTERED 
(
	[ContactPointTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_ContactPointType]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_ContactPointType] ON [Typelist].[ContactPointType]
(
	[SourceSystemSK] ASC,
	[ContactPointTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[ContactPointType]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_ContactPointType] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[ContactPointType] NOCHECK CONSTRAINT [FK_SourceSystemSK_ContactPointType]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'examples phone, address, web' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'ContactPointType'
GO
