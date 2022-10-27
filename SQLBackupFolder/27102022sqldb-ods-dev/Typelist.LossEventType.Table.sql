USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[LossEventType]    Script Date: 27.10.2022 12:27:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[LossEventType](
	[LossEventTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[LossEventTypeCode] [varchar](20) NOT NULL,
	[LossEventTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LossEventType] PRIMARY KEY CLUSTERED 
(
	[LossEventTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_LossEventType]    Script Date: 27.10.2022 12:28:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_LossEventType] ON [Typelist].[LossEventType]
(
	[SourceSystemSK] ASC,
	[LossEventTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[LossEventType]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_LossEventType] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[LossEventType] NOCHECK CONSTRAINT [FK_SourceSystemSK_LossEventType]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'examples vehicle incident, property incident, lost baggage' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'LossEventType'
GO
