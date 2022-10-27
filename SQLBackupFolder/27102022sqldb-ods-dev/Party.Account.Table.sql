USE [sqldb-ods-dev]
GO
/****** Object:  Table [Party].[Account]    Script Date: 27.10.2022 12:26:49 ******/
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
	[SourceSystemSK] [int] NOT NULL,
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
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_Account]    Script Date: 27.10.2022 12:28:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_Account] ON [Party].[Account]
(
	[SourceCode] ASC,
	[ProcessDateTime] ASC,
	[SourceSystemSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Party].[Account]  WITH NOCHECK ADD  CONSTRAINT [FK_PartySK_Account] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[Account] NOCHECK CONSTRAINT [FK_PartySK_Account]
GO
ALTER TABLE [Party].[Account]  WITH NOCHECK ADD  CONSTRAINT [RefSourceSystem966] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Party].[Account] NOCHECK CONSTRAINT [RefSourceSystem966]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The party responsible for the Policy Bill Pay.  An Insured may also be identified as an Account Holder' , @level0type=N'SCHEMA',@level0name=N'Party', @level1type=N'TABLE',@level1name=N'Account'
GO
