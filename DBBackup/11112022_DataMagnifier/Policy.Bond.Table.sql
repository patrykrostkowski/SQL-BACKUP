USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[Bond]    Script Date: 12.11.2022 09:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Policy].[Bond]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicySK_Bond]') AND parent_object_id = OBJECT_ID(N'[Policy].[Bond]'))
ALTER TABLE [Policy].[Bond]  WITH CHECK ADD  CONSTRAINT [FK_PolicySK_Bond] FOREIGN KEY([PolicySK])
REFERENCES [Policy].[Policy] ([PolicySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicySK_Bond]') AND parent_object_id = OBJECT_ID(N'[Policy].[Bond]'))
ALTER TABLE [Policy].[Bond] CHECK CONSTRAINT [FK_PolicySK_Bond]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_Bond]') AND parent_object_id = OBJECT_ID(N'[Policy].[Bond]'))
ALTER TABLE [Policy].[Bond]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_Bond] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_Bond]') AND parent_object_id = OBJECT_ID(N'[Policy].[Bond]'))
ALTER TABLE [Policy].[Bond] CHECK CONSTRAINT [FK_SourceSystemSK_Bond]
GO
