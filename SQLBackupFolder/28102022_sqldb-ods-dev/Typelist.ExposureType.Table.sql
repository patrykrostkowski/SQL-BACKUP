USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[ExposureType]    Script Date: 28.10.2022 13:37:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[ExposureType](
	[ExposureTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[ExposureTypeCode] [varchar](20) NOT NULL,
	[ExposureTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ExposureType] PRIMARY KEY CLUSTERED 
(
	[ExposureTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_ExposureType]    Script Date: 28.10.2022 13:37:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_ExposureType] ON [Typelist].[ExposureType]
(
	[SourceSystemSK] ASC,
	[ExposureTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[ExposureType]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_ExposureType] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[ExposureType] NOCHECK CONSTRAINT [FK_SourceSystemSK_ExposureType]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'examples annual gross revenue, area, building size, total payroll' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'ExposureType'
GO
