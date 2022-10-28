USE [sqldb-ods-dev]
GO
/****** Object:  Table [Policy].[PolicyExposure]    Script Date: 28.10.2022 12:26:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[PolicyExposure](
	[PolicyExposureSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PolicyTransSK] [int] NOT NULL,
	[PolicyLineofBusinessSK] [int] NULL,
	[PolicyGeographySK] [int] NULL,
	[PolicyInsurableObjectSK] [int] NULL,
	[PolicyCoverageSK] [int] NULL,
	[ExposureTypeSK] [int] NOT NULL,
	[ClassCodeSK] [int] NULL,
	[BaseCurrencySK] [int] NOT NULL,
	[BaseExposureAmt] [decimal](19, 4) NULL,
	[ExposureDesc] [varchar](150) NULL,
 CONSTRAINT [PK_PolicyExposure] PRIMARY KEY CLUSTERED 
(
	[PolicyExposureSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_PolicyExposure]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_PolicyExposure] ON [Policy].[PolicyExposure]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Policy].[PolicyExposure]  WITH NOCHECK ADD  CONSTRAINT [FK_ClassCodeSK_PolicyExposure] FOREIGN KEY([ClassCodeSK])
REFERENCES [Typelist].[ClassCode] ([ClassCodeSK])
GO
ALTER TABLE [Policy].[PolicyExposure] NOCHECK CONSTRAINT [FK_ClassCodeSK_PolicyExposure]
GO
ALTER TABLE [Policy].[PolicyExposure]  WITH NOCHECK ADD  CONSTRAINT [FK_CurrencySK_PolicyExposure] FOREIGN KEY([BaseCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[PolicyExposure] NOCHECK CONSTRAINT [FK_CurrencySK_PolicyExposure]
GO
ALTER TABLE [Policy].[PolicyExposure]  WITH NOCHECK ADD  CONSTRAINT [FK_ExposureTypeSK_PolicyExposure] FOREIGN KEY([ExposureTypeSK])
REFERENCES [Typelist].[ExposureType] ([ExposureTypeSK])
GO
ALTER TABLE [Policy].[PolicyExposure] NOCHECK CONSTRAINT [FK_ExposureTypeSK_PolicyExposure]
GO
ALTER TABLE [Policy].[PolicyExposure]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyCoverageSK_PolicyExposure] FOREIGN KEY([PolicyCoverageSK])
REFERENCES [Policy].[PolicyCoverage] ([PolicyCoverageSK])
GO
ALTER TABLE [Policy].[PolicyExposure] NOCHECK CONSTRAINT [FK_PolicyCoverageSK_PolicyExposure]
GO
ALTER TABLE [Policy].[PolicyExposure]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyGeographySK_PolicyExposure] FOREIGN KEY([PolicyGeographySK])
REFERENCES [Policy].[PolicyGeography] ([PolicyGeographySK])
GO
ALTER TABLE [Policy].[PolicyExposure] NOCHECK CONSTRAINT [FK_PolicyGeographySK_PolicyExposure]
GO
ALTER TABLE [Policy].[PolicyExposure]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyInsurableObjectSK_PolicyExposure] FOREIGN KEY([PolicyInsurableObjectSK])
REFERENCES [Policy].[PolicyInsurableObject] ([PolicyInsurableObjectSK])
GO
ALTER TABLE [Policy].[PolicyExposure] NOCHECK CONSTRAINT [FK_PolicyInsurableObjectSK_PolicyExposure]
GO
ALTER TABLE [Policy].[PolicyExposure]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyLineofBusinessSK_PolicyExposure] FOREIGN KEY([PolicyLineofBusinessSK])
REFERENCES [Policy].[PolicyLineofBusiness] ([PolicyLineofBusinessSK])
GO
ALTER TABLE [Policy].[PolicyExposure] NOCHECK CONSTRAINT [FK_PolicyLineofBusinessSK_PolicyExposure]
GO
ALTER TABLE [Policy].[PolicyExposure]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyTransSK_PolicyExposure] FOREIGN KEY([PolicyTransSK])
REFERENCES [Policy].[PolicyTrans] ([PolicyTransSK])
GO
ALTER TABLE [Policy].[PolicyExposure] NOCHECK CONSTRAINT [FK_PolicyTransSK_PolicyExposure]
GO
ALTER TABLE [Policy].[PolicyExposure]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyExposure] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[PolicyExposure] NOCHECK CONSTRAINT [FK_SourceSystemSK_PolicyExposure]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies an underwriters determinations  of an insureds potential for accidents and other losses. It''s measured by insurance companies in determining premiums and whether or not they will offer insurance.' , @level0type=N'SCHEMA',@level0name=N'Policy', @level1type=N'TABLE',@level1name=N'PolicyExposure'
GO
