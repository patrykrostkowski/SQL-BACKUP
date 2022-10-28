USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[SubCoverage]    Script Date: 28.10.2022 12:27:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[SubCoverage](
	[SubCoverageSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SubCoverageCode] [varchar](20) NOT NULL,
	[SubCoverageName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SubCoverage] PRIMARY KEY CLUSTERED 
(
	[SubCoverageSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_SubCoverage]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_SubCoverage] ON [Typelist].[SubCoverage]
(
	[SourceSystemSK] ASC,
	[SubCoverageCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[SubCoverage]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_SubCoverage] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[SubCoverage] NOCHECK CONSTRAINT [FK_SourceSystemSK_SubCoverage]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'examples auto liability, business loss, equipment breakdown' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'SubCoverage'
GO
