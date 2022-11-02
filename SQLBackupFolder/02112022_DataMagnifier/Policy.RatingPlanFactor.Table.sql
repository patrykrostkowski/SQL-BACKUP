USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[RatingPlanFactor]    Script Date: 02.11.2022 14:38:28 ******/
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
ALTER TABLE [Policy].[RatingPlanFactor]  WITH CHECK ADD  CONSTRAINT [FK_FactorTypeSK_RatingPlanFactor] FOREIGN KEY([FactorTypeSK])
REFERENCES [TypeList].[FactorType] ([FactorTypeSK])
GO
ALTER TABLE [Policy].[RatingPlanFactor] CHECK CONSTRAINT [FK_FactorTypeSK_RatingPlanFactor]
GO
ALTER TABLE [Policy].[RatingPlanFactor]  WITH CHECK ADD  CONSTRAINT [FK_PolicyRatingPlanSK_RatingPlanFactor] FOREIGN KEY([PolicyRatingPlanSK])
REFERENCES [Policy].[RatingPlan] ([RatingPlanSK])
GO
ALTER TABLE [Policy].[RatingPlanFactor] CHECK CONSTRAINT [FK_PolicyRatingPlanSK_RatingPlanFactor]
GO
ALTER TABLE [Policy].[RatingPlanFactor]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_RatingPlanFactor] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[RatingPlanFactor] CHECK CONSTRAINT [FK_SourceSystemSK_RatingPlanFactor]
GO
