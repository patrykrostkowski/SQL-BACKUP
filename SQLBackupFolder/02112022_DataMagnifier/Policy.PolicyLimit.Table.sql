USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[PolicyLimit]    Script Date: 02.11.2022 14:05:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
ALTER TABLE [Policy].[PolicyLimit]  WITH CHECK ADD  CONSTRAINT [FK_CurrencySK_PolicyLimit] FOREIGN KEY([CurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[PolicyLimit] CHECK CONSTRAINT [FK_CurrencySK_PolicyLimit]
GO
ALTER TABLE [Policy].[PolicyLimit]  WITH CHECK ADD  CONSTRAINT [FK_LimitLevelSK_PolicyLimit] FOREIGN KEY([LimitLevelSK])
REFERENCES [TypeList].[LevelType] ([LevelTypeSK])
GO
ALTER TABLE [Policy].[PolicyLimit] CHECK CONSTRAINT [FK_LimitLevelSK_PolicyLimit]
GO
ALTER TABLE [Policy].[PolicyLimit]  WITH CHECK ADD  CONSTRAINT [FK_LimitTypeSK_PolicyLimit] FOREIGN KEY([LimitTypeSK])
REFERENCES [TypeList].[LimitDeductibleType] ([LimitDeductibleTypeSK])
GO
ALTER TABLE [Policy].[PolicyLimit] CHECK CONSTRAINT [FK_LimitTypeSK_PolicyLimit]
GO
ALTER TABLE [Policy].[PolicyLimit]  WITH CHECK ADD  CONSTRAINT [FK_PolicyCoverageSK_PolicyLimit] FOREIGN KEY([PolicyCoverageSK])
REFERENCES [Policy].[PolicyCoverage] ([PolicyCoverageSK])
GO
ALTER TABLE [Policy].[PolicyLimit] CHECK CONSTRAINT [FK_PolicyCoverageSK_PolicyLimit]
GO
ALTER TABLE [Policy].[PolicyLimit]  WITH CHECK ADD  CONSTRAINT [FK_PolicyGeographySK_PolicyLimit] FOREIGN KEY([PolicyGeographySK])
REFERENCES [Policy].[PolicyGeography] ([PolicyGeographySK])
GO
ALTER TABLE [Policy].[PolicyLimit] CHECK CONSTRAINT [FK_PolicyGeographySK_PolicyLimit]
GO
ALTER TABLE [Policy].[PolicyLimit]  WITH CHECK ADD  CONSTRAINT [FK_PolicyInsurableObjectSK_PolicyLimit] FOREIGN KEY([PolicyInsurableObjectSK])
REFERENCES [Policy].[PolicyInsurableObject] ([PolicyInsurableObjectSK])
GO
ALTER TABLE [Policy].[PolicyLimit] CHECK CONSTRAINT [FK_PolicyInsurableObjectSK_PolicyLimit]
GO
ALTER TABLE [Policy].[PolicyLimit]  WITH CHECK ADD  CONSTRAINT [FK_PolicyLineofBusinessSK_PolicyLimit] FOREIGN KEY([PolicyLineofBusinessSK])
REFERENCES [Policy].[PolicyLineofBusiness] ([PolicyLineofBusinessSK])
GO
ALTER TABLE [Policy].[PolicyLimit] CHECK CONSTRAINT [FK_PolicyLineofBusinessSK_PolicyLimit]
GO
ALTER TABLE [Policy].[PolicyLimit]  WITH CHECK ADD  CONSTRAINT [FK_PolicyTransSK_PolicyLimit] FOREIGN KEY([PolicyTransSK])
REFERENCES [Policy].[PolicyTrans] ([PolicyTransSK])
GO
ALTER TABLE [Policy].[PolicyLimit] CHECK CONSTRAINT [FK_PolicyTransSK_PolicyLimit]
GO
ALTER TABLE [Policy].[PolicyLimit]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyLimit] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[PolicyLimit] CHECK CONSTRAINT [FK_SourceSystemSK_PolicyLimit]
GO
