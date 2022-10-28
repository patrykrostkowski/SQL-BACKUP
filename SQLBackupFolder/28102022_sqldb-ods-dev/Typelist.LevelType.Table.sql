USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[LevelType]    Script Date: 28.10.2022 11:10:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[LevelType](
	[LevelTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[LevelTypeCode] [varchar](20) NOT NULL,
	[LevelTypeName] [varchar](50) NULL,
 CONSTRAINT [PK_LevelType] PRIMARY KEY CLUSTERED 
(
	[LevelTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_LevelType]    Script Date: 28.10.2022 11:11:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_LevelType] ON [Typelist].[LevelType]
(
	[SourceSystemSK] ASC,
	[LevelTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[LevelType]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_LevelType] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[LevelType] NOCHECK CONSTRAINT [FK_SourceSystemSK_LevelType]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Level Type to declare the grain of a limit or deductible or rating plan (ex: Policy,  Coverage, Line of Business, geography…)' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'LevelType'
GO
