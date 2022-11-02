USE [DataMagnifier]
GO
/****** Object:  Table [Reins].[TreatyLimit]    Script Date: 02.11.2022 13:09:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Reins].[TreatyLimit](
	[TreatyLimitSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[TreatySK] [int] NOT NULL,
	[NonProportionalTreatySK] [int] NULL,
	[LevelTypeSK] [int] NOT NULL,
	[LimitDeductibleTypeSK] [int] NOT NULL,
	[LimitValue] [decimal](18, 2) NULL,
	[LimitDesc] [varchar](255) NULL,
 CONSTRAINT [PK_TreatyLimit] PRIMARY KEY CLUSTERED 
(
	[TreatyLimitSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Reins].[TreatyLimit]  WITH CHECK ADD  CONSTRAINT [FK_LevelTypeSK_TreatyLimit] FOREIGN KEY([LevelTypeSK])
REFERENCES [TypeList].[LevelType] ([LevelTypeSK])
GO
ALTER TABLE [Reins].[TreatyLimit] CHECK CONSTRAINT [FK_LevelTypeSK_TreatyLimit]
GO
ALTER TABLE [Reins].[TreatyLimit]  WITH CHECK ADD  CONSTRAINT [FK_LimitDeductibleTypeSK_TreatyLimit] FOREIGN KEY([LimitDeductibleTypeSK])
REFERENCES [TypeList].[LimitDeductibleType] ([LimitDeductibleTypeSK])
GO
ALTER TABLE [Reins].[TreatyLimit] CHECK CONSTRAINT [FK_LimitDeductibleTypeSK_TreatyLimit]
GO
ALTER TABLE [Reins].[TreatyLimit]  WITH CHECK ADD  CONSTRAINT [FK_NonProportionalTreatySK_TreatyLimit] FOREIGN KEY([NonProportionalTreatySK])
REFERENCES [Reins].[NonProportionalTreaty] ([NonProportionalTreatySK])
GO
ALTER TABLE [Reins].[TreatyLimit] CHECK CONSTRAINT [FK_NonProportionalTreatySK_TreatyLimit]
GO
ALTER TABLE [Reins].[TreatyLimit]  WITH CHECK ADD  CONSTRAINT [FK_TreatySK_TreatyLimit] FOREIGN KEY([TreatySK])
REFERENCES [Reins].[Treaty] ([TreatySK])
GO
ALTER TABLE [Reins].[TreatyLimit] CHECK CONSTRAINT [FK_TreatySK_TreatyLimit]
GO
