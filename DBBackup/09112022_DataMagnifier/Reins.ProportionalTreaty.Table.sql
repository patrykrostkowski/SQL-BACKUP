USE [DataMagnifier]
GO
/****** Object:  Table [Reins].[ProportionalTreaty]    Script Date: 10.11.2022 14:36:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Reins].[ProportionalTreaty]') AND type in (N'U'))
BEGIN
CREATE TABLE [Reins].[ProportionalTreaty](
	[ProportionalTreatySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[TreatySK] [int] NOT NULL,
	[FrequencyPeriodCode] [varchar](20) NULL,
	[CommisionPct] [decimal](8, 2) NULL,
 CONSTRAINT [PK_ProportionalTreaty] PRIMARY KEY CLUSTERED 
(
	[ProportionalTreatySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Reins].[FK_TreatySK_ProportionalTreaty]') AND parent_object_id = OBJECT_ID(N'[Reins].[ProportionalTreaty]'))
ALTER TABLE [Reins].[ProportionalTreaty]  WITH CHECK ADD  CONSTRAINT [FK_TreatySK_ProportionalTreaty] FOREIGN KEY([TreatySK])
REFERENCES [Reins].[Treaty] ([TreatySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Reins].[FK_TreatySK_ProportionalTreaty]') AND parent_object_id = OBJECT_ID(N'[Reins].[ProportionalTreaty]'))
ALTER TABLE [Reins].[ProportionalTreaty] CHECK CONSTRAINT [FK_TreatySK_ProportionalTreaty]
GO
