USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteFreightContent]    Script Date: 10.11.2022 14:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PreBind].[QuoteFreightContent]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteIMTransportationClassSK_QuoteFreightContent]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteFreightContent]'))
ALTER TABLE [PreBind].[QuoteFreightContent]  WITH CHECK ADD  CONSTRAINT [FK_QuoteIMTransportationClassSK_QuoteFreightContent] FOREIGN KEY([QuoteIMTransportationClassSK])
REFERENCES [PreBind].[QuoteIMTransportationClass] ([QuoteIMTransportationClassSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteIMTransportationClassSK_QuoteFreightContent]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteFreightContent]'))
ALTER TABLE [PreBind].[QuoteFreightContent] CHECK CONSTRAINT [FK_QuoteIMTransportationClassSK_QuoteFreightContent]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SourceSystemSK_QuoteFreightContent]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteFreightContent]'))
ALTER TABLE [PreBind].[QuoteFreightContent]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteFreightContent] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SourceSystemSK_QuoteFreightContent]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteFreightContent]'))
ALTER TABLE [PreBind].[QuoteFreightContent] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteFreightContent]
GO
