USE [sqldb-ods-dev]
GO
/****** Object:  Table [Policy].[RatingPlanFactor]    Script Date: 27.10.2022 12:27:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[RatingPlanFactor](
	[RatingPlanFactorSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PolicyRatingPlanSK] [int] NULL,
	[FactorTypeSK] [int] NOT NULL,
	[FactorValue] [varchar](50) NOT NULL,
	[FactorDesc] [varchar](255) NULL,
	[FactorOptionName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_RatingPlanFactor] PRIMARY KEY CLUSTERED 
(
	[RatingPlanFactorSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_RatingPlanFactor]    Script Date: 27.10.2022 12:28:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_RatingPlanFactor] ON [Policy].[RatingPlanFactor]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Policy].[RatingPlanFactor]  WITH NOCHECK ADD  CONSTRAINT [FK_FactorTypeSK_RatingPlanFactor] FOREIGN KEY([FactorTypeSK])
REFERENCES [Typelist].[FactorType] ([FactorTypeSK])
GO
ALTER TABLE [Policy].[RatingPlanFactor] NOCHECK CONSTRAINT [FK_FactorTypeSK_RatingPlanFactor]
GO
ALTER TABLE [Policy].[RatingPlanFactor]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyRatingPlanSK_RatingPlanFactor] FOREIGN KEY([PolicyRatingPlanSK])
REFERENCES [Policy].[RatingPlan] ([RatingPlanSK])
GO
ALTER TABLE [Policy].[RatingPlanFactor] NOCHECK CONSTRAINT [FK_PolicyRatingPlanSK_RatingPlanFactor]
GO
ALTER TABLE [Policy].[RatingPlanFactor]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_RatingPlanFactor] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[RatingPlanFactor] NOCHECK CONSTRAINT [FK_SourceSystemSK_RatingPlanFactor]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Rating Plan Class Codes associated with One to Many rating Plan Factors.' , @level0type=N'SCHEMA',@level0name=N'Policy', @level1type=N'TABLE',@level1name=N'RatingPlanFactor'
GO
