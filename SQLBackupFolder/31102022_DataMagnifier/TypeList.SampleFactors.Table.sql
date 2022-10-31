USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[SampleFactors]    Script Date: 31.10.2022 12:01:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[SampleFactors](
	[IsProdCompIncluded] [varchar](10) NOT NULL,
	[DeductibleAmount] [varchar](10) NOT NULL,
	[DeductibleFactor] [varchar](10) NOT NULL,
	[TermFactor] [varchar](10) NOT NULL,
	[TotalILF] [varchar](10) NOT NULL,
	[LossCostMultiplier] [varchar](10) NOT NULL,
	[LossCost] [varchar](10) NOT NULL,
	[DeductibleTypeBIPDPerClaim] [varchar](10) NOT NULL,
	[ZipCode] [varchar](10) NOT NULL,
	[Territory] [varchar](10) NOT NULL,
	[RMF] [varchar](10) NOT NULL,
	[ClassCode] [varchar](10) NOT NULL,
	[PolicyType] [varchar](10) NOT NULL,
	[State] [varchar](10) NOT NULL,
	[ILTA] [varchar](10) NOT NULL,
	[ClaimsMadeFactor] [varchar](10) NOT NULL,
	[Premium] [varchar](10) NOT NULL,
	[BilledPremium] [varchar](10) NOT NULL,
	[BilledPremiumOverride] [varchar](10) NOT NULL,
	[Exposure] [varchar](10) NOT NULL,
	[ILF] [varchar](10) NOT NULL,
	[ILFEdition] [varchar](10) NOT NULL,
	[LCMEdition] [varchar](10) NOT NULL,
	[LossCostEdition] [varchar](10) NOT NULL,
	[DeviationFactor] [varchar](10) NOT NULL,
	[ActualCommissionFactor] [varchar](10) NOT NULL,
	[ExperienceFactor] [varchar](10) NOT NULL,
	[ScheduleFactor] [varchar](10) NOT NULL,
	[CommissionRate] [varchar](10) NOT NULL,
	[CommissionRateOverride] [varchar](10) NOT NULL,
	[UsedPremium] [varchar](10) NOT NULL,
	[ManualPremium] [varchar](10) NOT NULL,
	[TotalUsedPremium] [varchar](10) NOT NULL,
	[ExcessPrimaryFactor] [varchar](10) NOT NULL,
	[HazardGroup] [varchar](10) NOT NULL,
	[ActualPremium] [varchar](10) NOT NULL,
	[TotalModifiedPremium] [varchar](10) NOT NULL,
	[TotalActualPremium] [varchar](10) NOT NULL,
	[TotalManualPremium] [varchar](10) NOT NULL,
	[PremiumToString] [varchar](10) NOT NULL,
	[PremiumAnnual] [varchar](10) NOT NULL,
	[TermFMR] [varchar](10) NOT NULL,
	[TriaMinimumPremium] [varchar](10) NOT NULL,
	[TriaPercentagE] [varchar](10) NOT NULL
) ON [PRIMARY]
GO
