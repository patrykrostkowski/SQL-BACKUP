USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteTransQuestionAnswer]    Script Date: 10.11.2022 13:56:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteTransQuestionAnswer](
	[QuoteTransSK] [int] NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PartySK] [int] NOT NULL,
 CONSTRAINT [PK_QuoteTransQuestionAnswer] PRIMARY KEY CLUSTERED 
(
	[QuoteTransSK] ASC,
	[PartySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteTransQuestionAnswer]  WITH CHECK ADD  CONSTRAINT [FK_PartySK_QuoteTransQuestionAnswer] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [PreBind].[QuoteTransQuestionAnswer] CHECK CONSTRAINT [FK_PartySK_QuoteTransQuestionAnswer]
GO
ALTER TABLE [PreBind].[QuoteTransQuestionAnswer]  WITH CHECK ADD  CONSTRAINT [FK_QuoteTransSK_QuoteTransQuestionAnswer] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
ALTER TABLE [PreBind].[QuoteTransQuestionAnswer] CHECK CONSTRAINT [FK_QuoteTransSK_QuoteTransQuestionAnswer]
GO
