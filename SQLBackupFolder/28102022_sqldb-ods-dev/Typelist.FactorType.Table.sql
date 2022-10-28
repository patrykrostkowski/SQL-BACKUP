﻿USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[FactorType]    Script Date: 28.10.2022 13:37:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[FactorType](
	[FactorTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[FactorTypeCode] [varchar](20) NOT NULL,
	[FactorTypeName] [varchar](50) NULL,
	[DomainTypeCode] [varchar](19) NULL,
	[FactorTypeDesc] [varchar](100) NULL,
 CONSTRAINT [PK_FactorType] PRIMARY KEY CLUSTERED 
(
	[FactorTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_FactorType]    Script Date: 28.10.2022 13:37:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_FactorType] ON [Typelist].[FactorType]
(
	[SourceSystemSK] ASC,
	[FactorTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[FactorType]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_FactorType] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[FactorType] NOCHECK CONSTRAINT [FK_SourceSystemSK_FactorType]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'List of rating factors used by Underwriters and insurers used during the evaluation of quotes and policy issuance.  Examples include Expousres, property locations, prior claims made, policy loss history, 
deductiibles, Hazard Groups, Terrorism...' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'FactorType'
GO
