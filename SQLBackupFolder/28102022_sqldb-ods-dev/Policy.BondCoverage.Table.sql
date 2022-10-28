USE [sqldb-ods-dev]
GO
/****** Object:  Table [Policy].[BondCoverage]    Script Date: 28.10.2022 15:04:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[BondCoverage](
	[BondCoverageSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[BondTransSK] [int] NOT NULL,
	[LineofBusinessSK] [int] NOT NULL,
	[PolicyGeographySK] [int] NOT NULL,
	[PolicyInsurableObjectSK] [int] NULL,
	[PolicySubLineSK] [int] NULL,
	[AnnualStatementLineofBusinessSK] [int] NULL,
	[CoverageSK] [int] NOT NULL,
	[CoverageGroupSK] [int] NULL,
	[CoverageTriggerSK] [int] NULL,
	[ISOClassCode] [varchar](20) NULL,
	[ClassCode1] [varchar](25) NULL,
	[ClassCode2] [varchar](25) NULL,
	[ClassExtensionCode] [varchar](25) NULL,
	[EffectiveDate] [date] NULL,
	[ExpirationDate] [date] NULL,
	[CancellationDate] [date] NULL,
	[IsMajorCoverageInd] [int] NULL,
	[SIFederalInd] [tinyint] NULL,
	[CurrentTermAmt] [decimal](18, 10) NULL,
	[WrittenAmt] [decimal](18, 10) NULL,
	[IsIncludedInPremiumInd] [tinyint] NULL,
 CONSTRAINT [PK_BondCoverage] PRIMARY KEY CLUSTERED 
(
	[BondCoverageSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_BondCoverage]    Script Date: 28.10.2022 15:06:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_BondCoverage] ON [Policy].[BondCoverage]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Policy].[BondCoverage]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_BondCoverage] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[BondCoverage] NOCHECK CONSTRAINT [FK_SourceSystemSK_BondCoverage]
GO
ALTER TABLE [Policy].[BondCoverage]  WITH NOCHECK ADD  CONSTRAINT [RefBondTrans941] FOREIGN KEY([BondTransSK])
REFERENCES [Policy].[BondTrans] ([BondTransSK])
GO
ALTER TABLE [Policy].[BondCoverage] NOCHECK CONSTRAINT [RefBondTrans941]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A policy risk management component detailing the circumstances under which a claim benefit will be paid. Effectively this provides protection against a particular risk. In property insurance, coverage identifies elements such as perils insured against, properties covered, locations covered, individuals insured and the limits of indemnification.' , @level0type=N'SCHEMA',@level0name=N'Policy', @level1type=N'TABLE',@level1name=N'BondCoverage'
GO
