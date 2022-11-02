USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[BankAccount]    Script Date: 02.11.2022 14:07:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[BankAccount](
	[BankAccountSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[BankAccountCode] [varchar](20) NOT NULL,
	[BankAccountName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_BankAccount] PRIMARY KEY CLUSTERED 
(
	[BankAccountSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[BankAccount]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_BankAccount] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[BankAccount] CHECK CONSTRAINT [FK_SourceSystemSK_BankAccount]
GO
