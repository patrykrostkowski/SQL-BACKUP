﻿USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[LitigationStatus]    Script Date: 28.10.2022 12:27:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[LitigationStatus](
	[LitigationStatusSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[LitigationStatusCode] [varchar](20) NOT NULL,
	[LitigationStatusName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LitigationStatus] PRIMARY KEY CLUSTERED 
(
	[LitigationStatusSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_LitigationStatus]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_LitigationStatus] ON [Typelist].[LitigationStatus]
(
	[SourceSystemSK] ASC,
	[LitigationStatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[LitigationStatus]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_LitigationStatus] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[LitigationStatus] NOCHECK CONSTRAINT [FK_SourceSystemSK_LitigationStatus]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'examples closed, pending, in appeal' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'LitigationStatus'
GO
