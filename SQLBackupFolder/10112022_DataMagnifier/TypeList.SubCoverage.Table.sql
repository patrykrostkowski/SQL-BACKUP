USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[SubCoverage]    Script Date: 10.11.2022 12:35:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[SubCoverage](
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
ALTER TABLE [TypeList].[SubCoverage]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_SubCoverage] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[SubCoverage] CHECK CONSTRAINT [FK_SourceSystemSK_SubCoverage]
GO
