USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteTransQuestionAnswer]    Script Date: 10.11.2022 14:36:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PreBind].[QuoteTransQuestionAnswer]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_PartySK_QuoteTransQuestionAnswer]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteTransQuestionAnswer]'))
ALTER TABLE [PreBind].[QuoteTransQuestionAnswer]  WITH CHECK ADD  CONSTRAINT [FK_PartySK_QuoteTransQuestionAnswer] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_PartySK_QuoteTransQuestionAnswer]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteTransQuestionAnswer]'))
ALTER TABLE [PreBind].[QuoteTransQuestionAnswer] CHECK CONSTRAINT [FK_PartySK_QuoteTransQuestionAnswer]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteTransSK_QuoteTransQuestionAnswer]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteTransQuestionAnswer]'))
ALTER TABLE [PreBind].[QuoteTransQuestionAnswer]  WITH CHECK ADD  CONSTRAINT [FK_QuoteTransSK_QuoteTransQuestionAnswer] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteTransSK_QuoteTransQuestionAnswer]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteTransQuestionAnswer]'))
ALTER TABLE [PreBind].[QuoteTransQuestionAnswer] CHECK CONSTRAINT [FK_QuoteTransSK_QuoteTransQuestionAnswer]
GO
