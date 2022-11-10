USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[PolicyExposure]    Script Date: 10.11.2022 14:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Policy].[PolicyExposure]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_CurrencySK_PolicyExposure]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyExposure]'))
ALTER TABLE [Policy].[PolicyExposure]  WITH CHECK ADD  CONSTRAINT [FK_CurrencySK_PolicyExposure] FOREIGN KEY([CurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_CurrencySK_PolicyExposure]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyExposure]'))
ALTER TABLE [Policy].[PolicyExposure] CHECK CONSTRAINT [FK_CurrencySK_PolicyExposure]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_ExposureTypeSK_PolicyExposure]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyExposure]'))
ALTER TABLE [Policy].[PolicyExposure]  WITH CHECK ADD  CONSTRAINT [FK_ExposureTypeSK_PolicyExposure] FOREIGN KEY([ExposureTypeSK])
REFERENCES [TypeList].[ExposureType] ([ExposureTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_ExposureTypeSK_PolicyExposure]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyExposure]'))
ALTER TABLE [Policy].[PolicyExposure] CHECK CONSTRAINT [FK_ExposureTypeSK_PolicyExposure]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyCoverageSK_PolicyExposure]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyExposure]'))
ALTER TABLE [Policy].[PolicyExposure]  WITH CHECK ADD  CONSTRAINT [FK_PolicyCoverageSK_PolicyExposure] FOREIGN KEY([PolicyCoverageSK])
REFERENCES [Policy].[PolicyCoverage] ([PolicyCoverageSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyCoverageSK_PolicyExposure]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyExposure]'))
ALTER TABLE [Policy].[PolicyExposure] CHECK CONSTRAINT [FK_PolicyCoverageSK_PolicyExposure]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyGeographySK_PolicyExposure]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyExposure]'))
ALTER TABLE [Policy].[PolicyExposure]  WITH CHECK ADD  CONSTRAINT [FK_PolicyGeographySK_PolicyExposure] FOREIGN KEY([PolicyGeographySK])
REFERENCES [Policy].[PolicyGeography] ([PolicyGeographySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyGeographySK_PolicyExposure]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyExposure]'))
ALTER TABLE [Policy].[PolicyExposure] CHECK CONSTRAINT [FK_PolicyGeographySK_PolicyExposure]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyInsurableObjectSK_PolicyExposure]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyExposure]'))
ALTER TABLE [Policy].[PolicyExposure]  WITH CHECK ADD  CONSTRAINT [FK_PolicyInsurableObjectSK_PolicyExposure] FOREIGN KEY([PolicyInsurableObjectSK])
REFERENCES [Policy].[PolicyInsurableObject] ([PolicyInsurableObjectSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyInsurableObjectSK_PolicyExposure]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyExposure]'))
ALTER TABLE [Policy].[PolicyExposure] CHECK CONSTRAINT [FK_PolicyInsurableObjectSK_PolicyExposure]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyLineofBusinessSK_PolicyExposure]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyExposure]'))
ALTER TABLE [Policy].[PolicyExposure]  WITH CHECK ADD  CONSTRAINT [FK_PolicyLineofBusinessSK_PolicyExposure] FOREIGN KEY([PolicyLineofBusinessSK])
REFERENCES [Policy].[PolicyLineofBusiness] ([PolicyLineofBusinessSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyLineofBusinessSK_PolicyExposure]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyExposure]'))
ALTER TABLE [Policy].[PolicyExposure] CHECK CONSTRAINT [FK_PolicyLineofBusinessSK_PolicyExposure]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyTransSK_PolicyExposure]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyExposure]'))
ALTER TABLE [Policy].[PolicyExposure]  WITH CHECK ADD  CONSTRAINT [FK_PolicyTransSK_PolicyExposure] FOREIGN KEY([PolicyTransSK])
REFERENCES [Policy].[PolicyTrans] ([PolicyTransSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyTransSK_PolicyExposure]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyExposure]'))
ALTER TABLE [Policy].[PolicyExposure] CHECK CONSTRAINT [FK_PolicyTransSK_PolicyExposure]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_PolicyExposure]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyExposure]'))
ALTER TABLE [Policy].[PolicyExposure]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyExposure] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_PolicyExposure]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyExposure]'))
ALTER TABLE [Policy].[PolicyExposure] CHECK CONSTRAINT [FK_SourceSystemSK_PolicyExposure]
GO
