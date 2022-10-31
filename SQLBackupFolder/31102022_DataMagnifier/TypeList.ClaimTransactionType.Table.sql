USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[ClaimTransactionType]    Script Date: 31.10.2022 11:58:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
ALTER TABLE [TypeList].[ClaimTransactionType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClaimTransactionType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[ClaimTransactionType] CHECK CONSTRAINT [FK_SourceSystemSK_ClaimTransactionType]
GO
