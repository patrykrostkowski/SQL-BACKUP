USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[CauseofLoss]    Script Date: 28.10.2022 15:05:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[CauseofLoss](
	[CauseofLossSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[CauseofLossCode] [varchar](20) NOT NULL,
	[CauseofLossName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CauseofLoss] PRIMARY KEY CLUSTERED 
(
	[CauseofLossSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_CauseofLoss]    Script Date: 28.10.2022 15:06:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_CauseofLoss] ON [Typelist].[CauseofLoss]
(
	[SourceSystemSK] ASC,
	[CauseofLossCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[CauseofLoss]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_CauseofLoss] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[CauseofLoss] NOCHECK CONSTRAINT [FK_SourceSystemSK_CauseofLoss]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'example negligence, hurricane' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'CauseofLoss'
GO
