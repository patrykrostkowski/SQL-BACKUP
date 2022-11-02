USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[BondCoverage]    Script Date: 02.11.2022 12:58:10 ******/
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
	[ISOClasscode] [varchar](20) NULL,
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
ALTER TABLE [Policy].[BondCoverage]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_BondCoverage] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[BondCoverage] CHECK CONSTRAINT [FK_SourceSystemSK_BondCoverage]
GO
