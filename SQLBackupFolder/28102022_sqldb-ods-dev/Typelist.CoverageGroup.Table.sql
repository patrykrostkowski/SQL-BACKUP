USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[CoverageGroup]    Script Date: 28.10.2022 11:10:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[CoverageGroup](
	[CoverageGroupSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[CoverageGroupCode] [varchar](20) NOT NULL,
	[CoverageGroupName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CoverageGroup] PRIMARY KEY CLUSTERED 
(
	[CoverageGroupSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_CoverageGroup]    Script Date: 28.10.2022 11:11:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_CoverageGroup] ON [Typelist].[CoverageGroup]
(
	[SourceSystemSK] ASC,
	[CoverageGroupCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[CoverageGroup]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_CoverageGroup] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[CoverageGroup] NOCHECK CONSTRAINT [FK_SourceSystemSK_CoverageGroup]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A user-defined list of coverage groups' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'CoverageGroup'
GO
