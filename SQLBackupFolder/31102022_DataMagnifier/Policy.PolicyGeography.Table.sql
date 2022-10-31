USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[PolicyGeography]    Script Date: 31.10.2022 12:09:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
ALTER TABLE [Policy].[PolicyGeography]  WITH CHECK ADD  CONSTRAINT [FK_CountrySK_PolicyGeography] FOREIGN KEY([CountrySK])
REFERENCES [TypeList].[Country] ([CountrySK])
GO
ALTER TABLE [Policy].[PolicyGeography] CHECK CONSTRAINT [FK_CountrySK_PolicyGeography]
GO
ALTER TABLE [Policy].[PolicyGeography]  WITH CHECK ADD  CONSTRAINT [FK_PolicyLineofBusinessSK_PolicyGeography] FOREIGN KEY([PolicyLineofBusinessSK])
REFERENCES [Policy].[PolicyLineofBusiness] ([PolicyLineofBusinessSK])
GO
ALTER TABLE [Policy].[PolicyGeography] CHECK CONSTRAINT [FK_PolicyLineofBusinessSK_PolicyGeography]
GO
ALTER TABLE [Policy].[PolicyGeography]  WITH CHECK ADD  CONSTRAINT [FK_PolicyTransSK_PolicyGeography] FOREIGN KEY([PolicyTransSK])
REFERENCES [Policy].[PolicyTrans] ([PolicyTransSK])
GO
ALTER TABLE [Policy].[PolicyGeography] CHECK CONSTRAINT [FK_PolicyTransSK_PolicyGeography]
GO
ALTER TABLE [Policy].[PolicyGeography]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyGeography] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[PolicyGeography] CHECK CONSTRAINT [FK_SourceSystemSK_PolicyGeography]
GO
ALTER TABLE [Policy].[PolicyGeography]  WITH CHECK ADD  CONSTRAINT [FK_StateSK_PolicyGeography] FOREIGN KEY([StateSK])
REFERENCES [TypeList].[State] ([StateSK])
GO
ALTER TABLE [Policy].[PolicyGeography] CHECK CONSTRAINT [FK_StateSK_PolicyGeography]
GO
