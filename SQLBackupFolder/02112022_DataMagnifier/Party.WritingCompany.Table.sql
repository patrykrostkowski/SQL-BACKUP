USE [DataMagnifier]
GO
/****** Object:  Table [Party].[WritingCompany]    Script Date: 02.11.2022 13:09:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Party].[WritingCompany](
	[WritingCompanySK] [int] IDENTITY(2,1) NOT NULL,
	[PartySK] [int] NOT NULL,
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
	[IsActiveInd] [tinyint] NOT NULL,
	[IsAdmittedInd] [tinyint] NOT NULL,
 CONSTRAINT [PK_WritingCompany] PRIMARY KEY CLUSTERED 
(
	[WritingCompanySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Party].[WritingCompany]  WITH CHECK ADD  CONSTRAINT [FK_PartySK_WritingCompany] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[WritingCompany] CHECK CONSTRAINT [FK_PartySK_WritingCompany]
GO
ALTER TABLE [Party].[WritingCompany]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_WritingCompany] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Party].[WritingCompany] CHECK CONSTRAINT [FK_SourceSystemSK_WritingCompany]
GO
