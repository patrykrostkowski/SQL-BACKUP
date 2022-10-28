USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[SubrogationClosedOutcome]    Script Date: 28.10.2022 15:05:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[SubrogationClosedOutcome](
	[SubrogationClosedOutcomeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SubrogationClosedOutcomeCode] [varchar](20) NOT NULL,
	[SubrogationClosedOutcomeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SubrogationClosedOutcome] PRIMARY KEY CLUSTERED 
(
	[SubrogationClosedOutcomeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_SubrogationClosedOutcome]    Script Date: 28.10.2022 15:06:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_SubrogationClosedOutcome] ON [Typelist].[SubrogationClosedOutcome]
(
	[SourceSystemSK] ASC,
	[SubrogationClosedOutcomeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[SubrogationClosedOutcome]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_SubrogationClosedOutcome] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[SubrogationClosedOutcome] NOCHECK CONSTRAINT [FK_SourceSystemSK_SubrogationClosedOutcome]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'examples full recovery, discontinued, uncollectible' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'SubrogationClosedOutcome'
GO
