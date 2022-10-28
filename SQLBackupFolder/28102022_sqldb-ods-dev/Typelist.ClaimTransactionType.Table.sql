USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[ClaimTransactionType]    Script Date: 28.10.2022 13:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[ClaimTransactionType](
	[ClaimTransactionTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[ClaimTransactionTypeCode] [varchar](20) NOT NULL,
	[ClaimTransactionTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ClaimTransactionType] PRIMARY KEY CLUSTERED 
(
	[ClaimTransactionTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_ClaimTransactionType]    Script Date: 28.10.2022 13:37:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_ClaimTransactionType] ON [Typelist].[ClaimTransactionType]
(
	[SourceSystemSK] ASC,
	[ClaimTransactionTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[ClaimTransactionType]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClaimTransactionType] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[ClaimTransactionType] NOCHECK CONSTRAINT [FK_SourceSystemSK_ClaimTransactionType]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Claim Transaction Types Examples, Payment, Reserve, Recovery, Refund, Reinsurance Cession for loss payments' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'ClaimTransactionType'
GO
