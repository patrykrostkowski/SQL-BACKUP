USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[CoverageGroup]    Script Date: 10.11.2022 14:47:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TypeList].[CoverageGroup]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_CoverageGroup]') AND parent_object_id = OBJECT_ID(N'[TypeList].[CoverageGroup]'))
ALTER TABLE [TypeList].[CoverageGroup]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_CoverageGroup] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_CoverageGroup]') AND parent_object_id = OBJECT_ID(N'[TypeList].[CoverageGroup]'))
ALTER TABLE [TypeList].[CoverageGroup] CHECK CONSTRAINT [FK_SourceSystemSK_CoverageGroup]
GO
