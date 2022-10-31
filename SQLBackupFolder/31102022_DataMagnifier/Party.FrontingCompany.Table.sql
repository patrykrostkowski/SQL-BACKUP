USE [DataMagnifier]
GO
/****** Object:  Table [Party].[FrontingCompany]    Script Date: 31.10.2022 12:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Party].[FrontingCompany](
	[FrontingCompanySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PartySK] [int] NOT NULL,
	[IsMGAInd] [tinyint] NULL,
	[FrontingCompanyName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_FrontingCompany] PRIMARY KEY CLUSTERED 
(
	[FrontingCompanySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Party].[FrontingCompany]  WITH CHECK ADD  CONSTRAINT [FK_PartySK_FrontingCompany] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[FrontingCompany] CHECK CONSTRAINT [FK_PartySK_FrontingCompany]
GO
ALTER TABLE [Party].[FrontingCompany]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_FrontingCompany] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Party].[FrontingCompany] CHECK CONSTRAINT [FK_SourceSystemSK_FrontingCompany]
GO
