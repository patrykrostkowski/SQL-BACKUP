USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuotePropertyInTransit]    Script Date: 02.11.2022 09:21:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuotePropertyInTransit](
	[QuotePropertyInTransitSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteIMTransportationClassSK] [int] NOT NULL,
 CONSTRAINT [PK_QuotePropertyInTransit] PRIMARY KEY NONCLUSTERED 
(
	[QuotePropertyInTransitSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuotePropertyInTransit]  WITH CHECK ADD  CONSTRAINT [FK_QuoteIMTransportationClassSK_QuotePropertyInTransit] FOREIGN KEY([QuoteIMTransportationClassSK])
REFERENCES [PreBind].[QuoteIMTransportationClass] ([QuoteIMTransportationClassSK])
GO
ALTER TABLE [PreBind].[QuotePropertyInTransit] CHECK CONSTRAINT [FK_QuoteIMTransportationClassSK_QuotePropertyInTransit]
GO
