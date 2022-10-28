USE [sqldb-ods-dev]
GO
/****** Object:  Table [PreBind].[QuoteRatingPlanFactor]    Script Date: 28.10.2022 11:10:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteRatingPlanFactor](
	[QuoteRatingPlanFactorSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteRatingPlanSK] [int] NOT NULL,
	[FactorTypeSK] [int] NOT NULL,
	[FactorValue] [varchar](50) NOT NULL,
	[FactorDesc] [varchar](255) NULL,
	[FactorOptionName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_RatingPlanFactor_1] PRIMARY KEY CLUSTERED 
(
	[QuoteRatingPlanFactorSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_QuoteRatingPlanFactor]    Script Date: 28.10.2022 11:11:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_QuoteRatingPlanFactor] ON [PreBind].[QuoteRatingPlanFactor]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteRatingPlanFactor]  WITH NOCHECK ADD  CONSTRAINT [FK_FactorTypeSK_QuoteRatingPlanFactor] FOREIGN KEY([FactorTypeSK])
REFERENCES [Typelist].[FactorType] ([FactorTypeSK])
GO
ALTER TABLE [PreBind].[QuoteRatingPlanFactor] NOCHECK CONSTRAINT [FK_FactorTypeSK_QuoteRatingPlanFactor]
GO
ALTER TABLE [PreBind].[QuoteRatingPlanFactor]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteRatingPlanSK_QuoteRatingPlanFactor] FOREIGN KEY([QuoteRatingPlanSK])
REFERENCES [PreBind].[QuoteRatingPlan] ([QuoteRatingPlanSK])
GO
ALTER TABLE [PreBind].[QuoteRatingPlanFactor] NOCHECK CONSTRAINT [FK_QuoteRatingPlanSK_QuoteRatingPlanFactor]
GO
ALTER TABLE [PreBind].[QuoteRatingPlanFactor]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteRatingPlanFactor] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteRatingPlanFactor] NOCHECK CONSTRAINT [FK_SourceSystemSK_QuoteRatingPlanFactor]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Rating Plan Class Codes associated with One to Many rating Plan Factors.' , @level0type=N'SCHEMA',@level0name=N'PreBind', @level1type=N'TABLE',@level1name=N'QuoteRatingPlanFactor'
GO
