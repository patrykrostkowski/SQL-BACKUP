USE [DataMagnifier]
GO
/****** Object:  Table [Reins].[ProportionalTreaty]    Script Date: 08.11.2022 08:05:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
ALTER TABLE [Reins].[ProportionalTreaty]  WITH CHECK ADD  CONSTRAINT [FK_TreatySK_ProportionalTreaty] FOREIGN KEY([TreatySK])
REFERENCES [Reins].[Treaty] ([TreatySK])
GO
ALTER TABLE [Reins].[ProportionalTreaty] CHECK CONSTRAINT [FK_TreatySK_ProportionalTreaty]
GO
