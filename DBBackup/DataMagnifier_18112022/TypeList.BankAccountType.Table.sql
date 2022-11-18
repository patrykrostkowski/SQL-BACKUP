USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[BankAccountType]    Script Date: 18.11.2022 16:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[BankAccountType](
	[BankAccountTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[BankAccountTypeCode] [varchar](20) NOT NULL,
	[BankAccountTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_BankAccountType] PRIMARY KEY CLUSTERED 
(
	[BankAccountTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[BankAccountType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_BankAccountType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[BankAccountType] CHECK CONSTRAINT [FK_SourceSystemSK_BankAccountType]
GO
