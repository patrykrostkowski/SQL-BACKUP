﻿USE [DataMagnifier]
GO
/****** Object:  Table [Reins].[SurplusShareTreaty]    Script Date: 20.11.2022 19:02:25 ******/
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
ALTER TABLE [Reins].[SurplusShareTreaty]  WITH CHECK ADD  CONSTRAINT [FK_ProportionalTreatySK_SurplusShareTreaty] FOREIGN KEY([ProportionalTreatySK])
REFERENCES [Reins].[ProportionalTreaty] ([ProportionalTreatySK])
GO
ALTER TABLE [Reins].[SurplusShareTreaty] CHECK CONSTRAINT [FK_ProportionalTreatySK_SurplusShareTreaty]
GO
