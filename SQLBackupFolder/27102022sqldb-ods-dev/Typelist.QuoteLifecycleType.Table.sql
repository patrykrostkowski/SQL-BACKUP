USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[QuoteLifecycleType]    Script Date: 27.10.2022 12:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[QuoteLifecycleType](
	[QuoteLifecycleTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[QuoteLifecycleTypeCode] [varchar](20) NOT NULL,
	[QuoteLifecycleTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_QuoteLifecycleType] PRIMARY KEY CLUSTERED 
(
	[QuoteLifecycleTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_QuoteLifecycleType]    Script Date: 27.10.2022 12:28:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_QuoteLifecycleType] ON [Typelist].[QuoteLifecycleType]
(
	[QuoteLifecycleTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[QuoteLifecycleType]  WITH NOCHECK ADD  CONSTRAINT [RefSourceSystem1076] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[QuoteLifecycleType] NOCHECK CONSTRAINT [RefSourceSystem1076]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'examples cancellation, policy change, renewal rewrite, issued' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'QuoteLifecycleType'
GO
