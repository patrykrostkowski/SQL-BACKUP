USE [sqldb-ods-dev]
GO
/****** Object:  Table [Policy].[BondTrans]    Script Date: 28.10.2022 12:26:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[BondTrans](
	[BondTransSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[BondSK] [int] NOT NULL,
	[IsCurrentInd] [tinyint] NOT NULL,
	[BondFormNum] [varchar](256) NOT NULL,
	[BondFormName] [varchar](100) NOT NULL,
	[ReplacementBondNum] [varchar](50) NULL,
	[BondDesc] [varchar](500) NULL,
	[ObligorSK] [int] NOT NULL,
	[CreditScoreNum] [int] NULL,
	[LicensePermitNum] [varchar](50) NULL,
	[IsContinuousInd] [tinyint] NOT NULL,
	[IsRenewalInd] [tinyint] NOT NULL,
	[IsCancellationInd] [tinyint] NOT NULL,
	[IsAutoCancelInd] [tinyint] NOT NULL,
	[NextRenewalCheckDate] [date] NULL,
	[NextRenewalDaysNum] [int] NULL,
	[CancellationRevisionDaysNum] [image] NULL,
	[RenewableTypeSK] [int] NOT NULL,
	[CompletedPct] [decimal](8, 2) NULL,
	[OriginalEffectiveDate] [date] NULL,
	[BondAmt] [decimal](20, 6) NULL,
	[ContractAmt] [decimal](20, 6) NULL,
	[MaintenanceBondAmt] [decimal](20, 6) NULL,
	[ExposureStatusSK] [int] NULL,
	[TransStartDatetime] [datetime] NOT NULL,
	[TransEndDatetime] [datetime] NULL,
	[TransStatusSK] [int] NOT NULL,
	[UnderwritingStatusSK] [int] NULL,
	[RegistrationDate] [date] NULL,
	[EffectiveDate] [date] NULL,
	[ExpirationDate] [date] NULL,
	[IssuanceDate] [date] NULL,
	[CancellationDate] [date] NULL,
	[RetroActiveDate] [date] NULL,
	[BusinessUnitSK] [int] NOT NULL,
	[StandardIndustryCodeSK] [int] NULL,
	[NorthAmericanIndustryClassificationSK] [int] NULL,
 CONSTRAINT [PK_BondTrans] PRIMARY KEY CLUSTERED 
(
	[BondTransSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_BondTrans]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_BondTrans] ON [Policy].[BondTrans]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Policy].[BondTrans]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_BondTrans] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[BondTrans] NOCHECK CONSTRAINT [FK_SourceSystemSK_BondTrans]
GO
ALTER TABLE [Policy].[BondTrans]  WITH NOCHECK ADD  CONSTRAINT [RefBond940] FOREIGN KEY([BondSK])
REFERENCES [Policy].[Bond] ([BondSK])
GO
ALTER TABLE [Policy].[BondTrans] NOCHECK CONSTRAINT [RefBond940]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The suite of post bind transactions in the placement process (e.g. quote, new business, etc.)  for insurance and any related supplements.    Eac h transaction provides the detail grain including  status and respective  underwriter workflow' , @level0type=N'SCHEMA',@level0name=N'Policy', @level1type=N'TABLE',@level1name=N'BondTrans'
GO
