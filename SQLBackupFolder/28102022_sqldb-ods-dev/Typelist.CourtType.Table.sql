USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[CourtType]    Script Date: 28.10.2022 11:10:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[CourtType](
	[CourtTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[CourtTypeCode] [varchar](20) NOT NULL,
	[CourtTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CourtType] PRIMARY KEY CLUSTERED 
(
	[CourtTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_CourtType]    Script Date: 28.10.2022 11:11:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_CourtType] ON [Typelist].[CourtType]
(
	[SourceSystemSK] ASC,
	[CourtTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[CourtType]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_CourtType] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[CourtType] NOCHECK CONSTRAINT [FK_SourceSystemSK_CourtType]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'examples hearing, us district court, supreme court' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'CourtType'
GO
