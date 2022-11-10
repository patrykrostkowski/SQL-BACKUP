USE [DataMagnifier]
GO
/****** Object:  Table [Party].[Account]    Script Date: 10.11.2022 14:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Party].[Account]') AND type in (N'U'))
BEGIN
CREATE TABLE [Party].[Account](
	[AccountSK] [int] IDENTITY(2,1) NOT NULL,
	[PartySK] [int] NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[AccountNum] [varchar](13) NOT NULL,
	[EffectiveDate] [date] NOT NULL,
	[AccountName] [varchar](90) NOT NULL,
	[PrimaryContactFullName] [varchar](90) NULL,
	[PrimaryPhoneNum] [varchar](12) NULL,
	[IsAccountBillInd] [tinyint] NOT NULL,
	[BankName] [varchar](25) NULL,
	[BankRoutingNum] [varchar](25) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_PartySK_Account]') AND parent_object_id = OBJECT_ID(N'[Party].[Account]'))
ALTER TABLE [Party].[Account]  WITH CHECK ADD  CONSTRAINT [FK_PartySK_Account] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_PartySK_Account]') AND parent_object_id = OBJECT_ID(N'[Party].[Account]'))
ALTER TABLE [Party].[Account] CHECK CONSTRAINT [FK_PartySK_Account]
GO
