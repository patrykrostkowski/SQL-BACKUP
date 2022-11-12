USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[ClaimTransactionType]    Script Date: 12.11.2022 09:01:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TypeList].[ClaimTransactionType]') AND type in (N'U'))
BEGIN
CREATE TABLE [TypeList].[ClaimTransactionType](
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_ClaimTransactionType]') AND parent_object_id = OBJECT_ID(N'[TypeList].[ClaimTransactionType]'))
ALTER TABLE [TypeList].[ClaimTransactionType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClaimTransactionType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_ClaimTransactionType]') AND parent_object_id = OBJECT_ID(N'[TypeList].[ClaimTransactionType]'))
ALTER TABLE [TypeList].[ClaimTransactionType] CHECK CONSTRAINT [FK_SourceSystemSK_ClaimTransactionType]
GO
