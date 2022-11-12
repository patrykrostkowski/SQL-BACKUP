USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteRatingPlanFactor]    Script Date: 12.11.2022 09:01:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PreBind].[QuoteRatingPlanFactor]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_FactorTypeSK_QuoteRatingPlanFactor]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteRatingPlanFactor]'))
ALTER TABLE [PreBind].[QuoteRatingPlanFactor]  WITH CHECK ADD  CONSTRAINT [FK_FactorTypeSK_QuoteRatingPlanFactor] FOREIGN KEY([FactorTypeSK])
REFERENCES [TypeList].[FactorType] ([FactorTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_FactorTypeSK_QuoteRatingPlanFactor]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteRatingPlanFactor]'))
ALTER TABLE [PreBind].[QuoteRatingPlanFactor] CHECK CONSTRAINT [FK_FactorTypeSK_QuoteRatingPlanFactor]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteRatingPlanSK_QuoteRatingPlanFactor]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteRatingPlanFactor]'))
ALTER TABLE [PreBind].[QuoteRatingPlanFactor]  WITH CHECK ADD  CONSTRAINT [FK_QuoteRatingPlanSK_QuoteRatingPlanFactor] FOREIGN KEY([QuoteRatingPlanSK])
REFERENCES [PreBind].[QuoteRatingPlan] ([QuoteRatingPlanSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteRatingPlanSK_QuoteRatingPlanFactor]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteRatingPlanFactor]'))
ALTER TABLE [PreBind].[QuoteRatingPlanFactor] CHECK CONSTRAINT [FK_QuoteRatingPlanSK_QuoteRatingPlanFactor]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SourceSystemSK_QuoteRatingPlanFactor]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteRatingPlanFactor]'))
ALTER TABLE [PreBind].[QuoteRatingPlanFactor]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteRatingPlanFactor] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SourceSystemSK_QuoteRatingPlanFactor]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteRatingPlanFactor]'))
ALTER TABLE [PreBind].[QuoteRatingPlanFactor] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteRatingPlanFactor]
GO
