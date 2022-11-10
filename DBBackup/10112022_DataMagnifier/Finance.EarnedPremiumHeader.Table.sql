USE [DataMagnifier]
GO
/****** Object:  Table [Finance].[EarnedPremiumHeader]    Script Date: 10.11.2022 14:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Finance].[EarnedPremiumHeader]') AND type in (N'U'))
BEGIN
CREATE TABLE [Finance].[EarnedPremiumHeader](
	[EarnedPremiumHeaderSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PolicySK] [int] NOT NULL,
	[CurrencySK] [int] NOT NULL,
	[PremiumTypeSK] [int] NOT NULL,
	[UnderwritingYear] [varchar](4) NULL,
	[TransactionHeaderAmt] [decimal](18, 2) NULL,
 CONSTRAINT [PK_EarnedPremiumHeader] PRIMARY KEY CLUSTERED 
(
	[EarnedPremiumHeaderSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[SourceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_CurrencySK_EarnedPremiumHeader]') AND parent_object_id = OBJECT_ID(N'[Finance].[EarnedPremiumHeader]'))
ALTER TABLE [Finance].[EarnedPremiumHeader]  WITH CHECK ADD  CONSTRAINT [FK_CurrencySK_EarnedPremiumHeader] FOREIGN KEY([CurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_CurrencySK_EarnedPremiumHeader]') AND parent_object_id = OBJECT_ID(N'[Finance].[EarnedPremiumHeader]'))
ALTER TABLE [Finance].[EarnedPremiumHeader] CHECK CONSTRAINT [FK_CurrencySK_EarnedPremiumHeader]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PolicySK_EarnedPremiumHeader]') AND parent_object_id = OBJECT_ID(N'[Finance].[EarnedPremiumHeader]'))
ALTER TABLE [Finance].[EarnedPremiumHeader]  WITH CHECK ADD  CONSTRAINT [FK_PolicySK_EarnedPremiumHeader] FOREIGN KEY([PolicySK])
REFERENCES [Policy].[Policy] ([PolicySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PolicySK_EarnedPremiumHeader]') AND parent_object_id = OBJECT_ID(N'[Finance].[EarnedPremiumHeader]'))
ALTER TABLE [Finance].[EarnedPremiumHeader] CHECK CONSTRAINT [FK_PolicySK_EarnedPremiumHeader]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PremiumTypeSK_EarnedPremiumHeader]') AND parent_object_id = OBJECT_ID(N'[Finance].[EarnedPremiumHeader]'))
ALTER TABLE [Finance].[EarnedPremiumHeader]  WITH CHECK ADD  CONSTRAINT [FK_PremiumTypeSK_EarnedPremiumHeader] FOREIGN KEY([PremiumTypeSK])
REFERENCES [TypeList].[PremiumType] ([PremiumTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PremiumTypeSK_EarnedPremiumHeader]') AND parent_object_id = OBJECT_ID(N'[Finance].[EarnedPremiumHeader]'))
ALTER TABLE [Finance].[EarnedPremiumHeader] CHECK CONSTRAINT [FK_PremiumTypeSK_EarnedPremiumHeader]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_SourceSystemSK_EarnedPremiumHeader]') AND parent_object_id = OBJECT_ID(N'[Finance].[EarnedPremiumHeader]'))
ALTER TABLE [Finance].[EarnedPremiumHeader]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_EarnedPremiumHeader] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_SourceSystemSK_EarnedPremiumHeader]') AND parent_object_id = OBJECT_ID(N'[Finance].[EarnedPremiumHeader]'))
ALTER TABLE [Finance].[EarnedPremiumHeader] CHECK CONSTRAINT [FK_SourceSystemSK_EarnedPremiumHeader]
GO
