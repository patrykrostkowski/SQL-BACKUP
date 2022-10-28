USE [sqldb-ods-dev]
GO
/****** Object:  Table [Party].[WritingCompany]    Script Date: 28.10.2022 15:04:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Party].[WritingCompany](
	[WritingCompanySK] [int] IDENTITY(2,1) NOT NULL,
	[PartySK] [int] NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[IsBranchInd] [tinyint] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[IsFrontingCompanyInd] [tinyint] NOT NULL,
	[BaseCurrencyCode] [varchar](18) NULL,
	[WritingCompanyCode] [varchar](20) NOT NULL,
	[WritingCompanyName] [varchar](150) NOT NULL,
	[NorthAmericanIndustryClassificationCode] [varchar](50) NULL,
	[FederalEmployerIdentificationNumberCode] [varchar](50) NULL,
	[AMBestCode] [varchar](50) NULL,
	[NCCICompanyCode] [varchar](25) NULL,
	[IsActiveInd] [tinyint] NOT NULL,
	[IsAdmittedInd] [tinyint] NOT NULL,
 CONSTRAINT [PK_WritingCompany] PRIMARY KEY CLUSTERED 
(
	[WritingCompanySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_WritingCompany]    Script Date: 28.10.2022 15:06:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_WritingCompany] ON [Party].[WritingCompany]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Party].[WritingCompany]  WITH NOCHECK ADD  CONSTRAINT [FK_PartySK_WritingCompany] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[WritingCompany] NOCHECK CONSTRAINT [FK_PartySK_WritingCompany]
GO
ALTER TABLE [Party].[WritingCompany]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_WritingCompany] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Party].[WritingCompany] NOCHECK CONSTRAINT [FK_SourceSystemSK_WritingCompany]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The writing company may be a subsidiary or organizaitonal hierarchy of an insurance company that is responsible  for risk management and financial profit and loss.   Writing company identifers  may be regional (USA/Europe…) or business line (specialty, E&O...)' , @level0type=N'SCHEMA',@level0name=N'Party', @level1type=N'TABLE',@level1name=N'WritingCompany'
GO
