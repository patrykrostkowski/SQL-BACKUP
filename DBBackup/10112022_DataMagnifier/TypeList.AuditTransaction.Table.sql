USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[AuditTransaction]    Script Date: 10.11.2022 14:47:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TypeList].[AuditTransaction]') AND type in (N'U'))
BEGIN
CREATE TABLE [TypeList].[AuditTransaction](
	[AuditTransactionSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[AuditTransactionCode] [varchar](20) NOT NULL,
	[AuditTransactionName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AuditTransaction] PRIMARY KEY CLUSTERED 
(
	[AuditTransactionSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_AuditTransaction]') AND parent_object_id = OBJECT_ID(N'[TypeList].[AuditTransaction]'))
ALTER TABLE [TypeList].[AuditTransaction]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_AuditTransaction] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_AuditTransaction]') AND parent_object_id = OBJECT_ID(N'[TypeList].[AuditTransaction]'))
ALTER TABLE [TypeList].[AuditTransaction] CHECK CONSTRAINT [FK_SourceSystemSK_AuditTransaction]
GO
