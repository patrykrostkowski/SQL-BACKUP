USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[LeadExcessQuota]    Script Date: 28.10.2022 11:10:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[LeadExcessQuota](
	[LeadExcessQuotaSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[LeadExcessQuotaCode] [varchar](20) NOT NULL,
	[LeadExcessQuotaName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LeadExcessQuota] PRIMARY KEY CLUSTERED 
(
	[LeadExcessQuotaSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_LeadExcessQuota]    Script Date: 28.10.2022 11:11:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_LeadExcessQuota] ON [Typelist].[LeadExcessQuota]
(
	[SourceSystemSK] ASC,
	[LeadExcessQuotaCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[LeadExcessQuota]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_LeadExcessQuota] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[LeadExcessQuota] NOCHECK CONSTRAINT [FK_SourceSystemSK_LeadExcessQuota]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'examples lead, excess, quota share' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'LeadExcessQuota'
GO
