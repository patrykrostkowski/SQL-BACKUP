USE [sqldb-ods-dev]
GO
/****** Object:  Table [Party].[FrontingCompany]    Script Date: 27.10.2022 12:26:52 ******/
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
	[PartySK] [int] NULL,
	[IsMGAInd] [tinyint] NULL,
	[FrontingCompanyName] [varchar](100) NOT NULL,
	[NCCICompanyCode] [varchar](25) NULL,
 CONSTRAINT [PK_FrontingCompany] PRIMARY KEY CLUSTERED 
(
	[FrontingCompanySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_FrontingCompany]    Script Date: 27.10.2022 12:28:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_FrontingCompany] ON [Party].[FrontingCompany]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Party].[FrontingCompany]  WITH NOCHECK ADD  CONSTRAINT [FK_PartySK_FrontingCompany] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[FrontingCompany] NOCHECK CONSTRAINT [FK_PartySK_FrontingCompany]
GO
ALTER TABLE [Party].[FrontingCompany]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_FrontingCompany] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Party].[FrontingCompany] NOCHECK CONSTRAINT [FK_SourceSystemSK_FrontingCompany]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fronting arrangements allow insurers to comply with financial responsibility laws imposed by many states that require evidence of coverage written by an admitted insurer, such as for auto liability' , @level0type=N'SCHEMA',@level0name=N'Party', @level1type=N'TABLE',@level1name=N'FrontingCompany'
GO
