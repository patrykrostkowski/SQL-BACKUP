USE [sqldb-ods-dev]
GO
/****** Object:  Table [Reins].[NonProportionalFacultativeTreaty]    Script Date: 28.10.2022 12:27:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_NonProportionalFacultativeTreaty]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_NonProportionalFacultativeTreaty] ON [Reins].[NonProportionalFacultativeTreaty]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Reins].[NonProportionalFacultativeTreaty]  WITH NOCHECK ADD  CONSTRAINT [FK_FacultativeTreatySK_NonProportionalFacultativeTreaty] FOREIGN KEY([FacultativeTreatySK])
REFERENCES [Reins].[FacultativeTreaty] ([FacultativeTreatySK])
GO
ALTER TABLE [Reins].[NonProportionalFacultativeTreaty] NOCHECK CONSTRAINT [FK_FacultativeTreatySK_NonProportionalFacultativeTreaty]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Non Proportional Facultative Treaty' , @level0type=N'SCHEMA',@level0name=N'Reins', @level1type=N'TABLE',@level1name=N'NonProportionalFacultativeTreaty'
GO
