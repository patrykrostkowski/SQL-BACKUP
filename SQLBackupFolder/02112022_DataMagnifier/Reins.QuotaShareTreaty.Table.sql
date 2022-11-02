USE [DataMagnifier]
GO
/****** Object:  Table [Reins].[QuotaShareTreaty]    Script Date: 02.11.2022 12:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Reins].[QuotaShareTreaty](
	[QuotaShareTreatySK] [int] IDENTITY(2,1) NOT NULL,
	[ProportionalTreatySK] [int] NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[CessionRatePct] [decimal](8, 2) NOT NULL,
	[RetentionRatePct] [decimal](8, 2) NULL,
 CONSTRAINT [PK_QuotaShareTreaty] PRIMARY KEY CLUSTERED 
(
	[ProportionalTreatySK] ASC,
	[QuotaShareTreatySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Reins].[QuotaShareTreaty]  WITH CHECK ADD  CONSTRAINT [FK_ProportionalTreatySK_QuotaShareTreaty] FOREIGN KEY([ProportionalTreatySK])
REFERENCES [Reins].[ProportionalTreaty] ([ProportionalTreatySK])
GO
ALTER TABLE [Reins].[QuotaShareTreaty] CHECK CONSTRAINT [FK_ProportionalTreatySK_QuotaShareTreaty]
GO
