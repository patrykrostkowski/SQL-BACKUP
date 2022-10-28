USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[DwellingUsageType]    Script Date: 28.10.2022 15:05:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[DwellingUsageType](
	[DwellingUsageTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[DwellingUsageTypeCode] [varchar](20) NOT NULL,
	[DwellingUsageTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DwellingUsageType] PRIMARY KEY CLUSTERED 
(
	[DwellingUsageTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_DwellingUsageType]    Script Date: 28.10.2022 15:06:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_DwellingUsageType] ON [Typelist].[DwellingUsageType]
(
	[SourceSystemSK] ASC,
	[DwellingUsageTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[DwellingUsageType]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_DwellingUsageType] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[DwellingUsageType] NOCHECK CONSTRAINT [FK_SourceSystemSK_DwellingUsageType]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'examplesprimary, secondary,seasonal,vacant,nonowner' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'DwellingUsageType'
GO
