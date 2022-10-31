USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[ProfitAnalysis]    Script Date: 31.10.2022 12:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[ProfitAnalysis](
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
ALTER TABLE [TypeList].[ProfitAnalysis]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ProfitAnalysis] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[ProfitAnalysis] CHECK CONSTRAINT [FK_SourceSystemSK_ProfitAnalysis]
GO
