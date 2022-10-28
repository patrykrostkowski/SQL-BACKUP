USE [sqldb-ods-dev]
GO
/****** Object:  Table [PreBind].[QuoteAudit]    Script Date: 28.10.2022 12:26:51 ******/
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
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_QuoteAudit]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_QuoteAudit] ON [PreBind].[QuoteAudit]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteAudit]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteTransSK_QuoteAudit] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
ALTER TABLE [PreBind].[QuoteAudit] NOCHECK CONSTRAINT [FK_QuoteTransSK_QuoteAudit]
GO
ALTER TABLE [PreBind].[QuoteAudit]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteAudit] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteAudit] NOCHECK CONSTRAINT [FK_SourceSystemSK_QuoteAudit]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Maintains notes, comments or other miscellaneous communication submitted by underwriters or other users into a Policy Administration application. Provides an audit trail on written communication of policy transactions.' , @level0type=N'SCHEMA',@level0name=N'PreBind', @level1type=N'TABLE',@level1name=N'QuoteAudit'
GO
