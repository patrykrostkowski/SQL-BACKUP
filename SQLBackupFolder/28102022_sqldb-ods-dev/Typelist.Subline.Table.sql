USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[Subline]    Script Date: 28.10.2022 13:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[Subline](
	[SublineSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SublineCode] [varchar](20) NOT NULL,
	[SublineName] [varchar](50) NULL,
 CONSTRAINT [PK_Subline] PRIMARY KEY CLUSTERED 
(
	[SublineSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_Subline]    Script Date: 28.10.2022 13:37:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_Subline] ON [Typelist].[Subline]
(
	[SourceSystemSK] ASC,
	[SublineCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[Subline]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_Subline] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[Subline] NOCHECK CONSTRAINT [FK_SourceSystemSK_Subline]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'examples HO3, Family auto…' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'Subline'
GO
