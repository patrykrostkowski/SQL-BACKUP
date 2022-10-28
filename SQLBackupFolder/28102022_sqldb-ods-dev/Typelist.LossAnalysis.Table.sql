USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[LossAnalysis]    Script Date: 28.10.2022 11:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[LossAnalysis](
	[LossAnalysisSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[LossAnalysisCode] [varchar](20) NOT NULL,
	[LossAnalysisName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LossAnalysis] PRIMARY KEY CLUSTERED 
(
	[LossAnalysisSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_LossAnalysis]    Script Date: 28.10.2022 11:11:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_LossAnalysis] ON [Typelist].[LossAnalysis]
(
	[SourceSystemSK] ASC,
	[LossAnalysisCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[LossAnalysis]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_LossAnalysis] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[LossAnalysis] NOCHECK CONSTRAINT [FK_SourceSystemSK_LossAnalysis]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'examples bodily injury, physical damage, medical payments' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'LossAnalysis'
GO
