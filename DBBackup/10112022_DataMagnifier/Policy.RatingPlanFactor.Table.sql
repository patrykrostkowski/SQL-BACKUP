USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[RatingPlanFactor]    Script Date: 10.11.2022 14:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Policy].[RatingPlanFactor]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_FactorTypeSK_RatingPlanFactor]') AND parent_object_id = OBJECT_ID(N'[Policy].[RatingPlanFactor]'))
ALTER TABLE [Policy].[RatingPlanFactor]  WITH CHECK ADD  CONSTRAINT [FK_FactorTypeSK_RatingPlanFactor] FOREIGN KEY([FactorTypeSK])
REFERENCES [TypeList].[FactorType] ([FactorTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_FactorTypeSK_RatingPlanFactor]') AND parent_object_id = OBJECT_ID(N'[Policy].[RatingPlanFactor]'))
ALTER TABLE [Policy].[RatingPlanFactor] CHECK CONSTRAINT [FK_FactorTypeSK_RatingPlanFactor]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyRatingPlanSK_RatingPlanFactor]') AND parent_object_id = OBJECT_ID(N'[Policy].[RatingPlanFactor]'))
ALTER TABLE [Policy].[RatingPlanFactor]  WITH CHECK ADD  CONSTRAINT [FK_PolicyRatingPlanSK_RatingPlanFactor] FOREIGN KEY([PolicyRatingPlanSK])
REFERENCES [Policy].[RatingPlan] ([RatingPlanSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyRatingPlanSK_RatingPlanFactor]') AND parent_object_id = OBJECT_ID(N'[Policy].[RatingPlanFactor]'))
ALTER TABLE [Policy].[RatingPlanFactor] CHECK CONSTRAINT [FK_PolicyRatingPlanSK_RatingPlanFactor]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_RatingPlanFactor]') AND parent_object_id = OBJECT_ID(N'[Policy].[RatingPlanFactor]'))
ALTER TABLE [Policy].[RatingPlanFactor]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_RatingPlanFactor] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_RatingPlanFactor]') AND parent_object_id = OBJECT_ID(N'[Policy].[RatingPlanFactor]'))
ALTER TABLE [Policy].[RatingPlanFactor] CHECK CONSTRAINT [FK_SourceSystemSK_RatingPlanFactor]
GO
