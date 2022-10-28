USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[CoverageFeeType]    Script Date: 28.10.2022 11:10:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[CoverageFeeType](
	[CoverageFeeTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[CoverageFeeTypeCode] [varchar](20) NOT NULL,
	[CoverageFeeTypeName] [varchar](50) NULL,
 CONSTRAINT [PK_CoverageFeeType] PRIMARY KEY CLUSTERED 
(
	[CoverageFeeTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_CoverageFeeType]    Script Date: 28.10.2022 11:11:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_CoverageFeeType] ON [Typelist].[CoverageFeeType]
(
	[SourceSystemSK] ASC,
	[CoverageFeeTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[CoverageFeeType]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_CoverageFeeType] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[CoverageFeeType] NOCHECK CONSTRAINT [FK_SourceSystemSK_CoverageFeeType]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A user-defined list of premium or non-premium bearing taxes, fees or surcharges' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'CoverageFeeType'
GO
