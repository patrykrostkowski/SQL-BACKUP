USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[PolicyExposure]    Script Date: 18.11.2022 16:54:02 ******/
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
	[CurrencySK] [int] NOT NULL,
	[ExposureAmt] [decimal](19, 4) NULL,
	[ExposureDesc] [varchar](150) NULL,
 CONSTRAINT [PK_PolicyExposure] PRIMARY KEY CLUSTERED 
(
	[PolicyExposureSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Policy].[PolicyExposure]  WITH CHECK ADD  CONSTRAINT [FK_CurrencySK_PolicyExposure] FOREIGN KEY([CurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[PolicyExposure] CHECK CONSTRAINT [FK_CurrencySK_PolicyExposure]
GO
ALTER TABLE [Policy].[PolicyExposure]  WITH CHECK ADD  CONSTRAINT [FK_ExposureTypeSK_PolicyExposure] FOREIGN KEY([ExposureTypeSK])
REFERENCES [TypeList].[ExposureType] ([ExposureTypeSK])
GO
ALTER TABLE [Policy].[PolicyExposure] CHECK CONSTRAINT [FK_ExposureTypeSK_PolicyExposure]
GO
ALTER TABLE [Policy].[PolicyExposure]  WITH CHECK ADD  CONSTRAINT [FK_PolicyCoverageSK_PolicyExposure] FOREIGN KEY([PolicyCoverageSK])
REFERENCES [Policy].[PolicyCoverage] ([PolicyCoverageSK])
GO
ALTER TABLE [Policy].[PolicyExposure] CHECK CONSTRAINT [FK_PolicyCoverageSK_PolicyExposure]
GO
ALTER TABLE [Policy].[PolicyExposure]  WITH CHECK ADD  CONSTRAINT [FK_PolicyGeographySK_PolicyExposure] FOREIGN KEY([PolicyGeographySK])
REFERENCES [Policy].[PolicyGeography] ([PolicyGeographySK])
GO
ALTER TABLE [Policy].[PolicyExposure] CHECK CONSTRAINT [FK_PolicyGeographySK_PolicyExposure]
GO
ALTER TABLE [Policy].[PolicyExposure]  WITH CHECK ADD  CONSTRAINT [FK_PolicyInsurableObjectSK_PolicyExposure] FOREIGN KEY([PolicyInsurableObjectSK])
REFERENCES [Policy].[PolicyInsurableObject] ([PolicyInsurableObjectSK])
GO
ALTER TABLE [Policy].[PolicyExposure] CHECK CONSTRAINT [FK_PolicyInsurableObjectSK_PolicyExposure]
GO
ALTER TABLE [Policy].[PolicyExposure]  WITH CHECK ADD  CONSTRAINT [FK_PolicyLineofBusinessSK_PolicyExposure] FOREIGN KEY([PolicyLineofBusinessSK])
REFERENCES [Policy].[PolicyLineofBusiness] ([PolicyLineofBusinessSK])
GO
ALTER TABLE [Policy].[PolicyExposure] CHECK CONSTRAINT [FK_PolicyLineofBusinessSK_PolicyExposure]
GO
ALTER TABLE [Policy].[PolicyExposure]  WITH CHECK ADD  CONSTRAINT [FK_PolicyTransSK_PolicyExposure] FOREIGN KEY([PolicyTransSK])
REFERENCES [Policy].[PolicyTrans] ([PolicyTransSK])
GO
ALTER TABLE [Policy].[PolicyExposure] CHECK CONSTRAINT [FK_PolicyTransSK_PolicyExposure]
GO
ALTER TABLE [Policy].[PolicyExposure]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyExposure] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[PolicyExposure] CHECK CONSTRAINT [FK_SourceSystemSK_PolicyExposure]
GO
