﻿USE [DataMagnifier]
GO
/****** Object:  Table [Party].[ReinsuranceCompany]    Script Date: 10.11.2022 14:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Party].[ReinsuranceCompany]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_PartySK_ReinsuranceCompany]') AND parent_object_id = OBJECT_ID(N'[Party].[ReinsuranceCompany]'))
ALTER TABLE [Party].[ReinsuranceCompany]  WITH CHECK ADD  CONSTRAINT [FK_PartySK_ReinsuranceCompany] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_PartySK_ReinsuranceCompany]') AND parent_object_id = OBJECT_ID(N'[Party].[ReinsuranceCompany]'))
ALTER TABLE [Party].[ReinsuranceCompany] CHECK CONSTRAINT [FK_PartySK_ReinsuranceCompany]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_SourceSystemSK_ReinsuranceCompany]') AND parent_object_id = OBJECT_ID(N'[Party].[ReinsuranceCompany]'))
ALTER TABLE [Party].[ReinsuranceCompany]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ReinsuranceCompany] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_SourceSystemSK_ReinsuranceCompany]') AND parent_object_id = OBJECT_ID(N'[Party].[ReinsuranceCompany]'))
ALTER TABLE [Party].[ReinsuranceCompany] CHECK CONSTRAINT [FK_SourceSystemSK_ReinsuranceCompany]
GO
