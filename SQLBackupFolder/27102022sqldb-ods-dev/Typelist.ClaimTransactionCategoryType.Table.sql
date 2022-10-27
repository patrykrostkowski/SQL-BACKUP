USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[ClaimTransactionCategoryType]    Script Date: 27.10.2022 12:27:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[ClaimTransactionCategoryType](
	[ClaimTransactionCategoryTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[ClaimTransactionCategoryTypeCode] [varchar](20) NOT NULL,
	[ClaimTransactionCategoryTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ClaimTransactionCategory] PRIMARY KEY CLUSTERED 
(
	[ClaimTransactionCategoryTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[ClaimTransactionCategoryType]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClaimTransactionCategory] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[ClaimTransactionCategoryType] NOCHECK CONSTRAINT [FK_SourceSystemSK_ClaimTransactionCategory]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Claim Cost Categories examples hospital, pharmacy, funeral home, other misc.' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'ClaimTransactionCategoryType'
GO
