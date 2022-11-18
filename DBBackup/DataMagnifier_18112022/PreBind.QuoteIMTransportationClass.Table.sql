USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteIMTransportationClass]    Script Date: 18.11.2022 16:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteIMTransportationClass](
	[QuoteIMTransportationClassSK] [int] IDENTITY(2,1) NOT NULL,
	[QuoteInsurableObjectSK] [int] NOT NULL,
 CONSTRAINT [PK_QuoteIMTransportationClass] PRIMARY KEY NONCLUSTERED 
(
	[QuoteIMTransportationClassSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteIMTransportationClass]  WITH CHECK ADD  CONSTRAINT [FK_QuoteInsurableObjectSK_QuoteIMTransportationClass] FOREIGN KEY([QuoteInsurableObjectSK])
REFERENCES [PreBind].[QuoteInsurableObject] ([QuoteInsurableObjectSK])
GO
ALTER TABLE [PreBind].[QuoteIMTransportationClass] CHECK CONSTRAINT [FK_QuoteInsurableObjectSK_QuoteIMTransportationClass]
GO
