USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteTransReason]    Script Date: 12.11.2022 09:01:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PreBind].[QuoteTransReason]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteSK_QuoteTransReason]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteTransReason]'))
ALTER TABLE [PreBind].[QuoteTransReason]  WITH CHECK ADD  CONSTRAINT [FK_QuoteSK_QuoteTransReason] FOREIGN KEY([QuoteSK])
REFERENCES [PreBind].[Quote] ([QuoteSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteSK_QuoteTransReason]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteTransReason]'))
ALTER TABLE [PreBind].[QuoteTransReason] CHECK CONSTRAINT [FK_QuoteSK_QuoteTransReason]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteTransSK_QuoteTransReason]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteTransReason]'))
ALTER TABLE [PreBind].[QuoteTransReason]  WITH CHECK ADD  CONSTRAINT [FK_QuoteTransSK_QuoteTransReason] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteTransSK_QuoteTransReason]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteTransReason]'))
ALTER TABLE [PreBind].[QuoteTransReason] CHECK CONSTRAINT [FK_QuoteTransSK_QuoteTransReason]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_ReasonSK_QuoteTransReason]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteTransReason]'))
ALTER TABLE [PreBind].[QuoteTransReason]  WITH CHECK ADD  CONSTRAINT [FK_ReasonSK_QuoteTransReason] FOREIGN KEY([ReasonSK])
REFERENCES [TypeList].[Reason] ([ReasonSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_ReasonSK_QuoteTransReason]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteTransReason]'))
ALTER TABLE [PreBind].[QuoteTransReason] CHECK CONSTRAINT [FK_ReasonSK_QuoteTransReason]
GO
