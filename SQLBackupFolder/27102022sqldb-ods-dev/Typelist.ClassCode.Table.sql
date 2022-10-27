USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[ClassCode]    Script Date: 27.10.2022 12:27:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[ClassCode](
	[ClassCodeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[ClassCode] [varchar](20) NOT NULL,
	[ClassCodeName] [varchar](50) NULL,
	[ClassCodeDesc] [varchar](255) NULL,
	[IsISOCodeInd] [tinyint] NULL,
 CONSTRAINT [PK_ClassCode] PRIMARY KEY CLUSTERED 
(
	[ClassCodeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_ClassCode]    Script Date: 27.10.2022 12:28:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_ClassCode] ON [Typelist].[ClassCode]
(
	[SourceSystemSK] ASC,
	[ClassCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[ClassCode]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClassCode] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[ClassCode] NOCHECK CONSTRAINT [FK_SourceSystemSK_ClassCode]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ISO industry codes used to estimate risk.  Used for ratings of  risk level based on its industry and the type of insurance and coverages requested' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'ClassCode'
GO
