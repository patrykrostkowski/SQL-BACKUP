USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[PolicyGeography]    Script Date: 10.11.2022 14:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Policy].[PolicyGeography]') AND type in (N'U'))
BEGIN
CREATE TABLE [Policy].[PolicyGeography](
	[PolicyGeographySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PolicyTransSK] [int] NOT NULL,
	[PolicyLineofBusinessSK] [int] NOT NULL,
	[CountrySK] [int] NOT NULL,
	[StateSK] [int] NULL,
	[TerritoryName] [varchar](25) NULL,
	[RegionName] [varchar](25) NULL,
	[CountyName] [int] NULL,
 CONSTRAINT [PK_PolicyGeography] PRIMARY KEY CLUSTERED 
(
	[PolicyGeographySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_CountrySK_PolicyGeography]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyGeography]'))
ALTER TABLE [Policy].[PolicyGeography]  WITH CHECK ADD  CONSTRAINT [FK_CountrySK_PolicyGeography] FOREIGN KEY([CountrySK])
REFERENCES [TypeList].[Country] ([CountrySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_CountrySK_PolicyGeography]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyGeography]'))
ALTER TABLE [Policy].[PolicyGeography] CHECK CONSTRAINT [FK_CountrySK_PolicyGeography]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyLineofBusinessSK_PolicyGeography]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyGeography]'))
ALTER TABLE [Policy].[PolicyGeography]  WITH CHECK ADD  CONSTRAINT [FK_PolicyLineofBusinessSK_PolicyGeography] FOREIGN KEY([PolicyLineofBusinessSK])
REFERENCES [Policy].[PolicyLineofBusiness] ([PolicyLineofBusinessSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyLineofBusinessSK_PolicyGeography]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyGeography]'))
ALTER TABLE [Policy].[PolicyGeography] CHECK CONSTRAINT [FK_PolicyLineofBusinessSK_PolicyGeography]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyTransSK_PolicyGeography]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyGeography]'))
ALTER TABLE [Policy].[PolicyGeography]  WITH CHECK ADD  CONSTRAINT [FK_PolicyTransSK_PolicyGeography] FOREIGN KEY([PolicyTransSK])
REFERENCES [Policy].[PolicyTrans] ([PolicyTransSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyTransSK_PolicyGeography]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyGeography]'))
ALTER TABLE [Policy].[PolicyGeography] CHECK CONSTRAINT [FK_PolicyTransSK_PolicyGeography]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_PolicyGeography]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyGeography]'))
ALTER TABLE [Policy].[PolicyGeography]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyGeography] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_PolicyGeography]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyGeography]'))
ALTER TABLE [Policy].[PolicyGeography] CHECK CONSTRAINT [FK_SourceSystemSK_PolicyGeography]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_StateSK_PolicyGeography]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyGeography]'))
ALTER TABLE [Policy].[PolicyGeography]  WITH CHECK ADD  CONSTRAINT [FK_StateSK_PolicyGeography] FOREIGN KEY([StateSK])
REFERENCES [TypeList].[State] ([StateSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_StateSK_PolicyGeography]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyGeography]'))
ALTER TABLE [Policy].[PolicyGeography] CHECK CONSTRAINT [FK_StateSK_PolicyGeography]
GO
