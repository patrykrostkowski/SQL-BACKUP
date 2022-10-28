USE [sqldb-ods-dev]
GO
/****** Object:  Table [Claim].[LossEventPersonalProperty]    Script Date: 28.10.2022 11:09:31 ******/
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
 CONSTRAINT [PK_LossEventPersonalProperty] PRIMARY KEY CLUSTERED 
(
	[LossEventPersonalPropertySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_LossEventPersonalProperty]    Script Date: 28.10.2022 11:11:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_LossEventPersonalProperty] ON [Claim].[LossEventPersonalProperty]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Claim].[LossEventPersonalProperty]  WITH NOCHECK ADD  CONSTRAINT [FK_LossEventSK_LossEventPersonalProperty] FOREIGN KEY([LossEventSK])
REFERENCES [Claim].[LossEvent] ([LossEventSK])
GO
ALTER TABLE [Claim].[LossEventPersonalProperty] NOCHECK CONSTRAINT [FK_LossEventSK_LossEventPersonalProperty]
GO
ALTER TABLE [Claim].[LossEventPersonalProperty]  WITH NOCHECK ADD  CONSTRAINT [FK_PropertyCountrySK_LossEventPersonalProperty] FOREIGN KEY([PropertyCountrySK])
REFERENCES [Typelist].[Country] ([CountrySK])
GO
ALTER TABLE [Claim].[LossEventPersonalProperty] NOCHECK CONSTRAINT [FK_PropertyCountrySK_LossEventPersonalProperty]
GO
ALTER TABLE [Claim].[LossEventPersonalProperty]  WITH NOCHECK ADD  CONSTRAINT [FK_PropertyStateSK_LossEventPersonalProperty] FOREIGN KEY([PropertyStateSK])
REFERENCES [Typelist].[State] ([StateSK])
GO
ALTER TABLE [Claim].[LossEventPersonalProperty] NOCHECK CONSTRAINT [FK_PropertyStateSK_LossEventPersonalProperty]
GO
ALTER TABLE [Claim].[LossEventPersonalProperty]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_LossEventPersonalProperty] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[LossEventPersonalProperty] NOCHECK CONSTRAINT [FK_SourceSystemSK_LossEventPersonalProperty]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Scheduled Item is listed in a property insurance contract, and insured separately from the standard property insurance in order to receive the full 
value for a loss. Examples are: expensive jewelry, furs, paintings, electronics, etc.' , @level0type=N'SCHEMA',@level0name=N'Claim', @level1type=N'TABLE',@level1name=N'LossEventPersonalProperty'
GO
