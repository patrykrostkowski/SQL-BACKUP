USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[PolicyLimit]    Script Date: 10.11.2022 14:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Policy].[PolicyLimit]') AND type in (N'U'))
BEGIN
CREATE TABLE [Policy].[PolicyLimit](
	[LimitSK] [int] IDENTITY(2,1) NOT NULL,
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
	[LimitLevelSK] [int] NOT NULL,
	[CurrencySK] [int] NOT NULL,
	[LimitTypeSK] [int] NOT NULL,
	[LimitValue] [varchar](100) NULL,
	[LimitDesc] [varchar](255) NULL,
	[LimitOptionName] [varchar](50) NULL,
 CONSTRAINT [PK_PolicyLimit] PRIMARY KEY CLUSTERED 
(
	[LimitSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_CurrencySK_PolicyLimit]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyLimit]'))
ALTER TABLE [Policy].[PolicyLimit]  WITH CHECK ADD  CONSTRAINT [FK_CurrencySK_PolicyLimit] FOREIGN KEY([CurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_CurrencySK_PolicyLimit]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyLimit]'))
ALTER TABLE [Policy].[PolicyLimit] CHECK CONSTRAINT [FK_CurrencySK_PolicyLimit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_LimitLevelSK_PolicyLimit]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyLimit]'))
ALTER TABLE [Policy].[PolicyLimit]  WITH CHECK ADD  CONSTRAINT [FK_LimitLevelSK_PolicyLimit] FOREIGN KEY([LimitLevelSK])
REFERENCES [TypeList].[LevelType] ([LevelTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_LimitLevelSK_PolicyLimit]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyLimit]'))
ALTER TABLE [Policy].[PolicyLimit] CHECK CONSTRAINT [FK_LimitLevelSK_PolicyLimit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_LimitTypeSK_PolicyLimit]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyLimit]'))
ALTER TABLE [Policy].[PolicyLimit]  WITH CHECK ADD  CONSTRAINT [FK_LimitTypeSK_PolicyLimit] FOREIGN KEY([LimitTypeSK])
REFERENCES [TypeList].[LimitDeductibleType] ([LimitDeductibleTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_LimitTypeSK_PolicyLimit]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyLimit]'))
ALTER TABLE [Policy].[PolicyLimit] CHECK CONSTRAINT [FK_LimitTypeSK_PolicyLimit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyCoverageSK_PolicyLimit]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyLimit]'))
ALTER TABLE [Policy].[PolicyLimit]  WITH CHECK ADD  CONSTRAINT [FK_PolicyCoverageSK_PolicyLimit] FOREIGN KEY([PolicyCoverageSK])
REFERENCES [Policy].[PolicyCoverage] ([PolicyCoverageSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyCoverageSK_PolicyLimit]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyLimit]'))
ALTER TABLE [Policy].[PolicyLimit] CHECK CONSTRAINT [FK_PolicyCoverageSK_PolicyLimit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyGeographySK_PolicyLimit]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyLimit]'))
ALTER TABLE [Policy].[PolicyLimit]  WITH CHECK ADD  CONSTRAINT [FK_PolicyGeographySK_PolicyLimit] FOREIGN KEY([PolicyGeographySK])
REFERENCES [Policy].[PolicyGeography] ([PolicyGeographySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyGeographySK_PolicyLimit]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyLimit]'))
ALTER TABLE [Policy].[PolicyLimit] CHECK CONSTRAINT [FK_PolicyGeographySK_PolicyLimit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyInsurableObjectSK_PolicyLimit]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyLimit]'))
ALTER TABLE [Policy].[PolicyLimit]  WITH CHECK ADD  CONSTRAINT [FK_PolicyInsurableObjectSK_PolicyLimit] FOREIGN KEY([PolicyInsurableObjectSK])
REFERENCES [Policy].[PolicyInsurableObject] ([PolicyInsurableObjectSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyInsurableObjectSK_PolicyLimit]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyLimit]'))
ALTER TABLE [Policy].[PolicyLimit] CHECK CONSTRAINT [FK_PolicyInsurableObjectSK_PolicyLimit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyLineofBusinessSK_PolicyLimit]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyLimit]'))
ALTER TABLE [Policy].[PolicyLimit]  WITH CHECK ADD  CONSTRAINT [FK_PolicyLineofBusinessSK_PolicyLimit] FOREIGN KEY([PolicyLineofBusinessSK])
REFERENCES [Policy].[PolicyLineofBusiness] ([PolicyLineofBusinessSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyLineofBusinessSK_PolicyLimit]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyLimit]'))
ALTER TABLE [Policy].[PolicyLimit] CHECK CONSTRAINT [FK_PolicyLineofBusinessSK_PolicyLimit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyTransSK_PolicyLimit]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyLimit]'))
ALTER TABLE [Policy].[PolicyLimit]  WITH CHECK ADD  CONSTRAINT [FK_PolicyTransSK_PolicyLimit] FOREIGN KEY([PolicyTransSK])
REFERENCES [Policy].[PolicyTrans] ([PolicyTransSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyTransSK_PolicyLimit]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyLimit]'))
ALTER TABLE [Policy].[PolicyLimit] CHECK CONSTRAINT [FK_PolicyTransSK_PolicyLimit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_PolicyLimit]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyLimit]'))
ALTER TABLE [Policy].[PolicyLimit]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyLimit] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_PolicyLimit]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyLimit]'))
ALTER TABLE [Policy].[PolicyLimit] CHECK CONSTRAINT [FK_SourceSystemSK_PolicyLimit]
GO
