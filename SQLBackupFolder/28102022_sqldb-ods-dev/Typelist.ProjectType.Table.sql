USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[ProjectType]    Script Date: 28.10.2022 12:27:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[ProjectType](
	[ProjectTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[ProjectTypeCode] [varchar](20) NOT NULL,
	[ProjectTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ProjectType] PRIMARY KEY CLUSTERED 
(
	[ProjectTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_ProjectType]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_ProjectType] ON [Typelist].[ProjectType]
(
	[SourceSystemSK] ASC,
	[ProjectTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[ProjectType]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_ProjectType] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[ProjectType] NOCHECK CONSTRAINT [FK_SourceSystemSK_ProjectType]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'examples design, build,merger, project specific' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'ProjectType'
GO
