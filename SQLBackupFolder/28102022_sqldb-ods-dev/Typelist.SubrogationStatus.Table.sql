USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[SubrogationStatus]    Script Date: 28.10.2022 13:37:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[SubrogationStatus](
	[SubrogationStatusSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SubrogationStatusCode] [varchar](20) NOT NULL,
	[SubrogationStatusName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SubrogationStatus] PRIMARY KEY CLUSTERED 
(
	[SubrogationStatusSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_SubrogationStatus]    Script Date: 28.10.2022 13:37:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_SubrogationStatus] ON [Typelist].[SubrogationStatus]
(
	[SourceSystemSK] ASC,
	[SubrogationStatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[SubrogationStatus]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_SubrogationStatus] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[SubrogationStatus] NOCHECK CONSTRAINT [FK_SourceSystemSK_SubrogationStatus]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'examples open, closed, in review' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'SubrogationStatus'
GO
