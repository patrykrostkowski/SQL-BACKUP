USE [sqldb-ods-dev]
GO
/****** Object:  Table [Claim].[LossEventProperty]    Script Date: 28.10.2022 13:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Claim].[LossEventProperty](
	[LossEventPropertySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[LossEventSK] [int] NULL,
	[PropertyDesc] [varchar](255) NULL,
	[AssessmentStatusSK] [int] NULL,
	[ClassificationCode] [varchar](25) NULL,
	[ExternalWallMaterialTypeSK] [int] NULL,
	[LossAreaTypeSK] [int] NULL,
	[OccupancyTypeSK] [int] NULL,
	[RoofMaterialTypeSK] [int] NULL,
	[SprinklerTypeSK] [int] NULL,
	[PropertyLocationLine1Address] [varchar](60) NULL,
	[PropertyLocationLine2Address] [varchar](60) NULL,
	[PropertyLocationLine3Address] [varchar](60) NULL,
	[PropertyLocationLine4Address] [varchar](60) NULL,
	[PropertyLocationCityName] [varchar](60) NULL,
	[StateSK] [int] NULL,
	[PropertyLocationPostalCode] [varchar](60) NULL,
	[CountrySK] [int] NULL,
	[IsPrimaryLocationInd] [tinyint] NULL,
	[IsAlreadyRepairedInd] [tinyint] NULL,
	[IsEstimateReceivedInd] [int] NULL,
	[IsHazardInvolvedInd] [int] NULL,
	[IsIncludeContentLineItemsInd] [tinyint] NULL,
	[IsIncludeLineItemsInd] [tinyint] NULL,
	[IsMoldInvolvedInd] [int] NULL,
	[PropertyAssessmentCloseDate] [date] NULL,
	[PropertyAssessmentName] [varchar](128) NULL,
	[PropertyAssessmentCommentTxt] [varchar](255) NULL,
	[EstimateRepairTimeDesc] [varchar](60) NULL,
	[EstimateDamageDesc] [varchar](289) NULL,
	[NumOfStories] [varchar](20) NULL,
	[PeriodOfRestorationDesc] [varchar](255) NULL,
	[EstimateRepairCostAmt] [decimal](19, 4) NULL,
 CONSTRAINT [PK_LossEventProperty] PRIMARY KEY CLUSTERED 
(
	[LossEventPropertySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_LossEventProperty]    Script Date: 28.10.2022 13:37:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_LossEventProperty] ON [Claim].[LossEventProperty]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Claim].[LossEventProperty]  WITH NOCHECK ADD  CONSTRAINT [FK_AssessmentStatusSK_LossEventProperty] FOREIGN KEY([AssessmentStatusSK])
REFERENCES [Typelist].[AssessmentStatus] ([AssessmentStatusSK])
GO
ALTER TABLE [Claim].[LossEventProperty] NOCHECK CONSTRAINT [FK_AssessmentStatusSK_LossEventProperty]
GO
ALTER TABLE [Claim].[LossEventProperty]  WITH NOCHECK ADD  CONSTRAINT [FK_CountrySK_LossEventProperty] FOREIGN KEY([CountrySK])
REFERENCES [Typelist].[Country] ([CountrySK])
GO
ALTER TABLE [Claim].[LossEventProperty] NOCHECK CONSTRAINT [FK_CountrySK_LossEventProperty]
GO
ALTER TABLE [Claim].[LossEventProperty]  WITH NOCHECK ADD  CONSTRAINT [FK_ExternalMaterialTypeSK_LossEventProperty] FOREIGN KEY([ExternalWallMaterialTypeSK])
REFERENCES [Typelist].[ExternalWallMaterialType] ([ExternalWallMaterialTypeSK])
GO
ALTER TABLE [Claim].[LossEventProperty] NOCHECK CONSTRAINT [FK_ExternalMaterialTypeSK_LossEventProperty]
GO
ALTER TABLE [Claim].[LossEventProperty]  WITH NOCHECK ADD  CONSTRAINT [FK_LossAreaTypeSK_LossEventProperty] FOREIGN KEY([LossAreaTypeSK])
REFERENCES [Typelist].[LossAreaType] ([LossAreaTypeSK])
GO
ALTER TABLE [Claim].[LossEventProperty] NOCHECK CONSTRAINT [FK_LossAreaTypeSK_LossEventProperty]
GO
ALTER TABLE [Claim].[LossEventProperty]  WITH NOCHECK ADD  CONSTRAINT [FK_LossEventSK_LossEventProperty] FOREIGN KEY([LossEventSK])
REFERENCES [Claim].[LossEvent] ([LossEventSK])
GO
ALTER TABLE [Claim].[LossEventProperty] NOCHECK CONSTRAINT [FK_LossEventSK_LossEventProperty]
GO
ALTER TABLE [Claim].[LossEventProperty]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_LossEventProperty] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[LossEventProperty] NOCHECK CONSTRAINT [FK_SourceSystemSK_LossEventProperty]
GO
ALTER TABLE [Claim].[LossEventProperty]  WITH NOCHECK ADD  CONSTRAINT [FK_StateSK_LossEventProperty] FOREIGN KEY([StateSK])
REFERENCES [Typelist].[State] ([StateSK])
GO
ALTER TABLE [Claim].[LossEventProperty] NOCHECK CONSTRAINT [FK_StateSK_LossEventProperty]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Specifics of a property loss event' , @level0type=N'SCHEMA',@level0name=N'Claim', @level1type=N'TABLE',@level1name=N'LossEventProperty'
GO
