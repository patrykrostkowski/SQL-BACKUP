USE [sqldb-ods-dev]
GO
/****** Object:  Table [Reins].[Treaty]    Script Date: 28.10.2022 11:10:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
	[TreatyEffectiveDate] [date] NULL,
	[TreatyExpirationDate] [date] NULL,
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
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_Treaty]    Script Date: 28.10.2022 11:11:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_Treaty] ON [Reins].[Treaty]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Reins].[Treaty]  WITH NOCHECK ADD  CONSTRAINT [FK_BrokerSK_Treaty] FOREIGN KEY([BrokerSK])
REFERENCES [Party].[Broker] ([BrokerSK])
GO
ALTER TABLE [Reins].[Treaty] NOCHECK CONSTRAINT [FK_BrokerSK_Treaty]
GO
ALTER TABLE [Reins].[Treaty]  WITH NOCHECK ADD  CONSTRAINT [FK_BusinessTypeSK_Treaty] FOREIGN KEY([BusinessTypeSK])
REFERENCES [Typelist].[BusinessType] ([BusinessTypeSK])
GO
ALTER TABLE [Reins].[Treaty] NOCHECK CONSTRAINT [FK_BusinessTypeSK_Treaty]
GO
ALTER TABLE [Reins].[Treaty]  WITH NOCHECK ADD  CONSTRAINT [FK_CedingCompanySK_Treaty] FOREIGN KEY([CedingCompanySK])
REFERENCES [Party].[WritingCompany] ([WritingCompanySK])
GO
ALTER TABLE [Reins].[Treaty] NOCHECK CONSTRAINT [FK_CedingCompanySK_Treaty]
GO
ALTER TABLE [Reins].[Treaty]  WITH NOCHECK ADD  CONSTRAINT [FK_ClassofBusinessSK_Treaty] FOREIGN KEY([ClassofBusinessSK])
REFERENCES [Typelist].[ClassofBusiness] ([ClassofBusinessSK])
GO
ALTER TABLE [Reins].[Treaty] NOCHECK CONSTRAINT [FK_ClassofBusinessSK_Treaty]
GO
ALTER TABLE [Reins].[Treaty]  WITH NOCHECK ADD  CONSTRAINT [FK_CurrencySK_Treaty] FOREIGN KEY([CurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Reins].[Treaty] NOCHECK CONSTRAINT [FK_CurrencySK_Treaty]
GO
ALTER TABLE [Reins].[Treaty]  WITH NOCHECK ADD  CONSTRAINT [FK_ProgramSK_Treaty] FOREIGN KEY([ProgramSK])
REFERENCES [Policy].[Program] ([ProgramSK])
GO
ALTER TABLE [Reins].[Treaty] NOCHECK CONSTRAINT [FK_ProgramSK_Treaty]
GO
ALTER TABLE [Reins].[Treaty]  WITH NOCHECK ADD  CONSTRAINT [FK_ReinsuranceCompanySK_Treaty] FOREIGN KEY([ReinsuranceCompanySK])
REFERENCES [Party].[ReinsuranceCompany] ([ReinsuranceCompanySK])
GO
ALTER TABLE [Reins].[Treaty] NOCHECK CONSTRAINT [FK_ReinsuranceCompanySK_Treaty]
GO
ALTER TABLE [Reins].[Treaty]  WITH NOCHECK ADD  CONSTRAINT [FK_TreatyCategorySK_Treaty] FOREIGN KEY([TreatyCategorySK])
REFERENCES [Typelist].[TreatyCategory] ([TreatyCategorySK])
GO
ALTER TABLE [Reins].[Treaty] NOCHECK CONSTRAINT [FK_TreatyCategorySK_Treaty]
GO
ALTER TABLE [Reins].[Treaty]  WITH NOCHECK ADD  CONSTRAINT [FK_TreatyCoverageSK_Treaty] FOREIGN KEY([TreatyCoverageSK])
REFERENCES [Policy].[PolicyCoverage] ([PolicyCoverageSK])
GO
ALTER TABLE [Reins].[Treaty] NOCHECK CONSTRAINT [FK_TreatyCoverageSK_Treaty]
GO
ALTER TABLE [Reins].[Treaty]  WITH NOCHECK ADD  CONSTRAINT [FK_TreatyStatusSK_Treaty] FOREIGN KEY([TreatyStatusSK])
REFERENCES [Typelist].[PolicyStatus] ([PolicyStatusSK])
GO
ALTER TABLE [Reins].[Treaty] NOCHECK CONSTRAINT [FK_TreatyStatusSK_Treaty]
GO
ALTER TABLE [Reins].[Treaty]  WITH NOCHECK ADD  CONSTRAINT [FK_TreatyTypeSK_Treaty] FOREIGN KEY([TreatyTypeSK])
REFERENCES [Typelist].[PolicyType] ([PolicyTypeSK])
GO
ALTER TABLE [Reins].[Treaty] NOCHECK CONSTRAINT [FK_TreatyTypeSK_Treaty]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Treaty reinsurance is an obligatory method based on an agreement concluded for a specified period of time (usually 12-month period, renewable annually) covering a defined class or classes of business. Details of individual risks are not provided (barring exceptional cases providing for submission of bordereaux). The cedant is obliged to cede all risks falling within the scope of the agreement, and the reinsurer is obliged to accept all such cessions without the option to decline or to ask for improved terms. Offer and acceptance are thus automatic, and the offer becomes a contract as soon as it is made (rather than as soon as it is accepted - as under the facultative method).

Basic methods and types of reinsurance: 
>> Facultative:
 - Proportional = Proportional facultative
 - Non-Proportional = Risk Excess, Layered Cover, Facultative Stop Loss
>> Treaty:
 - Proportional = Quota Share, Surplus, Combined Quota-cum-Surplus
 - Non-Proportional = Per Risk Excess of Loss, Working Excess of Loss, Catastrophe Excess of Loss, Aggregate Excess of Loss (Stop Loss)
>> Semi-automatic arrangements:
 - Proportional = Automatic Facultative Cover, Facultative Obligatory Cover, Line Slip
 - Non-Proportional = Coded Excess of Loss, Excess of Loss Line Slip' , @level0type=N'SCHEMA',@level0name=N'Reins', @level1type=N'TABLE',@level1name=N'Treaty'
GO
