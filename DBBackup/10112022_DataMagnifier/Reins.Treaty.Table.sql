USE [DataMagnifier]
GO
/****** Object:  Table [Reins].[Treaty]    Script Date: 10.11.2022 14:36:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Reins].[Treaty]') AND type in (N'U'))
BEGIN
CREATE TABLE [Reins].[Treaty](
	[TreatySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](255) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[TreatyName] [varchar](60) NOT NULL,
	[TreatyNum] [varchar](20) NOT NULL,
	[TreatyDesc] [varchar](250) NOT NULL,
	[EffectiveDate] [date] NULL,
	[ExpirationDate] [date] NULL,
	[UnderwritingYear] [int] NULL,
	[TreatyAmt] [decimal](19, 4) NULL,
	[CurrencySK] [int] NOT NULL,
	[TreatyTypeSK] [int] NOT NULL,
	[TreatyStatusSK] [int] NOT NULL,
	[ClassofBusinessSK] [int] NULL,
	[ReinsuranceCompanySK] [int] NOT NULL,
	[CedingCompanySK] [int] NOT NULL,
	[TreatyCoverageSK] [int] NULL,
	[TreatyCategorySK] [int] NULL,
	[BusinessTypeSK] [int] NULL,
	[BrokerSK] [int] NOT NULL,
	[ProgramSK] [int] NULL,
 CONSTRAINT [PK_Treaty] PRIMARY KEY CLUSTERED 
(
	[TreatySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Reins].[FK_BrokerSK_Treaty]') AND parent_object_id = OBJECT_ID(N'[Reins].[Treaty]'))
ALTER TABLE [Reins].[Treaty]  WITH CHECK ADD  CONSTRAINT [FK_BrokerSK_Treaty] FOREIGN KEY([BrokerSK])
REFERENCES [Party].[Broker] ([BrokerSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Reins].[FK_BrokerSK_Treaty]') AND parent_object_id = OBJECT_ID(N'[Reins].[Treaty]'))
ALTER TABLE [Reins].[Treaty] CHECK CONSTRAINT [FK_BrokerSK_Treaty]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Reins].[FK_BusinessTypeSK_Treaty]') AND parent_object_id = OBJECT_ID(N'[Reins].[Treaty]'))
ALTER TABLE [Reins].[Treaty]  WITH CHECK ADD  CONSTRAINT [FK_BusinessTypeSK_Treaty] FOREIGN KEY([BusinessTypeSK])
REFERENCES [TypeList].[BusinessType] ([BusinessTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Reins].[FK_BusinessTypeSK_Treaty]') AND parent_object_id = OBJECT_ID(N'[Reins].[Treaty]'))
ALTER TABLE [Reins].[Treaty] CHECK CONSTRAINT [FK_BusinessTypeSK_Treaty]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Reins].[FK_CedingCompanySK_Treaty]') AND parent_object_id = OBJECT_ID(N'[Reins].[Treaty]'))
ALTER TABLE [Reins].[Treaty]  WITH CHECK ADD  CONSTRAINT [FK_CedingCompanySK_Treaty] FOREIGN KEY([CedingCompanySK])
REFERENCES [Party].[WritingCompany] ([WritingCompanySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Reins].[FK_CedingCompanySK_Treaty]') AND parent_object_id = OBJECT_ID(N'[Reins].[Treaty]'))
ALTER TABLE [Reins].[Treaty] CHECK CONSTRAINT [FK_CedingCompanySK_Treaty]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Reins].[FK_ClassofBusinessSK_Treaty]') AND parent_object_id = OBJECT_ID(N'[Reins].[Treaty]'))
ALTER TABLE [Reins].[Treaty]  WITH CHECK ADD  CONSTRAINT [FK_ClassofBusinessSK_Treaty] FOREIGN KEY([ClassofBusinessSK])
REFERENCES [TypeList].[ClassofBusiness] ([ClassofBusinessSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Reins].[FK_ClassofBusinessSK_Treaty]') AND parent_object_id = OBJECT_ID(N'[Reins].[Treaty]'))
ALTER TABLE [Reins].[Treaty] CHECK CONSTRAINT [FK_ClassofBusinessSK_Treaty]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Reins].[FK_CurrencySK_Treaty]') AND parent_object_id = OBJECT_ID(N'[Reins].[Treaty]'))
ALTER TABLE [Reins].[Treaty]  WITH CHECK ADD  CONSTRAINT [FK_CurrencySK_Treaty] FOREIGN KEY([CurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Reins].[FK_CurrencySK_Treaty]') AND parent_object_id = OBJECT_ID(N'[Reins].[Treaty]'))
ALTER TABLE [Reins].[Treaty] CHECK CONSTRAINT [FK_CurrencySK_Treaty]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Reins].[FK_ProgramSK_Treaty]') AND parent_object_id = OBJECT_ID(N'[Reins].[Treaty]'))
ALTER TABLE [Reins].[Treaty]  WITH CHECK ADD  CONSTRAINT [FK_ProgramSK_Treaty] FOREIGN KEY([ProgramSK])
REFERENCES [Policy].[Program] ([ProgramSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Reins].[FK_ProgramSK_Treaty]') AND parent_object_id = OBJECT_ID(N'[Reins].[Treaty]'))
ALTER TABLE [Reins].[Treaty] CHECK CONSTRAINT [FK_ProgramSK_Treaty]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Reins].[FK_ReinsuranceCompanySK_Treaty]') AND parent_object_id = OBJECT_ID(N'[Reins].[Treaty]'))
ALTER TABLE [Reins].[Treaty]  WITH CHECK ADD  CONSTRAINT [FK_ReinsuranceCompanySK_Treaty] FOREIGN KEY([ReinsuranceCompanySK])
REFERENCES [Party].[ReinsuranceCompany] ([ReinsuranceCompanySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Reins].[FK_ReinsuranceCompanySK_Treaty]') AND parent_object_id = OBJECT_ID(N'[Reins].[Treaty]'))
ALTER TABLE [Reins].[Treaty] CHECK CONSTRAINT [FK_ReinsuranceCompanySK_Treaty]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Reins].[FK_TreatyCategorySK_Treaty]') AND parent_object_id = OBJECT_ID(N'[Reins].[Treaty]'))
ALTER TABLE [Reins].[Treaty]  WITH CHECK ADD  CONSTRAINT [FK_TreatyCategorySK_Treaty] FOREIGN KEY([TreatyCategorySK])
REFERENCES [TypeList].[TreatyCategory] ([TreatyCategorySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Reins].[FK_TreatyCategorySK_Treaty]') AND parent_object_id = OBJECT_ID(N'[Reins].[Treaty]'))
ALTER TABLE [Reins].[Treaty] CHECK CONSTRAINT [FK_TreatyCategorySK_Treaty]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Reins].[FK_TreatyCoverageSK_Treaty]') AND parent_object_id = OBJECT_ID(N'[Reins].[Treaty]'))
ALTER TABLE [Reins].[Treaty]  WITH CHECK ADD  CONSTRAINT [FK_TreatyCoverageSK_Treaty] FOREIGN KEY([TreatyCoverageSK])
REFERENCES [Policy].[PolicyCoverage] ([PolicyCoverageSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Reins].[FK_TreatyCoverageSK_Treaty]') AND parent_object_id = OBJECT_ID(N'[Reins].[Treaty]'))
ALTER TABLE [Reins].[Treaty] CHECK CONSTRAINT [FK_TreatyCoverageSK_Treaty]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Reins].[FK_TreatyStatusSK_Treaty]') AND parent_object_id = OBJECT_ID(N'[Reins].[Treaty]'))
ALTER TABLE [Reins].[Treaty]  WITH CHECK ADD  CONSTRAINT [FK_TreatyStatusSK_Treaty] FOREIGN KEY([TreatyStatusSK])
REFERENCES [TypeList].[PolicyStatus] ([PolicyStatusSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Reins].[FK_TreatyStatusSK_Treaty]') AND parent_object_id = OBJECT_ID(N'[Reins].[Treaty]'))
ALTER TABLE [Reins].[Treaty] CHECK CONSTRAINT [FK_TreatyStatusSK_Treaty]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Reins].[FK_TreatyTypeSK_Treaty]') AND parent_object_id = OBJECT_ID(N'[Reins].[Treaty]'))
ALTER TABLE [Reins].[Treaty]  WITH CHECK ADD  CONSTRAINT [FK_TreatyTypeSK_Treaty] FOREIGN KEY([TreatyTypeSK])
REFERENCES [TypeList].[PolicyType] ([PolicyTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Reins].[FK_TreatyTypeSK_Treaty]') AND parent_object_id = OBJECT_ID(N'[Reins].[Treaty]'))
ALTER TABLE [Reins].[Treaty] CHECK CONSTRAINT [FK_TreatyTypeSK_Treaty]
GO
