USE [DataMagnifier]
GO
/****** Object:  Table [Reins].[NonProportionalTreaty]    Script Date: 10.11.2022 14:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Reins].[NonProportionalTreaty]') AND type in (N'U'))
BEGIN
CREATE TABLE [Reins].[NonProportionalTreaty](
	[NonProportionalTreatySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[TreatySK] [int] NOT NULL,
 CONSTRAINT [PK_NonProportionalTreaty] PRIMARY KEY CLUSTERED 
(
	[NonProportionalTreatySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Reins].[FK_TreatySK_NonProportionalTreaty]') AND parent_object_id = OBJECT_ID(N'[Reins].[NonProportionalTreaty]'))
ALTER TABLE [Reins].[NonProportionalTreaty]  WITH CHECK ADD  CONSTRAINT [FK_TreatySK_NonProportionalTreaty] FOREIGN KEY([TreatySK])
REFERENCES [Reins].[Treaty] ([TreatySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Reins].[FK_TreatySK_NonProportionalTreaty]') AND parent_object_id = OBJECT_ID(N'[Reins].[NonProportionalTreaty]'))
ALTER TABLE [Reins].[NonProportionalTreaty] CHECK CONSTRAINT [FK_TreatySK_NonProportionalTreaty]
GO
