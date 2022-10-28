USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[StatCode]    Script Date: 28.10.2022 12:27:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[StatCode](
	[StatCodeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[StatCode] [varchar](20) NOT NULL,
	[StatCodeName] [varchar](50) NULL,
	[StatCodeDesc] [varchar](255) NULL,
	[IsISOCodeInd] [tinyint] NULL,
 CONSTRAINT [PK_StatCode] PRIMARY KEY CLUSTERED 
(
	[StatCodeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_StatCode]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_StatCode] ON [Typelist].[StatCode]
(
	[SourceSystemSK] ASC,
	[StatCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[StatCode]  WITH NOCHECK ADD  CONSTRAINT [RefSourceSystem1079] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[StatCode] NOCHECK CONSTRAINT [RefSourceSystem1079]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Statistical codes specific to workers Compensation classification codes, are three- or four-digit codes that insurance companies use to estimate rates. Codes are based on the risks associated with each type of work an employee performs.' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'StatCode'
GO
