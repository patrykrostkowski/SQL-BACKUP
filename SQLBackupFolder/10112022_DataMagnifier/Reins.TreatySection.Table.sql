USE [DataMagnifier]
GO
/****** Object:  Table [Reins].[TreatySection]    Script Date: 10.11.2022 13:21:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Reins].[TreatySection](
	[TreatySectionSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](255) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[TreatySK] [int] NOT NULL,
	[TreatySectionNum] [varchar](20) NOT NULL,
	[TreatySectionDesc] [varchar](250) NOT NULL,
	[EffectiveDate] [date] NULL,
	[ExpirationDate] [date] NULL,
	[UnderwritingYear] [int] NULL,
	[ChangeReasonSK] [int] NULL,
	[ClassofBusinessSK] [int] NULL,
	[ReinsuranceCompanySK] [int] NOT NULL,
	[TreatyStatusSK] [int] NULL,
	[CedingCompanySK] [int] NOT NULL,
	[TreatyCoverageSK] [int] NULL,
	[TreatyCategorySK] [int] NULL,
	[BusinessTypeSK] [int] NULL,
	[BrokerSK] [int] NULL,
	[ProgramSK] [int] NULL,
	[TreatyAmt] [decimal](19, 4) NULL,
	[CurrencySK] [int] NOT NULL,
	[TreatyTypeSK] [int] NOT NULL,
	[ParticipationPct] [decimal](8, 2) NULL,
	[OurShareCommissionPct] [decimal](8, 2) NULL,
	[BrokerSharePct] [decimal](8, 2) NULL,
	[ReinstatementPct] [decimal](8, 2) NULL,
	[QuotaSharePct] [decimal](8, 2) NULL,
	[FixedPremiumPct] [decimal](8, 2) NULL,
	[DepositPremiumAmt] [decimal](18, 2) NULL,
	[OurShareDepositPremiumAmt] [decimal](18, 2) NULL,
	[NonProportionalPremiumAmt] [decimal](18, 2) NULL,
	[OurShareNonProportionalPremiumAmt] [decimal](18, 2) NULL,
	[FixedPremiumAmt] [decimal](18, 2) NULL,
	[OurShareAmt] [decimal](18, 2) NULL,
	[ProtectedShareAmt] [decimal](18, 2) NULL,
	[SubpremiumAmt] [decimal](18, 2) NULL,
	[UnderwritingAreaDesc] [varchar](100) NULL,
	[BrokerageBasisDesc] [varchar](100) NULL,
 CONSTRAINT [PK_TreatySection] PRIMARY KEY CLUSTERED 
(
	[TreatySectionSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Reins].[TreatySection]  WITH CHECK ADD  CONSTRAINT [FK_BrokerSK_TreatySection] FOREIGN KEY([BrokerSK])
REFERENCES [Party].[Broker] ([BrokerSK])
GO
ALTER TABLE [Reins].[TreatySection] CHECK CONSTRAINT [FK_BrokerSK_TreatySection]
GO
ALTER TABLE [Reins].[TreatySection]  WITH CHECK ADD  CONSTRAINT [FK_BusinessTypeSK_TreatySection] FOREIGN KEY([BusinessTypeSK])
REFERENCES [TypeList].[BusinessType] ([BusinessTypeSK])
GO
ALTER TABLE [Reins].[TreatySection] CHECK CONSTRAINT [FK_BusinessTypeSK_TreatySection]
GO
ALTER TABLE [Reins].[TreatySection]  WITH CHECK ADD  CONSTRAINT [FK_CedingCompanySK_TreatySection] FOREIGN KEY([CedingCompanySK])
REFERENCES [Party].[WritingCompany] ([WritingCompanySK])
GO
ALTER TABLE [Reins].[TreatySection] CHECK CONSTRAINT [FK_CedingCompanySK_TreatySection]
GO
ALTER TABLE [Reins].[TreatySection]  WITH CHECK ADD  CONSTRAINT [FK_ChangeReasonSK_TreatySection] FOREIGN KEY([ChangeReasonSK])
REFERENCES [TypeList].[Reason] ([ReasonSK])
GO
ALTER TABLE [Reins].[TreatySection] CHECK CONSTRAINT [FK_ChangeReasonSK_TreatySection]
GO
ALTER TABLE [Reins].[TreatySection]  WITH CHECK ADD  CONSTRAINT [FK_ClassofBusinessSK_TreatySection] FOREIGN KEY([ClassofBusinessSK])
REFERENCES [TypeList].[ClassofBusiness] ([ClassofBusinessSK])
GO
ALTER TABLE [Reins].[TreatySection] CHECK CONSTRAINT [FK_ClassofBusinessSK_TreatySection]
GO
ALTER TABLE [Reins].[TreatySection]  WITH CHECK ADD  CONSTRAINT [FK_CurrencySK_TreatySection] FOREIGN KEY([CurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [Reins].[TreatySection] CHECK CONSTRAINT [FK_CurrencySK_TreatySection]
GO
ALTER TABLE [Reins].[TreatySection]  WITH CHECK ADD  CONSTRAINT [FK_ProgramSK_TreatySection] FOREIGN KEY([ProgramSK])
REFERENCES [Policy].[Program] ([ProgramSK])
GO
ALTER TABLE [Reins].[TreatySection] CHECK CONSTRAINT [FK_ProgramSK_TreatySection]
GO
ALTER TABLE [Reins].[TreatySection]  WITH CHECK ADD  CONSTRAINT [FK_ReinsuranceCompanySK_TreatySection] FOREIGN KEY([ReinsuranceCompanySK])
REFERENCES [Party].[ReinsuranceCompany] ([ReinsuranceCompanySK])
GO
ALTER TABLE [Reins].[TreatySection] CHECK CONSTRAINT [FK_ReinsuranceCompanySK_TreatySection]
GO
ALTER TABLE [Reins].[TreatySection]  WITH CHECK ADD  CONSTRAINT [FK_TreatyCategorySK_TreatySection] FOREIGN KEY([TreatyCategorySK])
REFERENCES [TypeList].[TreatyCategory] ([TreatyCategorySK])
GO
ALTER TABLE [Reins].[TreatySection] CHECK CONSTRAINT [FK_TreatyCategorySK_TreatySection]
GO
ALTER TABLE [Reins].[TreatySection]  WITH CHECK ADD  CONSTRAINT [FK_TreatyCoverageSK_TreatySection] FOREIGN KEY([TreatyCoverageSK])
REFERENCES [Policy].[PolicyCoverage] ([PolicyCoverageSK])
GO
ALTER TABLE [Reins].[TreatySection] CHECK CONSTRAINT [FK_TreatyCoverageSK_TreatySection]
GO
ALTER TABLE [Reins].[TreatySection]  WITH CHECK ADD  CONSTRAINT [FK_TreatySK_TreatySection] FOREIGN KEY([TreatySK])
REFERENCES [Reins].[Treaty] ([TreatySK])
GO
ALTER TABLE [Reins].[TreatySection] CHECK CONSTRAINT [FK_TreatySK_TreatySection]
GO
ALTER TABLE [Reins].[TreatySection]  WITH CHECK ADD  CONSTRAINT [FK_TreatyStatusSK_TreatySection] FOREIGN KEY([TreatyStatusSK])
REFERENCES [TypeList].[PolicyStatus] ([PolicyStatusSK])
GO
ALTER TABLE [Reins].[TreatySection] CHECK CONSTRAINT [FK_TreatyStatusSK_TreatySection]
GO
