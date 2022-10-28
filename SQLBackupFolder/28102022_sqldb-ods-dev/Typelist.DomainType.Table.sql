USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[DomainType]    Script Date: 28.10.2022 12:27:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[DomainType](
	[DomainTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[DomainTypeCode] [varchar](25) NULL,
	[DomainTypeName] [varchar](50) NOT NULL,
	[DomainTypeFormat] [varchar](20) NULL,
 CONSTRAINT [PK_DomainType] PRIMARY KEY CLUSTERED 
(
	[DomainTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_DomainType]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_DomainType] ON [Typelist].[DomainType]
(
	[SourceSystemSK] ASC,
	[DomainTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[DomainType]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_DomainType] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[DomainType] NOCHECK CONSTRAINT [FK_SourceSystemSK_DomainType]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'example  integer, multi-choice, text.   Used to identify survey question responses' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'DomainType'
GO
