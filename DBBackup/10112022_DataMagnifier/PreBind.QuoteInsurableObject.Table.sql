USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteInsurableObject]    Script Date: 10.11.2022 14:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PreBind].[QuoteInsurableObject]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_InsuredSK_QuoteInsurableObject]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteInsurableObject]'))
ALTER TABLE [PreBind].[QuoteInsurableObject]  WITH CHECK ADD  CONSTRAINT [FK_InsuredSK_QuoteInsurableObject] FOREIGN KEY([InsuredSK])
REFERENCES [Party].[Insured] ([InsuredSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_InsuredSK_QuoteInsurableObject]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteInsurableObject]'))
ALTER TABLE [PreBind].[QuoteInsurableObject] CHECK CONSTRAINT [FK_InsuredSK_QuoteInsurableObject]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteGeographySK_QuoteInsurableObject]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteInsurableObject]'))
ALTER TABLE [PreBind].[QuoteInsurableObject]  WITH CHECK ADD  CONSTRAINT [FK_QuoteGeographySK_QuoteInsurableObject] FOREIGN KEY([QuoteGeographySK])
REFERENCES [PreBind].[QuoteGeography] ([QuoteGeographySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteGeographySK_QuoteInsurableObject]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteInsurableObject]'))
ALTER TABLE [PreBind].[QuoteInsurableObject] CHECK CONSTRAINT [FK_QuoteGeographySK_QuoteInsurableObject]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteSubLineSK_QuoteInsurableObject]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteInsurableObject]'))
ALTER TABLE [PreBind].[QuoteInsurableObject]  WITH CHECK ADD  CONSTRAINT [FK_QuoteSubLineSK_QuoteInsurableObject] FOREIGN KEY([QuoteSubLineSK])
REFERENCES [PreBind].[QuoteSubLine] ([QuoteSubLineSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteSubLineSK_QuoteInsurableObject]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteInsurableObject]'))
ALTER TABLE [PreBind].[QuoteInsurableObject] CHECK CONSTRAINT [FK_QuoteSubLineSK_QuoteInsurableObject]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteTransSK_QuoteInsurableObject]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteInsurableObject]'))
ALTER TABLE [PreBind].[QuoteInsurableObject]  WITH CHECK ADD  CONSTRAINT [FK_QuoteTransSK_QuoteInsurableObject] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteTransSK_QuoteInsurableObject]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteInsurableObject]'))
ALTER TABLE [PreBind].[QuoteInsurableObject] CHECK CONSTRAINT [FK_QuoteTransSK_QuoteInsurableObject]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SourceSystemSK_QuoteInsurableObject]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteInsurableObject]'))
ALTER TABLE [PreBind].[QuoteInsurableObject]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteInsurableObject] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SourceSystemSK_QuoteInsurableObject]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteInsurableObject]'))
ALTER TABLE [PreBind].[QuoteInsurableObject] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteInsurableObject]
GO
