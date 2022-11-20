USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[BondTrans]    Script Date: 20.11.2022 14:18:24 ******/
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
ALTER TABLE [Policy].[BondTrans]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_BondTrans] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[BondTrans] CHECK CONSTRAINT [FK_SourceSystemSK_BondTrans]
GO
