USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[PolicyDeductible]    Script Date: 10.11.2022 14:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Policy].[PolicyDeductible]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_CurrencySK_PolicyDeductible]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyDeductible]'))
ALTER TABLE [Policy].[PolicyDeductible]  WITH CHECK ADD  CONSTRAINT [FK_CurrencySK_PolicyDeductible] FOREIGN KEY([CurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_CurrencySK_PolicyDeductible]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyDeductible]'))
ALTER TABLE [Policy].[PolicyDeductible] CHECK CONSTRAINT [FK_CurrencySK_PolicyDeductible]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_DeductibleLevelSK_PolicyDeductible]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyDeductible]'))
ALTER TABLE [Policy].[PolicyDeductible]  WITH CHECK ADD  CONSTRAINT [FK_DeductibleLevelSK_PolicyDeductible] FOREIGN KEY([DeductibleLevelSK])
REFERENCES [TypeList].[LevelType] ([LevelTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_DeductibleLevelSK_PolicyDeductible]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyDeductible]'))
ALTER TABLE [Policy].[PolicyDeductible] CHECK CONSTRAINT [FK_DeductibleLevelSK_PolicyDeductible]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_DeductibleTypeSK_PolicyDeductible]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyDeductible]'))
ALTER TABLE [Policy].[PolicyDeductible]  WITH CHECK ADD  CONSTRAINT [FK_DeductibleTypeSK_PolicyDeductible] FOREIGN KEY([DeductibleTypeSK])
REFERENCES [TypeList].[LimitDeductibleType] ([LimitDeductibleTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_DeductibleTypeSK_PolicyDeductible]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyDeductible]'))
ALTER TABLE [Policy].[PolicyDeductible] CHECK CONSTRAINT [FK_DeductibleTypeSK_PolicyDeductible]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyCoverageSK_PolicyDeductible]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyDeductible]'))
ALTER TABLE [Policy].[PolicyDeductible]  WITH CHECK ADD  CONSTRAINT [FK_PolicyCoverageSK_PolicyDeductible] FOREIGN KEY([PolicyCoverageSK])
REFERENCES [Policy].[PolicyCoverage] ([PolicyCoverageSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyCoverageSK_PolicyDeductible]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyDeductible]'))
ALTER TABLE [Policy].[PolicyDeductible] CHECK CONSTRAINT [FK_PolicyCoverageSK_PolicyDeductible]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyGeographySK_PolicyDeductible]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyDeductible]'))
ALTER TABLE [Policy].[PolicyDeductible]  WITH CHECK ADD  CONSTRAINT [FK_PolicyGeographySK_PolicyDeductible] FOREIGN KEY([PolicyGeographySK])
REFERENCES [Policy].[PolicyGeography] ([PolicyGeographySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyGeographySK_PolicyDeductible]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyDeductible]'))
ALTER TABLE [Policy].[PolicyDeductible] CHECK CONSTRAINT [FK_PolicyGeographySK_PolicyDeductible]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyInsurableObjectSK_PolicyDeductible]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyDeductible]'))
ALTER TABLE [Policy].[PolicyDeductible]  WITH CHECK ADD  CONSTRAINT [FK_PolicyInsurableObjectSK_PolicyDeductible] FOREIGN KEY([PolicyInsurableObjectSK])
REFERENCES [Policy].[PolicyInsurableObject] ([PolicyInsurableObjectSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyInsurableObjectSK_PolicyDeductible]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyDeductible]'))
ALTER TABLE [Policy].[PolicyDeductible] CHECK CONSTRAINT [FK_PolicyInsurableObjectSK_PolicyDeductible]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyLineofBusinessSK_PolicyDeductible]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyDeductible]'))
ALTER TABLE [Policy].[PolicyDeductible]  WITH CHECK ADD  CONSTRAINT [FK_PolicyLineofBusinessSK_PolicyDeductible] FOREIGN KEY([PolicyLineofBusinessSK])
REFERENCES [Policy].[PolicyLineofBusiness] ([PolicyLineofBusinessSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyLineofBusinessSK_PolicyDeductible]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyDeductible]'))
ALTER TABLE [Policy].[PolicyDeductible] CHECK CONSTRAINT [FK_PolicyLineofBusinessSK_PolicyDeductible]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyTransSK_PolicyDeductible]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyDeductible]'))
ALTER TABLE [Policy].[PolicyDeductible]  WITH CHECK ADD  CONSTRAINT [FK_PolicyTransSK_PolicyDeductible] FOREIGN KEY([PolicyTransSK])
REFERENCES [Policy].[PolicyTrans] ([PolicyTransSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyTransSK_PolicyDeductible]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyDeductible]'))
ALTER TABLE [Policy].[PolicyDeductible] CHECK CONSTRAINT [FK_PolicyTransSK_PolicyDeductible]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_PolicyDeductible]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyDeductible]'))
ALTER TABLE [Policy].[PolicyDeductible]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyDeductible] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_PolicyDeductible]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyDeductible]'))
ALTER TABLE [Policy].[PolicyDeductible] CHECK CONSTRAINT [FK_SourceSystemSK_PolicyDeductible]
GO
