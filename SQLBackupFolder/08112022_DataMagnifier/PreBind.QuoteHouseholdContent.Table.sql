USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteHouseholdContent]    Script Date: 08.11.2022 08:05:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteHouseholdContent](
	[QuoteHouseholdContentSK] [int] IDENTITY(2,1) NOT NULL,
	[QuoteIMTransportationClassSK] [int] NOT NULL,
 CONSTRAINT [PK_QuoteHouseholdContent] PRIMARY KEY NONCLUSTERED 
(
	[QuoteHouseholdContentSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteHouseholdContent]  WITH CHECK ADD  CONSTRAINT [FK_QuoteIMTransportationClassSK_QuoteHouseholdContent] FOREIGN KEY([QuoteIMTransportationClassSK])
REFERENCES [PreBind].[QuoteIMTransportationClass] ([QuoteIMTransportationClassSK])
GO
ALTER TABLE [PreBind].[QuoteHouseholdContent] CHECK CONSTRAINT [FK_QuoteIMTransportationClassSK_QuoteHouseholdContent]
GO
