USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteTransReason]    Script Date: 02.11.2022 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteTransReason](
	[QuoteTransReasonSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteSK] [int] NOT NULL,
	[QuoteTransSK] [int] NOT NULL,
	[ReasonSK] [int] NOT NULL,
	[ReasonInformationDesc] [varchar](256) NULL,
 CONSTRAINT [PK_QuoteTransReason] PRIMARY KEY CLUSTERED 
(
	[QuoteTransReasonSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteTransReason]  WITH CHECK ADD  CONSTRAINT [FK_QuoteSK_QuoteTransReason] FOREIGN KEY([QuoteSK])
REFERENCES [PreBind].[Quote] ([QuoteSK])
GO
ALTER TABLE [PreBind].[QuoteTransReason] CHECK CONSTRAINT [FK_QuoteSK_QuoteTransReason]
GO
ALTER TABLE [PreBind].[QuoteTransReason]  WITH CHECK ADD  CONSTRAINT [FK_QuoteTransSK_QuoteTransReason] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
ALTER TABLE [PreBind].[QuoteTransReason] CHECK CONSTRAINT [FK_QuoteTransSK_QuoteTransReason]
GO
ALTER TABLE [PreBind].[QuoteTransReason]  WITH CHECK ADD  CONSTRAINT [FK_ReasonSK_QuoteTransReason] FOREIGN KEY([ReasonSK])
REFERENCES [TypeList].[Reason] ([ReasonSK])
GO
ALTER TABLE [PreBind].[QuoteTransReason] CHECK CONSTRAINT [FK_ReasonSK_QuoteTransReason]
GO
