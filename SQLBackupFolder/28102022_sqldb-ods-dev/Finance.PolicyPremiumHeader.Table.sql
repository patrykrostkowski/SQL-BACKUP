USE [sqldb-ods-dev]
GO
/****** Object:  Table [Finance].[PolicyPremiumHeader]    Script Date: 28.10.2022 13:36:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Finance].[PolicyPremiumHeader](
	[PolicyPremiumHeaderSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[FinancialSourceTransactionTypeSK] [int] NOT NULL,
	[FinancialReportingPeriodSK] [int] NOT NULL,
	[EntryDate] [date] NOT NULL,
	[SettlementDate] [date] NULL,
	[LastAllocationDate] [date] NULL,
	[PolicySK] [int] NOT NULL,
	[PolicyEffectiveDate] [date] NULL,
	[PolicyExpirationDate] [date] NULL,
	[PolicyTransSK] [int] NOT NULL,
	[PrimaryInsuredSK] [int] NOT NULL,
	[WritingCompanySK] [int] NOT NULL,
	[AgencySK] [int] NOT NULL,
	[ProductSK] [int] NULL,
	[ProgramSK] [int] NULL,
 CONSTRAINT [PK305_2] PRIMARY KEY CLUSTERED 
(
	[PolicyPremiumHeaderSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Finance].[PolicyPremiumHeader]  WITH NOCHECK ADD  CONSTRAINT [FK_InsuredSK_PolicyPremiumHeader] FOREIGN KEY([PrimaryInsuredSK])
REFERENCES [Party].[Insured] ([InsuredSK])
GO
ALTER TABLE [Finance].[PolicyPremiumHeader] NOCHECK CONSTRAINT [FK_InsuredSK_PolicyPremiumHeader]
GO
ALTER TABLE [Finance].[PolicyPremiumHeader]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyTransSK_PolicyPremiumHeader] FOREIGN KEY([PolicyTransSK])
REFERENCES [Policy].[PolicyTrans] ([PolicyTransSK])
GO
ALTER TABLE [Finance].[PolicyPremiumHeader] NOCHECK CONSTRAINT [FK_PolicyTransSK_PolicyPremiumHeader]
GO
ALTER TABLE [Finance].[PolicyPremiumHeader]  WITH NOCHECK ADD  CONSTRAINT [RefAgency997] FOREIGN KEY([AgencySK])
REFERENCES [Party].[Agency] ([AgencySK])
GO
ALTER TABLE [Finance].[PolicyPremiumHeader] NOCHECK CONSTRAINT [RefAgency997]
GO
ALTER TABLE [Finance].[PolicyPremiumHeader]  WITH NOCHECK ADD  CONSTRAINT [RefFinancialReportingPeriod1030] FOREIGN KEY([FinancialReportingPeriodSK])
REFERENCES [Typelist].[FinancialReportingPeriod] ([FinancialReportingPeriodSK])
GO
ALTER TABLE [Finance].[PolicyPremiumHeader] NOCHECK CONSTRAINT [RefFinancialReportingPeriod1030]
GO
ALTER TABLE [Finance].[PolicyPremiumHeader]  WITH NOCHECK ADD  CONSTRAINT [RefFinancialSourceTransactionType988] FOREIGN KEY([FinancialSourceTransactionTypeSK])
REFERENCES [Typelist].[FinancialSourceTransactionType] ([FinancialSourceTransactionTypeSK])
GO
ALTER TABLE [Finance].[PolicyPremiumHeader] NOCHECK CONSTRAINT [RefFinancialSourceTransactionType988]
GO
ALTER TABLE [Finance].[PolicyPremiumHeader]  WITH NOCHECK ADD  CONSTRAINT [RefPolicy998] FOREIGN KEY([PolicySK])
REFERENCES [Policy].[Policy] ([PolicySK])
GO
ALTER TABLE [Finance].[PolicyPremiumHeader] NOCHECK CONSTRAINT [RefPolicy998]
GO
ALTER TABLE [Finance].[PolicyPremiumHeader]  WITH NOCHECK ADD  CONSTRAINT [RefProduct1002] FOREIGN KEY([ProductSK])
REFERENCES [Typelist].[Product] ([ProductSK])
GO
ALTER TABLE [Finance].[PolicyPremiumHeader] NOCHECK CONSTRAINT [RefProduct1002]
GO
ALTER TABLE [Finance].[PolicyPremiumHeader]  WITH NOCHECK ADD  CONSTRAINT [RefProgram1000] FOREIGN KEY([ProgramSK])
REFERENCES [Policy].[Program] ([ProgramSK])
GO
ALTER TABLE [Finance].[PolicyPremiumHeader] NOCHECK CONSTRAINT [RefProgram1000]
GO
ALTER TABLE [Finance].[PolicyPremiumHeader]  WITH NOCHECK ADD  CONSTRAINT [RefSourceSystem994] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Finance].[PolicyPremiumHeader] NOCHECK CONSTRAINT [RefSourceSystem994]
GO
ALTER TABLE [Finance].[PolicyPremiumHeader]  WITH NOCHECK ADD  CONSTRAINT [RefWritingCompany999] FOREIGN KEY([WritingCompanySK])
REFERENCES [Party].[WritingCompany] ([WritingCompanySK])
GO
ALTER TABLE [Finance].[PolicyPremiumHeader] NOCHECK CONSTRAINT [RefWritingCompany999]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The header for Policy and supporting elements that include writing company, agency, product, program.   This headertable  is mapped into each of the supporting detail tables.   All measures are reflected in the supporting detail tables.' , @level0type=N'SCHEMA',@level0name=N'Finance', @level1type=N'TABLE',@level1name=N'PolicyPremiumHeader'
GO
