USE [DataMagnifier]
GO
/****** Object:  Table [Survey].[QuoteTransQuestionAnswer]    Script Date: 10.11.2022 14:47:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Survey].[QuoteTransQuestionAnswer]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Survey].[FK_PartySK_QuoteTransQuestionAnswer]') AND parent_object_id = OBJECT_ID(N'[Survey].[QuoteTransQuestionAnswer]'))
ALTER TABLE [Survey].[QuoteTransQuestionAnswer]  WITH CHECK ADD  CONSTRAINT [FK_PartySK_QuoteTransQuestionAnswer] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Survey].[FK_PartySK_QuoteTransQuestionAnswer]') AND parent_object_id = OBJECT_ID(N'[Survey].[QuoteTransQuestionAnswer]'))
ALTER TABLE [Survey].[QuoteTransQuestionAnswer] CHECK CONSTRAINT [FK_PartySK_QuoteTransQuestionAnswer]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Survey].[FK_QuoteTransSK_QuoteTransQuestionAnswer]') AND parent_object_id = OBJECT_ID(N'[Survey].[QuoteTransQuestionAnswer]'))
ALTER TABLE [Survey].[QuoteTransQuestionAnswer]  WITH CHECK ADD  CONSTRAINT [FK_QuoteTransSK_QuoteTransQuestionAnswer] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Survey].[FK_QuoteTransSK_QuoteTransQuestionAnswer]') AND parent_object_id = OBJECT_ID(N'[Survey].[QuoteTransQuestionAnswer]'))
ALTER TABLE [Survey].[QuoteTransQuestionAnswer] CHECK CONSTRAINT [FK_QuoteTransSK_QuoteTransQuestionAnswer]
GO
