USE [sqldb-ods-dev]
GO
/****** Object:  Table [Reins].[SurplusShareTreaty]    Script Date: 28.10.2022 11:10:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Reins].[SurplusShareTreaty](
	[SurplusShareTreatySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[ProportionalTreatySK] [int] NOT NULL,
	[ThresholdAmt] [decimal](19, 4) NOT NULL,
 CONSTRAINT [PK_SurplusShareTreaty] PRIMARY KEY CLUSTERED 
(
	[ProportionalTreatySK] ASC,
	[SurplusShareTreatySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_SurplusShareTreaty]    Script Date: 28.10.2022 11:11:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_SurplusShareTreaty] ON [Reins].[SurplusShareTreaty]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Reins].[SurplusShareTreaty]  WITH NOCHECK ADD  CONSTRAINT [FK_ProportionalTreatySK_SurplusShareTreaty] FOREIGN KEY([ProportionalTreatySK])
REFERENCES [Reins].[ProportionalTreaty] ([ProportionalTreatySK])
GO
ALTER TABLE [Reins].[SurplusShareTreaty] NOCHECK CONSTRAINT [FK_ProportionalTreatySK_SurplusShareTreaty]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Surplus Share Treaty' , @level0type=N'SCHEMA',@level0name=N'Reins', @level1type=N'TABLE',@level1name=N'SurplusShareTreaty'
GO
