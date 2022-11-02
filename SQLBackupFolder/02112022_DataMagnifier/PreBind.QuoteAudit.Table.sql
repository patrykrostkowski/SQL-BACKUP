USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteAudit]    Script Date: 02.11.2022 09:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteAudit](
	[QuoteAuditSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteTransSK] [int] NULL,
	[AuditTransactionTypeSK] [int] NOT NULL,
	[InsuredName] [varchar](255) NULL,
	[OriginalValue] [varchar](1333) NULL,
	[NewValue] [varchar](1333) NULL,
	[CreateDateTime] [datetime] NOT NULL,
	[AuditDesc] [varchar](1333) NULL,
	[IsLogicallyDeletedInd] [tinyint] NOT NULL,
 CONSTRAINT [PK_QuoteAudit] PRIMARY KEY CLUSTERED 
(
	[QuoteAuditSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[SourceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteAudit]  WITH CHECK ADD  CONSTRAINT [FK_QuoteTransSK_QuoteAudit] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
ALTER TABLE [PreBind].[QuoteAudit] CHECK CONSTRAINT [FK_QuoteTransSK_QuoteAudit]
GO
ALTER TABLE [PreBind].[QuoteAudit]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteAudit] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteAudit] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteAudit]
GO
