USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[CoverageGroup]    Script Date: 02.11.2022 09:13:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[CoverageGroup](
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
ALTER TABLE [TypeList].[CoverageGroup]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_CoverageGroup] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[CoverageGroup] CHECK CONSTRAINT [FK_SourceSystemSK_CoverageGroup]
GO
