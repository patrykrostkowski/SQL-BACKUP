USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[LossOccurrenceType]    Script Date: 28.10.2022 13:37:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[LossOccurrenceType](
	[LossOccurrenceTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[LossOccurrenceTypeCode] [varchar](20) NOT NULL,
	[LossOccurrenceTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LossOccurrenceType] PRIMARY KEY CLUSTERED 
(
	[LossOccurrenceTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_LossOccurrenceType]    Script Date: 28.10.2022 13:37:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_LossOccurrenceType] ON [Typelist].[LossOccurrenceType]
(
	[SourceSystemSK] ASC,
	[LossOccurrenceTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[LossOccurrenceType]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_LossOccurrenceType] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[LossOccurrenceType] NOCHECK CONSTRAINT [FK_SourceSystemSK_LossOccurrenceType]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'examples business income, equipment breakdown, medical payment' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'LossOccurrenceType'
GO
