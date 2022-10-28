USE [sqldb-ods-dev]
GO
/****** Object:  Table [Policy].[PolicyLimit]    Script Date: 28.10.2022 13:36:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[PolicyLimit](
	[LimitSK] [int] IDENTITY(2,1) NOT NULL,
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
	[LimitLevelSK] [int] NOT NULL,
	[BaseCurrencySK] [int] NOT NULL,
	[LimitTypeSK] [int] NOT NULL,
	[LimitValue] [varchar](100) NULL,
	[LimitDesc] [varchar](255) NULL,
	[LimitOptionName] [varchar](50) NULL,
 CONSTRAINT [PK_PolicyLimit] PRIMARY KEY CLUSTERED 
(
	[LimitSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_PolicyLimit]    Script Date: 28.10.2022 13:37:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_PolicyLimit] ON [Policy].[PolicyLimit]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Policy].[PolicyLimit]  WITH NOCHECK ADD  CONSTRAINT [FK_CurrencySK_PolicyLimit] FOREIGN KEY([BaseCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[PolicyLimit] NOCHECK CONSTRAINT [FK_CurrencySK_PolicyLimit]
GO
ALTER TABLE [Policy].[PolicyLimit]  WITH NOCHECK ADD  CONSTRAINT [FK_LimitLevelSK_PolicyLimit] FOREIGN KEY([LimitLevelSK])
REFERENCES [Typelist].[LevelType] ([LevelTypeSK])
GO
ALTER TABLE [Policy].[PolicyLimit] NOCHECK CONSTRAINT [FK_LimitLevelSK_PolicyLimit]
GO
ALTER TABLE [Policy].[PolicyLimit]  WITH NOCHECK ADD  CONSTRAINT [FK_LimitTypeSK_PolicyLimit] FOREIGN KEY([LimitTypeSK])
REFERENCES [Typelist].[LimitDeductibleType] ([LimitDeductibleTypeSK])
GO
ALTER TABLE [Policy].[PolicyLimit] NOCHECK CONSTRAINT [FK_LimitTypeSK_PolicyLimit]
GO
ALTER TABLE [Policy].[PolicyLimit]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyCoverageSK_PolicyLimit] FOREIGN KEY([PolicyCoverageSK])
REFERENCES [Policy].[PolicyCoverage] ([PolicyCoverageSK])
GO
ALTER TABLE [Policy].[PolicyLimit] NOCHECK CONSTRAINT [FK_PolicyCoverageSK_PolicyLimit]
GO
ALTER TABLE [Policy].[PolicyLimit]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyGeographySK_PolicyLimit] FOREIGN KEY([PolicyGeographySK])
REFERENCES [Policy].[PolicyGeography] ([PolicyGeographySK])
GO
ALTER TABLE [Policy].[PolicyLimit] NOCHECK CONSTRAINT [FK_PolicyGeographySK_PolicyLimit]
GO
ALTER TABLE [Policy].[PolicyLimit]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyInsurableObjectSK_PolicyLimit] FOREIGN KEY([PolicyInsurableObjectSK])
REFERENCES [Policy].[PolicyInsurableObject] ([PolicyInsurableObjectSK])
GO
ALTER TABLE [Policy].[PolicyLimit] NOCHECK CONSTRAINT [FK_PolicyInsurableObjectSK_PolicyLimit]
GO
ALTER TABLE [Policy].[PolicyLimit]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyLineofBusinessSK_PolicyLimit] FOREIGN KEY([PolicyLineofBusinessSK])
REFERENCES [Policy].[PolicyLineofBusiness] ([PolicyLineofBusinessSK])
GO
ALTER TABLE [Policy].[PolicyLimit] NOCHECK CONSTRAINT [FK_PolicyLineofBusinessSK_PolicyLimit]
GO
ALTER TABLE [Policy].[PolicyLimit]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyTransSK_PolicyLimit] FOREIGN KEY([PolicyTransSK])
REFERENCES [Policy].[PolicyTrans] ([PolicyTransSK])
GO
ALTER TABLE [Policy].[PolicyLimit] NOCHECK CONSTRAINT [FK_PolicyTransSK_PolicyLimit]
GO
ALTER TABLE [Policy].[PolicyLimit]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyLimit] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[PolicyLimit] NOCHECK CONSTRAINT [FK_SourceSystemSK_PolicyLimit]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A limit level may be  a policy and/or coverage     A policy limit may be Maximum Loss that represents the maximum amount of claims to be paid regardless of number of claims.   A coverage limit is the maximum amount to be paid on a authorized coverage on a single incident or claim   A vehicle coverage  such as  liability,  collision and comprehensive will each have separate limits.' , @level0type=N'SCHEMA',@level0name=N'Policy', @level1type=N'TABLE',@level1name=N'PolicyLimit'
GO
