USE [DataMagnifier]
GO
/****** Object:  Table [Reins].[ProportionalFacultativeTreaty]    Script Date: 31.10.2022 12:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Reins].[ProportionalFacultativeTreaty](
	[ProportionalFacultativeTreatySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[FacultativeTreatySK] [int] NOT NULL,
 CONSTRAINT [PK_ProportionalFacultativeTreaty] PRIMARY KEY CLUSTERED 
(
	[FacultativeTreatySK] ASC,
	[ProportionalFacultativeTreatySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Reins].[ProportionalFacultativeTreaty]  WITH CHECK ADD  CONSTRAINT [FK_FacultativeTreatySK_ProportionalFacultativeTreaty] FOREIGN KEY([FacultativeTreatySK])
REFERENCES [Reins].[FacultativeTreaty] ([FacultativeTreatySK])
GO
ALTER TABLE [Reins].[ProportionalFacultativeTreaty] CHECK CONSTRAINT [FK_FacultativeTreatySK_ProportionalFacultativeTreaty]
GO
