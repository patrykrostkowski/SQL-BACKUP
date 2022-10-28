USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[CheckType]    Script Date: 28.10.2022 12:27:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[CheckType](
	[CheckTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[CheckTypeCode] [varchar](20) NOT NULL,
	[CheckTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CheckType] PRIMARY KEY CLUSTERED 
(
	[CheckTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_CheckType]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_CheckType] ON [Typelist].[CheckType]
(
	[SourceSystemSK] ASC,
	[CheckTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[CheckType]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_CheckType] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[CheckType] NOCHECK CONSTRAINT [FK_SourceSystemSK_CheckType]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'example primary, secondary' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'CheckType'
GO
