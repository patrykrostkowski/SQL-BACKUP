USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[CancellationType]    Script Date: 27.10.2022 12:27:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[CancellationType](
	[CancellationTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[CancellationTypeCode] [varchar](20) NOT NULL,
	[CancellationTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CancellationType] PRIMARY KEY CLUSTERED 
(
	[CancellationTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_CancellationType]    Script Date: 27.10.2022 12:28:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_CancellationType] ON [Typelist].[CancellationType]
(
	[SourceSystemSK] ASC,
	[CancellationTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[CancellationType]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_CancellationType] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[CancellationType] NOCHECK CONSTRAINT [FK_SourceSystemSK_CancellationType]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cancellation Type' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'CancellationType'
GO
