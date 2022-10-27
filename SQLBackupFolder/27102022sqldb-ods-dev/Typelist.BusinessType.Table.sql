USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[BusinessType]    Script Date: 27.10.2022 12:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[BusinessType](
	[BusinessTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[BusinessTypeCode] [varchar](20) NOT NULL,
	[BusinessTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_BusinessType] PRIMARY KEY CLUSTERED 
(
	[BusinessTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_BusinessType]    Script Date: 27.10.2022 12:28:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_BusinessType] ON [Typelist].[BusinessType]
(
	[SourceSystemSK] ASC,
	[BusinessTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[BusinessType]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_BusinessType] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[BusinessType] NOCHECK CONSTRAINT [FK_SourceSystemSK_BusinessType]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'examples direct, ceded, assumed' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'BusinessType'
GO
