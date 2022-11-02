USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteFreightContent]    Script Date: 02.11.2022 14:05:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteFreightContent](
	[QuoteContnetSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteIMTransportationClassSK] [int] NOT NULL,
 CONSTRAINT [PK_QuoteFreightContent] PRIMARY KEY NONCLUSTERED 
(
	[QuoteContnetSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteFreightContent]  WITH CHECK ADD  CONSTRAINT [FK_QuoteIMTransportationClassSK_QuoteFreightContent] FOREIGN KEY([QuoteIMTransportationClassSK])
REFERENCES [PreBind].[QuoteIMTransportationClass] ([QuoteIMTransportationClassSK])
GO
ALTER TABLE [PreBind].[QuoteFreightContent] CHECK CONSTRAINT [FK_QuoteIMTransportationClassSK_QuoteFreightContent]
GO
ALTER TABLE [PreBind].[QuoteFreightContent]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteFreightContent] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteFreightContent] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteFreightContent]
GO
