USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[AuthorizationStatus]    Script Date: 28.10.2022 11:10:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[AuthorizationStatus](
	[AuthorizationStatusSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[AuthorizationStatusCode] [varchar](20) NOT NULL,
	[AuthorizationStatusName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AuthorizationStatus] PRIMARY KEY CLUSTERED 
(
	[AuthorizationStatusSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_AuthorizationStatus]    Script Date: 28.10.2022 11:11:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_AuthorizationStatus] ON [Typelist].[AuthorizationStatus]
(
	[SourceSystemSK] ASC,
	[AuthorizationStatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[AuthorizationStatus]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_AuthorizationStatus] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[AuthorizationStatus] NOCHECK CONSTRAINT [FK_SourceSystemSK_AuthorizationStatus]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'examples, authorized, unauthorized, cancelled' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'AuthorizationStatus'
GO
