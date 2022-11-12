USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteAudit]    Script Date: 12.11.2022 09:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PreBind].[QuoteAudit]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteTransSK_QuoteAudit]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteAudit]'))
ALTER TABLE [PreBind].[QuoteAudit]  WITH CHECK ADD  CONSTRAINT [FK_QuoteTransSK_QuoteAudit] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteTransSK_QuoteAudit]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteAudit]'))
ALTER TABLE [PreBind].[QuoteAudit] CHECK CONSTRAINT [FK_QuoteTransSK_QuoteAudit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SourceSystemSK_QuoteAudit]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteAudit]'))
ALTER TABLE [PreBind].[QuoteAudit]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteAudit] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SourceSystemSK_QuoteAudit]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteAudit]'))
ALTER TABLE [PreBind].[QuoteAudit] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteAudit]
GO
