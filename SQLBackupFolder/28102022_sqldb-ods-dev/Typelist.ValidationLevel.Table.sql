USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[ValidationLevel]    Script Date: 28.10.2022 11:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[ValidationLevel](
	[ValidationLevelSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[ValidationLevelCode] [varchar](20) NOT NULL,
	[ValidationLevelName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ValidationLevel] PRIMARY KEY CLUSTERED 
(
	[ValidationLevelSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_ValidationLevel]    Script Date: 28.10.2022 11:11:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_ValidationLevel] ON [Typelist].[ValidationLevel]
(
	[SourceSystemSK] ASC,
	[ValidationLevelCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[ValidationLevel]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_ValidationLevel] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[ValidationLevel] NOCHECK CONSTRAINT [FK_SourceSystemSK_ValidationLevel]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The loss occurrence validation level' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'ValidationLevel'
GO
