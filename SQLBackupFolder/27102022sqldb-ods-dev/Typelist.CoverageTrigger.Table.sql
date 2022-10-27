USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[CoverageTrigger]    Script Date: 27.10.2022 12:27:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[CoverageTrigger](
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
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_CoverageTrigger]    Script Date: 27.10.2022 12:28:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_CoverageTrigger] ON [Typelist].[CoverageTrigger]
(
	[SourceSystemSK] ASC,
	[CoverageTriggerCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[CoverageTrigger]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_CoverageTrigger] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[CoverageTrigger] NOCHECK CONSTRAINT [FK_SourceSystemSK_CoverageTrigger]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N' Coverage Trigger represents the event that must occur before a particular liability policy applies to a given loss. Under an per occurrence policy, the occurrence of injury or damage is the trigger; liability will be covered under that policy if the injury or damage occurred during the policy period. Under a claims-made policy, the making of a claim triggers coverage. Coverage triggers serve to determine which liability policy in a series of policies covers a particular loss.  examples claims made, loss occurrence' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'CoverageTrigger'
GO
