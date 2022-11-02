USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[AuditTransaction]    Script Date: 02.11.2022 09:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
ALTER TABLE [TypeList].[AuditTransaction]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_AuditTransaction] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[AuditTransaction] CHECK CONSTRAINT [FK_SourceSystemSK_AuditTransaction]
GO
