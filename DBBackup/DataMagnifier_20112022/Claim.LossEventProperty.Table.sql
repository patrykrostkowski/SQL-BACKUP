USE [DataMagnifier]
GO
/****** Object:  Table [Claim].[LossEventProperty]    Script Date: 20.11.2022 14:18:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Claim].[LossEventProperty](
	[LossEventPropertytSK] [int] IDENTITY(2,1) NOT NULL,
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
	[LossEventPropertytSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Claim].[LossEventProperty]  WITH CHECK ADD  CONSTRAINT [FK_CountrySK_LossEventProperty] FOREIGN KEY([CountrySK])
REFERENCES [TypeList].[Country] ([CountrySK])
GO
ALTER TABLE [Claim].[LossEventProperty] CHECK CONSTRAINT [FK_CountrySK_LossEventProperty]
GO
ALTER TABLE [Claim].[LossEventProperty]  WITH CHECK ADD  CONSTRAINT [FK_LossEventSK_LossEventProperty] FOREIGN KEY([LossEventSK])
REFERENCES [Claim].[LossEvent] ([LossEventSK])
GO
ALTER TABLE [Claim].[LossEventProperty] CHECK CONSTRAINT [FK_LossEventSK_LossEventProperty]
GO
ALTER TABLE [Claim].[LossEventProperty]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_LossEventProperty] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[LossEventProperty] CHECK CONSTRAINT [FK_SourceSystemSK_LossEventProperty]
GO
ALTER TABLE [Claim].[LossEventProperty]  WITH CHECK ADD  CONSTRAINT [FK_StateSK_LossEventProperty] FOREIGN KEY([StateSK])
REFERENCES [TypeList].[State] ([StateSK])
GO
ALTER TABLE [Claim].[LossEventProperty] CHECK CONSTRAINT [FK_StateSK_LossEventProperty]
GO
