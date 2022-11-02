USE [DataMagnifier]
GO
/****** Object:  Table [Finance].[EarnedPremiumHeader]    Script Date: 02.11.2022 14:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
ALTER TABLE [Finance].[EarnedPremiumHeader]  WITH CHECK ADD  CONSTRAINT [FK_CurrencySK_EarnedPremiumHeader] FOREIGN KEY([CurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[EarnedPremiumHeader] CHECK CONSTRAINT [FK_CurrencySK_EarnedPremiumHeader]
GO
ALTER TABLE [Finance].[EarnedPremiumHeader]  WITH CHECK ADD  CONSTRAINT [FK_PolicySK_EarnedPremiumHeader] FOREIGN KEY([PolicySK])
REFERENCES [Policy].[Policy] ([PolicySK])
GO
ALTER TABLE [Finance].[EarnedPremiumHeader] CHECK CONSTRAINT [FK_PolicySK_EarnedPremiumHeader]
GO
ALTER TABLE [Finance].[EarnedPremiumHeader]  WITH CHECK ADD  CONSTRAINT [FK_PremiumTypeSK_EarnedPremiumHeader] FOREIGN KEY([PremiumTypeSK])
REFERENCES [TypeList].[PremiumType] ([PremiumTypeSK])
GO
ALTER TABLE [Finance].[EarnedPremiumHeader] CHECK CONSTRAINT [FK_PremiumTypeSK_EarnedPremiumHeader]
GO
ALTER TABLE [Finance].[EarnedPremiumHeader]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_EarnedPremiumHeader] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Finance].[EarnedPremiumHeader] CHECK CONSTRAINT [FK_SourceSystemSK_EarnedPremiumHeader]
GO
