USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[PolicyDeductible]    Script Date: 31.10.2022 11:58:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[PolicyDeductible](
	[DeductibleSK] [int] IDENTITY(2,1) NOT NULL,
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
	[DeductibleLevelSK] [int] NOT NULL,
	[DeductibleTypeSK] [int] NOT NULL,
	[CurrencySK] [int] NOT NULL,
	[DeductibleValue] [varchar](100) NOT NULL,
	[DeductibleDesc] [varchar](255) NULL,
	[DeductibleOptionName] [varchar](50) NULL,
 CONSTRAINT [PK_PolicyDeductible] PRIMARY KEY CLUSTERED 
(
	[DeductibleSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Policy].[PolicyDeductible]  WITH CHECK ADD  CONSTRAINT [FK_CurrencySK_PolicyDeductible] FOREIGN KEY([CurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[PolicyDeductible] CHECK CONSTRAINT [FK_CurrencySK_PolicyDeductible]
GO
ALTER TABLE [Policy].[PolicyDeductible]  WITH CHECK ADD  CONSTRAINT [FK_DeductibleLevelSK_PolicyDeductible] FOREIGN KEY([DeductibleLevelSK])
REFERENCES [TypeList].[LevelType] ([LevelTypeSK])
GO
ALTER TABLE [Policy].[PolicyDeductible] CHECK CONSTRAINT [FK_DeductibleLevelSK_PolicyDeductible]
GO
ALTER TABLE [Policy].[PolicyDeductible]  WITH CHECK ADD  CONSTRAINT [FK_DeductibleTypeSK_PolicyDeductible] FOREIGN KEY([DeductibleTypeSK])
REFERENCES [TypeList].[LimitDeductibleType] ([LimitDeductibleTypeSK])
GO
ALTER TABLE [Policy].[PolicyDeductible] CHECK CONSTRAINT [FK_DeductibleTypeSK_PolicyDeductible]
GO
ALTER TABLE [Policy].[PolicyDeductible]  WITH CHECK ADD  CONSTRAINT [FK_PolicyCoverageSK_PolicyDeductible] FOREIGN KEY([PolicyCoverageSK])
REFERENCES [Policy].[PolicyCoverage] ([PolicyCoverageSK])
GO
ALTER TABLE [Policy].[PolicyDeductible] CHECK CONSTRAINT [FK_PolicyCoverageSK_PolicyDeductible]
GO
ALTER TABLE [Policy].[PolicyDeductible]  WITH CHECK ADD  CONSTRAINT [FK_PolicyGeographySK_PolicyDeductible] FOREIGN KEY([PolicyGeographySK])
REFERENCES [Policy].[PolicyGeography] ([PolicyGeographySK])
GO
ALTER TABLE [Policy].[PolicyDeductible] CHECK CONSTRAINT [FK_PolicyGeographySK_PolicyDeductible]
GO
ALTER TABLE [Policy].[PolicyDeductible]  WITH CHECK ADD  CONSTRAINT [FK_PolicyInsurableObjectSK_PolicyDeductible] FOREIGN KEY([PolicyInsurableObjectSK])
REFERENCES [Policy].[PolicyInsurableObject] ([PolicyInsurableObjectSK])
GO
ALTER TABLE [Policy].[PolicyDeductible] CHECK CONSTRAINT [FK_PolicyInsurableObjectSK_PolicyDeductible]
GO
ALTER TABLE [Policy].[PolicyDeductible]  WITH CHECK ADD  CONSTRAINT [FK_PolicyLineofBusinessSK_PolicyDeductible] FOREIGN KEY([PolicyLineofBusinessSK])
REFERENCES [Policy].[PolicyLineofBusiness] ([PolicyLineofBusinessSK])
GO
ALTER TABLE [Policy].[PolicyDeductible] CHECK CONSTRAINT [FK_PolicyLineofBusinessSK_PolicyDeductible]
GO
ALTER TABLE [Policy].[PolicyDeductible]  WITH CHECK ADD  CONSTRAINT [FK_PolicyTransSK_PolicyDeductible] FOREIGN KEY([PolicyTransSK])
REFERENCES [Policy].[PolicyTrans] ([PolicyTransSK])
GO
ALTER TABLE [Policy].[PolicyDeductible] CHECK CONSTRAINT [FK_PolicyTransSK_PolicyDeductible]
GO
ALTER TABLE [Policy].[PolicyDeductible]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyDeductible] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[PolicyDeductible] CHECK CONSTRAINT [FK_SourceSystemSK_PolicyDeductible]
GO
