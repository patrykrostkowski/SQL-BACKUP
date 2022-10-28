USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[ClassofBusiness]    Script Date: 28.10.2022 11:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[ClassofBusiness](
	[ClassofBusinessSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[ClassofBusinessCode] [varchar](20) NOT NULL,
	[ClassofBusinessName] [varchar](50) NULL,
 CONSTRAINT [PK_ClassofBusiness] PRIMARY KEY CLUSTERED 
(
	[ClassofBusinessSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_ClassofBusiness]    Script Date: 28.10.2022 11:11:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_ClassofBusiness] ON [Typelist].[ClassofBusiness]
(
	[SourceSystemSK] ASC,
	[ClassofBusinessCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[ClassofBusiness]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClassofBusiness] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[ClassofBusiness] NOCHECK CONSTRAINT [FK_SourceSystemSK_ClassofBusiness]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'examples, cyber, general libility, wholesale' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'ClassofBusiness'
GO
