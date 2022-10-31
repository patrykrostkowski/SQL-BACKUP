USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[CoverageClass]    Script Date: 31.10.2022 12:06:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[CoverageClass](
	[CoverageClassSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[CoverageClassCode] [varchar](20) NOT NULL,
	[CoverageClassName] [varchar](50) NOT NULL,
	[IsStatCodeInd] [tinyint] NULL,
	[IsJobClassInd] [tinyint] NULL,
 CONSTRAINT [PK_CoverageClass] PRIMARY KEY CLUSTERED 
(
	[CoverageClassSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[CoverageClass]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_CoverageClass] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[CoverageClass] CHECK CONSTRAINT [FK_SourceSystemSK_CoverageClass]
GO
