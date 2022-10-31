USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[WritingCompany]    Script Date: 31.10.2022 12:07:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[WritingCompany](
	[WritingCompanySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[WritingCompanyCode] [varchar](20) NOT NULL,
	[WritingCompanyName] [varchar](150) NOT NULL,
	[NorthAmericanInsuranceClassificationCode] [varchar](50) NULL,
	[FederalEmployerIdentificationNumberCode] [varchar](50) NULL,
	[AMBestCode] [varchar](50) NULL,
	[IsActiveInd] [tinyint] NOT NULL,
	[IsAdmittedInd] [tinyint] NOT NULL,
	[IsBranchInd] [tinyint] NOT NULL,
	[IsFrontingCompanyInd] [tinyint] NOT NULL,
	[BaseCurrencyCode] [varchar](18) NULL,
 CONSTRAINT [PK_WritingCompany] PRIMARY KEY CLUSTERED 
(
	[WritingCompanySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[WritingCompany]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_WritingCompany] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[WritingCompany] CHECK CONSTRAINT [FK_SourceSystemSK_WritingCompany]
GO
