USE [DataMagnifier]
GO
/****** Object:  Table [Claim].[LossEventPersonalProperty]    Script Date: 31.10.2022 12:40:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Claim].[LossEventPersonalProperty](
	[LossEventPersonalPropertySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[LossEventSK] [int] NOT NULL,
	[PropertyAddressLine1] [varchar](50) NULL,
	[PropertyAddressLine2] [varchar](50) NULL,
	[PropertyAddressLine3] [varchar](50) NULL,
	[PropertyCityName] [varchar](50) NULL,
	[PropertyStateSK] [int] NOT NULL,
	[PropertyStateCode] [varchar](10) NULL,
	[PropertyZipCode] [varchar](20) NULL,
	[PropertyCountrySK] [int] NOT NULL,
	[IsPrimaryLocationInd] [tinyint] NULL,
	[IsAlreadyRepairedInd] [tinyint] NULL,
	[IsEstimateReceivedInd] [int] NULL,
	[IsHazardInvolvedInd] [int] NULL,
	[PropertyItemNum] [varchar](10) NULL,
	[PropertyItemName] [varchar](50) NULL,
	[ItemValueAmt] [decimal](19, 4) NULL,
	[PropertyItemDesc] [varchar](100) NULL,
	[EstimateRepairTimeDesc] [varchar](60) NULL,
	[EstimateDamageDesc] [varchar](289) NULL,
	[EstimateRepairCostAmt] [decimal](19, 4) NULL,
	[EstimateReplacementCostAmt] [decimal](19, 4) NULL,
 CONSTRAINT [PK_LossEventPersonalProperty] PRIMARY KEY NONCLUSTERED 
(
	[LossEventPersonalPropertySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Claim].[LossEventPersonalProperty]  WITH CHECK ADD  CONSTRAINT [FK_LossEventSK_LossEventPersonalProperty] FOREIGN KEY([LossEventSK])
REFERENCES [Claim].[LossEvent] ([LossEventSK])
GO
ALTER TABLE [Claim].[LossEventPersonalProperty] CHECK CONSTRAINT [FK_LossEventSK_LossEventPersonalProperty]
GO
ALTER TABLE [Claim].[LossEventPersonalProperty]  WITH CHECK ADD  CONSTRAINT [FK_PropertyCountrySK_LossEventPersonalProperty] FOREIGN KEY([PropertyCountrySK])
REFERENCES [TypeList].[Country] ([CountrySK])
GO
ALTER TABLE [Claim].[LossEventPersonalProperty] CHECK CONSTRAINT [FK_PropertyCountrySK_LossEventPersonalProperty]
GO
ALTER TABLE [Claim].[LossEventPersonalProperty]  WITH CHECK ADD  CONSTRAINT [FK_PropertyStateSK_LossEventPersonalProperty] FOREIGN KEY([PropertyStateSK])
REFERENCES [TypeList].[State] ([StateSK])
GO
ALTER TABLE [Claim].[LossEventPersonalProperty] CHECK CONSTRAINT [FK_PropertyStateSK_LossEventPersonalProperty]
GO
ALTER TABLE [Claim].[LossEventPersonalProperty]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_LossEventPersonalProperty] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[LossEventPersonalProperty] CHECK CONSTRAINT [FK_SourceSystemSK_LossEventPersonalProperty]
GO
