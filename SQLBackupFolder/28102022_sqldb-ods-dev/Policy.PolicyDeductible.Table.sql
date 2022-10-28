USE [sqldb-ods-dev]
GO
/****** Object:  Table [Policy].[PolicyDeductible]    Script Date: 28.10.2022 12:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[PolicyDeductible](
	[DeductibleSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PolicyTransSK] [int] NOT NULL,
	[PolicyLineofBusinessSK] [int] NULL,
	[PolicyGeographySK] [int] NULL,
	[PolicyInsurableObjectSK] [int] NULL,
	[PolicyCoverageSK] [int] NULL,
	[DeductibleLevelSK] [int] NOT NULL,
	[DeductibleTypeSK] [int] NOT NULL,
	[CurrencySK] [int] NOT NULL,
	[DeductibleValue] [varchar](100) NOT NULL,
	[DeductibleDesc] [varchar](255) NULL,
	[DeductibleOptionName] [varchar](50) NULL,
 CONSTRAINT [PK_PolicyDeductible] PRIMARY KEY CLUSTERED 
(
	[DeductibleSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_PolicyDeductible]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_PolicyDeductible] ON [Policy].[PolicyDeductible]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Policy].[PolicyDeductible]  WITH NOCHECK ADD  CONSTRAINT [FK_CurrencySK_PolicyDeductible] FOREIGN KEY([CurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[PolicyDeductible] NOCHECK CONSTRAINT [FK_CurrencySK_PolicyDeductible]
GO
ALTER TABLE [Policy].[PolicyDeductible]  WITH NOCHECK ADD  CONSTRAINT [FK_DeductibleLevelSK_PolicyDeductible] FOREIGN KEY([DeductibleLevelSK])
REFERENCES [Typelist].[LevelType] ([LevelTypeSK])
GO
ALTER TABLE [Policy].[PolicyDeductible] NOCHECK CONSTRAINT [FK_DeductibleLevelSK_PolicyDeductible]
GO
ALTER TABLE [Policy].[PolicyDeductible]  WITH NOCHECK ADD  CONSTRAINT [FK_DeductibleTypeSK_PolicyDeductible] FOREIGN KEY([DeductibleTypeSK])
REFERENCES [Typelist].[LimitDeductibleType] ([LimitDeductibleTypeSK])
GO
ALTER TABLE [Policy].[PolicyDeductible] NOCHECK CONSTRAINT [FK_DeductibleTypeSK_PolicyDeductible]
GO
ALTER TABLE [Policy].[PolicyDeductible]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyCoverageSK_PolicyDeductible] FOREIGN KEY([PolicyCoverageSK])
REFERENCES [Policy].[PolicyCoverage] ([PolicyCoverageSK])
GO
ALTER TABLE [Policy].[PolicyDeductible] NOCHECK CONSTRAINT [FK_PolicyCoverageSK_PolicyDeductible]
GO
ALTER TABLE [Policy].[PolicyDeductible]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyGeographySK_PolicyDeductible] FOREIGN KEY([PolicyGeographySK])
REFERENCES [Policy].[PolicyGeography] ([PolicyGeographySK])
GO
ALTER TABLE [Policy].[PolicyDeductible] NOCHECK CONSTRAINT [FK_PolicyGeographySK_PolicyDeductible]
GO
ALTER TABLE [Policy].[PolicyDeductible]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyInsurableObjectSK_PolicyDeductible] FOREIGN KEY([PolicyInsurableObjectSK])
REFERENCES [Policy].[PolicyInsurableObject] ([PolicyInsurableObjectSK])
GO
ALTER TABLE [Policy].[PolicyDeductible] NOCHECK CONSTRAINT [FK_PolicyInsurableObjectSK_PolicyDeductible]
GO
ALTER TABLE [Policy].[PolicyDeductible]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyLineofBusinessSK_PolicyDeductible] FOREIGN KEY([PolicyLineofBusinessSK])
REFERENCES [Policy].[PolicyLineofBusiness] ([PolicyLineofBusinessSK])
GO
ALTER TABLE [Policy].[PolicyDeductible] NOCHECK CONSTRAINT [FK_PolicyLineofBusinessSK_PolicyDeductible]
GO
ALTER TABLE [Policy].[PolicyDeductible]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyTransSK_PolicyDeductible] FOREIGN KEY([PolicyTransSK])
REFERENCES [Policy].[PolicyTrans] ([PolicyTransSK])
GO
ALTER TABLE [Policy].[PolicyDeductible] NOCHECK CONSTRAINT [FK_PolicyTransSK_PolicyDeductible]
GO
ALTER TABLE [Policy].[PolicyDeductible]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyDeductible] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[PolicyDeductible] NOCHECK CONSTRAINT [FK_SourceSystemSK_PolicyDeductible]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An amount the insurer will deduct from the loss before making payment on same. The grain/level may be policy or coverage.' , @level0type=N'SCHEMA',@level0name=N'Policy', @level1type=N'TABLE',@level1name=N'PolicyDeductible'
GO
