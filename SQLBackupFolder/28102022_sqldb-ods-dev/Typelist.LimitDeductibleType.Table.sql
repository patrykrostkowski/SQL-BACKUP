USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[LimitDeductibleType]    Script Date: 28.10.2022 11:10:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[LimitDeductibleType](
	[LimitDeductibleTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[LimitDeductibleTypeCode] [varchar](20) NOT NULL,
	[LimitDeductibleTypeName] [varchar](50) NULL,
 CONSTRAINT [PK_LimitDeductibleType] PRIMARY KEY CLUSTERED 
(
	[LimitDeductibleTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_LimitDeductibleType]    Script Date: 28.10.2022 11:11:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_LimitDeductibleType] ON [Typelist].[LimitDeductibleType]
(
	[SourceSystemSK] ASC,
	[LimitDeductibleTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[LimitDeductibleType]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_LimitDeductibleType] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[LimitDeductibleType] NOCHECK CONSTRAINT [FK_SourceSystemSK_LimitDeductibleType]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Limit Deductible Type  The list of all insurers limits and deductibles' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'LimitDeductibleType'
GO
