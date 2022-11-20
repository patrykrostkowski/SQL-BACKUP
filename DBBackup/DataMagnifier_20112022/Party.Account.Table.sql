USE [DataMagnifier]
GO
/****** Object:  Table [Party].[Account]    Script Date: 20.11.2022 14:18:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
ALTER TABLE [Party].[Account]  WITH CHECK ADD  CONSTRAINT [FK_PartySK_Account] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[Account] CHECK CONSTRAINT [FK_PartySK_Account]
GO
