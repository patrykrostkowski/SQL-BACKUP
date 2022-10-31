USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteInsurableObject]    Script Date: 31.10.2022 12:06:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteInsurableObject](
	[QuoteInsurableObjectSK] [int] IDENTITY(2,1) NOT NULL,
	[QuoteSubLineSK] [int] NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteTransSK] [int] NOT NULL,
	[QuoteGeographySK] [int] NOT NULL,
	[InsurableObjectTypeSK] [int] NOT NULL,
	[InsuredSK] [int] NOT NULL,
 CONSTRAINT [PK_QuoteInsurableObject] PRIMARY KEY CLUSTERED 
(
	[QuoteInsurableObjectSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteInsurableObject]  WITH CHECK ADD  CONSTRAINT [FK_InsuredSK_QuoteInsurableObject] FOREIGN KEY([InsuredSK])
REFERENCES [Party].[Insured] ([InsuredSK])
GO
ALTER TABLE [PreBind].[QuoteInsurableObject] CHECK CONSTRAINT [FK_InsuredSK_QuoteInsurableObject]
GO
ALTER TABLE [PreBind].[QuoteInsurableObject]  WITH CHECK ADD  CONSTRAINT [FK_QuoteGeographySK_QuoteInsurableObject] FOREIGN KEY([QuoteGeographySK])
REFERENCES [PreBind].[QuoteGeography] ([QuoteGeographySK])
GO
ALTER TABLE [PreBind].[QuoteInsurableObject] CHECK CONSTRAINT [FK_QuoteGeographySK_QuoteInsurableObject]
GO
ALTER TABLE [PreBind].[QuoteInsurableObject]  WITH CHECK ADD  CONSTRAINT [FK_QuoteSubLineSK_QuoteInsurableObject] FOREIGN KEY([QuoteSubLineSK])
REFERENCES [PreBind].[QuoteSubLine] ([QuoteSubLineSK])
GO
ALTER TABLE [PreBind].[QuoteInsurableObject] CHECK CONSTRAINT [FK_QuoteSubLineSK_QuoteInsurableObject]
GO
ALTER TABLE [PreBind].[QuoteInsurableObject]  WITH CHECK ADD  CONSTRAINT [FK_QuoteTransSK_QuoteInsurableObject] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
ALTER TABLE [PreBind].[QuoteInsurableObject] CHECK CONSTRAINT [FK_QuoteTransSK_QuoteInsurableObject]
GO
ALTER TABLE [PreBind].[QuoteInsurableObject]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteInsurableObject] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteInsurableObject] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteInsurableObject]
GO
