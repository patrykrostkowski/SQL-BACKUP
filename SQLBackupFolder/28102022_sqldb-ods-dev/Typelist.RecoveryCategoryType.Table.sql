USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[RecoveryCategoryType]    Script Date: 28.10.2022 11:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[RecoveryCategoryType](
	[RecoveryCategoryTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[RecoveryCategoryTypeCode] [varchar](20) NOT NULL,
	[RecoveryCategoryTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK322] PRIMARY KEY CLUSTERED 
(
	[RecoveryCategoryTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[RecoveryCategoryType]  WITH NOCHECK ADD  CONSTRAINT [RefSourceSystem1072] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[RecoveryCategoryType] NOCHECK CONSTRAINT [RefSourceSystem1072]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Claim types of recovery categories Examples   Salvage, Subrogation, overpayment, loss contribution, deductibles' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'RecoveryCategoryType'
GO
