USE [sqldb-ods-dev]
GO
/****** Object:  Table [Policy].[Bond]    Script Date: 27.10.2022 12:26:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[Bond](
	[BondSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PolicySK] [int] NULL,
	[EffectiveJobNum] [varchar](20) NOT NULL,
	[AccountSK] [int] NOT NULL,
	[InsuredSK] [int] NOT NULL,
	[BondFormNum] [varchar](100) NOT NULL,
	[LegacyPolicyNum] [varchar](60) NULL,
	[BondFormName] [varchar](255) NULL,
	[BondDesc] [varchar](500) NULL,
	[BondAmt] [decimal](20, 6) NULL,
	[QuoteNum] [varchar](100) NULL,
	[QuoteVersionNum] [int] NULL,
	[EffectiveDate] [date] NULL,
	[OriginalEffectiveDate] [date] NULL,
	[ExpirationDate] [date] NULL,
	[TailDate] [date] NULL,
	[UnderwritingYear] [varchar](4) NULL,
	[IssuanceDateTime] [datetime] NOT NULL,
	[CancellationDate] [date] NULL,
	[CancellationTypeSK] [int] NULL,
	[CancellationRateSK] [int] NULL,
	[BrokerSK] [int] NOT NULL,
	[CommissionPct] [decimal](8, 2) NULL,
	[CommissionAmt] [decimal](19, 4) NULL,
	[ProductSK] [int] NULL,
	[ProgramSK] [int] NULL,
	[WritingCompanySK] [int] NOT NULL,
	[BusinessUnitSK] [int] NOT NULL,
	[BusinessTypeSK] [int] NULL,
	[UnderwritingStatusSK] [int] NULL,
	[ProjectTypeSK] [int] NULL,
	[PolicyStatusSK] [int] NULL,
	[DomicileStateSK] [int] NULL,
	[DomicileCountrySK] [int] NOT NULL,
	[StandardIndustryCodeSK] [int] NULL,
	[NorthAmericanIndustryClassificationSK] [int] NULL,
	[PayPlanSK] [int] NULL,
	[BillTypeSK] [int] NULL,
	[IsMultiStateInd] [tinyint] NULL,
	[ProjectName] [varchar](255) NULL,
	[DaysNoticeOfCancellationNum] [int] NULL,
 CONSTRAINT [PK_Bond] PRIMARY KEY CLUSTERED 
(
	[BondSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_Bond]    Script Date: 27.10.2022 12:28:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_Bond] ON [Policy].[Bond]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Policy].[Bond]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicySK_Bond] FOREIGN KEY([PolicySK])
REFERENCES [Policy].[Policy] ([PolicySK])
GO
ALTER TABLE [Policy].[Bond] NOCHECK CONSTRAINT [FK_PolicySK_Bond]
GO
ALTER TABLE [Policy].[Bond]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_Bond] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[Bond] NOCHECK CONSTRAINT [FK_SourceSystemSK_Bond]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A contract / agreement between an insured and writing company each committing themselves to fulfill one or more obligations as outlined in a policy declaration.' , @level0type=N'SCHEMA',@level0name=N'Policy', @level1type=N'TABLE',@level1name=N'Bond'
GO
