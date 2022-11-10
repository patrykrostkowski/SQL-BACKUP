USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteGeography]    Script Date: 10.11.2022 12:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteGeography](
	[QuoteGeographySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteTransSK] [int] NOT NULL,
	[QuoteLineofBusinessSK] [int] NOT NULL,
	[CountrySK] [int] NOT NULL,
	[StateSK] [int] NOT NULL,
	[TerritoryName] [varchar](25) NULL,
	[RegionName] [varchar](25) NULL,
	[CountyName] [varchar](25) NULL,
 CONSTRAINT [PK_QuoteGeography] PRIMARY KEY CLUSTERED 
(
	[QuoteGeographySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[SourceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteGeography]  WITH CHECK ADD  CONSTRAINT [FK_CountrySK_QuoteGeography] FOREIGN KEY([CountrySK])
REFERENCES [TypeList].[Country] ([CountrySK])
GO
ALTER TABLE [PreBind].[QuoteGeography] CHECK CONSTRAINT [FK_CountrySK_QuoteGeography]
GO
ALTER TABLE [PreBind].[QuoteGeography]  WITH CHECK ADD  CONSTRAINT [FK_QuoteLineofBusinessSK_QuoteGeography] FOREIGN KEY([QuoteLineofBusinessSK])
REFERENCES [PreBind].[QuoteLineofBusiness] ([QuoteLineofBusinessSK])
GO
ALTER TABLE [PreBind].[QuoteGeography] CHECK CONSTRAINT [FK_QuoteLineofBusinessSK_QuoteGeography]
GO
ALTER TABLE [PreBind].[QuoteGeography]  WITH CHECK ADD  CONSTRAINT [FK_QuoteTransSK_QuoteGeography] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
ALTER TABLE [PreBind].[QuoteGeography] CHECK CONSTRAINT [FK_QuoteTransSK_QuoteGeography]
GO
ALTER TABLE [PreBind].[QuoteGeography]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteGeography] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteGeography] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteGeography]
GO
ALTER TABLE [PreBind].[QuoteGeography]  WITH CHECK ADD  CONSTRAINT [FK_StateSK_QuoteGeography] FOREIGN KEY([StateSK])
REFERENCES [TypeList].[State] ([StateSK])
GO
ALTER TABLE [PreBind].[QuoteGeography] CHECK CONSTRAINT [FK_StateSK_QuoteGeography]
GO
