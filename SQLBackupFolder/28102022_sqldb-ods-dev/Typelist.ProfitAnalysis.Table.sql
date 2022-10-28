USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[ProfitAnalysis]    Script Date: 28.10.2022 15:05:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[ProfitAnalysis](
	[ProfitAnalysisSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[ProfitAnalysisCode] [varchar](20) NOT NULL,
	[ProfitAnalysisName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ProfitAnalysis] PRIMARY KEY CLUSTERED 
(
	[ProfitAnalysisSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_ProfitAnalysis]    Script Date: 28.10.2022 15:06:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_ProfitAnalysis] ON [Typelist].[ProfitAnalysis]
(
	[SourceSystemSK] ASC,
	[ProfitAnalysisCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[ProfitAnalysis]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_ProfitAnalysis] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[ProfitAnalysis] NOCHECK CONSTRAINT [FK_SourceSystemSK_ProfitAnalysis]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'examples E&O, commercial property, property E&S' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'ProfitAnalysis'
GO
