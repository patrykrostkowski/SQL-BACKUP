﻿USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[AnnualStatementLineofBusiness]    Script Date: 28.10.2022 15:05:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[AnnualStatementLineofBusiness](
	[AnnualStatementLineofBusinessSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[AnnualStatementLineofBusinessCode] [varchar](20) NOT NULL,
	[AnnualStatementLineofBusinessName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AnnualStatementLineofBusiness] PRIMARY KEY CLUSTERED 
(
	[AnnualStatementLineofBusinessSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_AnnualStatementLineofBusiness]    Script Date: 28.10.2022 15:06:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_AnnualStatementLineofBusiness] ON [Typelist].[AnnualStatementLineofBusiness]
(
	[SourceSystemSK] ASC,
	[AnnualStatementLineofBusinessCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[AnnualStatementLineofBusiness]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_AnnualStatementLineofBusiness] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[AnnualStatementLineofBusiness] NOCHECK CONSTRAINT [FK_SourceSystemSK_AnnualStatementLineofBusiness]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'examples property, casualty, flood  examples property, casualty, flood.  Annual Statement Lines are identifiers required by the state insurance commissioner detailing an insurer''s income, expenses, assets, and liabilities, along with other pertinent data.' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'AnnualStatementLineofBusiness'
GO
