USE [sqldb-ods-dev]
GO
/****** Object:  Table [Party].[ReinsuranceCompany]    Script Date: 28.10.2022 15:04:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Party].[ReinsuranceCompany](
	[ReinsuranceCompanySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PartySK] [int] NOT NULL,
	[ReinsuranceCompanyCode] [varchar](20) NOT NULL,
	[ReinsuranceCompanyName] [varchar](150) NOT NULL,
	[NorthAmericanInsuranceClassificationCode] [varchar](50) NULL,
	[FederalEmployerIdentificationNumberCode] [varchar](50) NULL,
	[AMBestCode] [varchar](50) NULL,
	[IsActiveInd] [tinyint] NOT NULL,
	[IsAdmittedInd] [tinyint] NOT NULL,
	[IsBranchInd] [tinyint] NOT NULL,
	[BaseCurrencyCode] [varchar](18) NULL,
 CONSTRAINT [PK_ReinsuranceCompany] PRIMARY KEY CLUSTERED 
(
	[ReinsuranceCompanySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_ReinsuranceCompany]    Script Date: 28.10.2022 15:06:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_ReinsuranceCompany] ON [Party].[ReinsuranceCompany]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Party].[ReinsuranceCompany]  WITH NOCHECK ADD  CONSTRAINT [FK_PartySK_ReinsuranceCompany] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[ReinsuranceCompany] NOCHECK CONSTRAINT [FK_PartySK_ReinsuranceCompany]
GO
ALTER TABLE [Party].[ReinsuranceCompany]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_ReinsuranceCompany] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Party].[ReinsuranceCompany] NOCHECK CONSTRAINT [FK_SourceSystemSK_ReinsuranceCompany]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies a Reinsurance Company and role.  The two basic methods of reinsurance are Facultative and Treaty. Within the scope of each of these two methods, there are two broad types - Proportional (or contributing) reinsurance and Non-Proportional (or non-contributing) reinsurance.
' , @level0type=N'SCHEMA',@level0name=N'Party', @level1type=N'TABLE',@level1name=N'ReinsuranceCompany'
GO
