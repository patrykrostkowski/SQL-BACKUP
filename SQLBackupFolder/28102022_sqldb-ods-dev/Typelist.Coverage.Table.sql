﻿USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[Coverage]    Script Date: 28.10.2022 12:27:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[Coverage](
	[CoverageSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[CoverageCode] [varchar](20) NOT NULL,
	[CoverageName] [varchar](60) NOT NULL,
	[ConformedCoverageCode] [varchar](20) NULL,
	[ConformedCoverageName] [varchar](50) NULL,
 CONSTRAINT [PK_Coverage] PRIMARY KEY CLUSTERED 
(
	[CoverageSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_Coverage]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_Coverage] ON [Typelist].[Coverage]
(
	[SourceSystemSK] ASC,
	[CoverageCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[Coverage]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_Coverage] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[Coverage] NOCHECK CONSTRAINT [FK_SourceSystemSK_Coverage]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'examples E&O, Excess Casualty, terrorism' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'Coverage'
GO
