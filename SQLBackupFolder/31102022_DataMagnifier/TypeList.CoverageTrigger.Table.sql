USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[CoverageTrigger]    Script Date: 31.10.2022 12:01:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[CoverageTrigger](
	[CoverageTriggerSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[CoverageTriggerCode] [varchar](20) NOT NULL,
	[CoverageTriggerName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CoverageTrigger] PRIMARY KEY CLUSTERED 
(
	[CoverageTriggerSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[CoverageTrigger]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_CoverageTrigger] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[CoverageTrigger] CHECK CONSTRAINT [FK_SourceSystemSK_CoverageTrigger]
GO
