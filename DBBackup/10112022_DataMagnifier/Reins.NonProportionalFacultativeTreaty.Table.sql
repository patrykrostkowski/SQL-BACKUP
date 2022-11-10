USE [DataMagnifier]
GO
/****** Object:  Table [Reins].[NonProportionalFacultativeTreaty]    Script Date: 10.11.2022 14:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Reins].[NonProportionalFacultativeTreaty]') AND type in (N'U'))
BEGIN
CREATE TABLE [Reins].[NonProportionalFacultativeTreaty](
	[NonProportionalFacultativeTreatySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[FacultativeTreatySK] [int] NOT NULL,
 CONSTRAINT [PK_NonProportionalFacultativeTreaty] PRIMARY KEY CLUSTERED 
(
	[FacultativeTreatySK] ASC,
	[NonProportionalFacultativeTreatySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Reins].[FK_FacultativeTreatySK_NonProportionalFacultativeTreaty]') AND parent_object_id = OBJECT_ID(N'[Reins].[NonProportionalFacultativeTreaty]'))
ALTER TABLE [Reins].[NonProportionalFacultativeTreaty]  WITH CHECK ADD  CONSTRAINT [FK_FacultativeTreatySK_NonProportionalFacultativeTreaty] FOREIGN KEY([FacultativeTreatySK])
REFERENCES [Reins].[FacultativeTreaty] ([FacultativeTreatySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Reins].[FK_FacultativeTreatySK_NonProportionalFacultativeTreaty]') AND parent_object_id = OBJECT_ID(N'[Reins].[NonProportionalFacultativeTreaty]'))
ALTER TABLE [Reins].[NonProportionalFacultativeTreaty] CHECK CONSTRAINT [FK_FacultativeTreatySK_NonProportionalFacultativeTreaty]
GO
