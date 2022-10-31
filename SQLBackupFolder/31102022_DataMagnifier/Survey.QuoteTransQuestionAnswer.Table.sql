USE [DataMagnifier]
GO
/****** Object:  Table [Survey].[QuoteTransQuestionAnswer]    Script Date: 31.10.2022 12:30:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Survey].[QuoteTransQuestionAnswer](
	[QuoteTransSK] [int] NOT NULL,
	[PartySK] [int] NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_PolicyTransQuestionAnswer] PRIMARY KEY CLUSTERED 
(
	[PartySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Survey].[QuoteTransQuestionAnswer]  WITH CHECK ADD  CONSTRAINT [FK_PartySK_QuoteTransQuestionAnswer] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Survey].[QuoteTransQuestionAnswer] CHECK CONSTRAINT [FK_PartySK_QuoteTransQuestionAnswer]
GO
ALTER TABLE [Survey].[QuoteTransQuestionAnswer]  WITH CHECK ADD  CONSTRAINT [FK_QuoteTransSK_QuoteTransQuestionAnswer] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
ALTER TABLE [Survey].[QuoteTransQuestionAnswer] CHECK CONSTRAINT [FK_QuoteTransSK_QuoteTransQuestionAnswer]
GO
