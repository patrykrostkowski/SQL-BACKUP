USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteIMTransportationClass]    Script Date: 12.11.2022 09:01:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PreBind].[QuoteIMTransportationClass]') AND type in (N'U'))
BEGIN
CREATE TABLE [PreBind].[QuoteIMTransportationClass](
	[QuoteIMTransportationClassSK] [int] IDENTITY(2,1) NOT NULL,
	[QuoteInsurableObjectSK] [int] NOT NULL,
 CONSTRAINT [PK_QuoteIMTransportationClass] PRIMARY KEY NONCLUSTERED 
(
	[QuoteIMTransportationClassSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteInsurableObjectSK_QuoteIMTransportationClass]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteIMTransportationClass]'))
ALTER TABLE [PreBind].[QuoteIMTransportationClass]  WITH CHECK ADD  CONSTRAINT [FK_QuoteInsurableObjectSK_QuoteIMTransportationClass] FOREIGN KEY([QuoteInsurableObjectSK])
REFERENCES [PreBind].[QuoteInsurableObject] ([QuoteInsurableObjectSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteInsurableObjectSK_QuoteIMTransportationClass]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteIMTransportationClass]'))
ALTER TABLE [PreBind].[QuoteIMTransportationClass] CHECK CONSTRAINT [FK_QuoteInsurableObjectSK_QuoteIMTransportationClass]
GO
