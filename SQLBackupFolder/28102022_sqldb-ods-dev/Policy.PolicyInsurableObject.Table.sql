﻿USE [sqldb-ods-dev]
GO
/****** Object:  Table [Policy].[PolicyInsurableObject]    Script Date: 28.10.2022 13:36:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[PolicyInsurableObject](
	[PolicyInsurableObjectSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PolicyTransSK] [int] NOT NULL,
	[PolicyGeographySK] [int] NOT NULL,
	[InsurableObjectTypeSK] [int] NOT NULL,
	[PolicySubLineSK] [int] NULL,
	[InsuredSK] [int] NOT NULL,
 CONSTRAINT [PK_PolicyInsurableObject] PRIMARY KEY CLUSTERED 
(
	[PolicyInsurableObjectSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_PolicyInsurableObject]    Script Date: 28.10.2022 13:37:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_PolicyInsurableObject] ON [Policy].[PolicyInsurableObject]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Policy].[PolicyInsurableObject]  WITH NOCHECK ADD  CONSTRAINT [FK_InsurableObjectTypeSK_PolicyInsurableObject] FOREIGN KEY([InsurableObjectTypeSK])
REFERENCES [Typelist].[InsurableObjectType] ([InsurableObjectTypeSK])
GO
ALTER TABLE [Policy].[PolicyInsurableObject] NOCHECK CONSTRAINT [FK_InsurableObjectTypeSK_PolicyInsurableObject]
GO
ALTER TABLE [Policy].[PolicyInsurableObject]  WITH NOCHECK ADD  CONSTRAINT [FK_InsuredSK_PolicyInsurableObject] FOREIGN KEY([InsuredSK])
REFERENCES [Party].[Insured] ([InsuredSK])
GO
ALTER TABLE [Policy].[PolicyInsurableObject] NOCHECK CONSTRAINT [FK_InsuredSK_PolicyInsurableObject]
GO
ALTER TABLE [Policy].[PolicyInsurableObject]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyGeographySK_PolicyInsurableObject] FOREIGN KEY([PolicyGeographySK])
REFERENCES [Policy].[PolicyGeography] ([PolicyGeographySK])
GO
ALTER TABLE [Policy].[PolicyInsurableObject] NOCHECK CONSTRAINT [FK_PolicyGeographySK_PolicyInsurableObject]
GO
ALTER TABLE [Policy].[PolicyInsurableObject]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicySubLineSK_PolicyInsurableObject] FOREIGN KEY([PolicySubLineSK])
REFERENCES [Policy].[PolicySubLine] ([PolicySubLineSK])
GO
ALTER TABLE [Policy].[PolicyInsurableObject] NOCHECK CONSTRAINT [FK_PolicySubLineSK_PolicyInsurableObject]
GO
ALTER TABLE [Policy].[PolicyInsurableObject]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyTransSK_PolicyInsurableObject] FOREIGN KEY([PolicyTransSK])
REFERENCES [Policy].[PolicyTrans] ([PolicyTransSK])
GO
ALTER TABLE [Policy].[PolicyInsurableObject] NOCHECK CONSTRAINT [FK_PolicyTransSK_PolicyInsurableObject]
GO
ALTER TABLE [Policy].[PolicyInsurableObject]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyInsurableObject] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[PolicyInsurableObject] NOCHECK CONSTRAINT [FK_SourceSystemSK_PolicyInsurableObject]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A policy holders financial assets or interests in an item,  when the damage or loss  would cause a financial loss or other hardships as defined by the value of a physical object. Examples include buildings, vehicles , fleets,  warehouses, storage facilities, garages , watercraft, artwork…' , @level0type=N'SCHEMA',@level0name=N'Policy', @level1type=N'TABLE',@level1name=N'PolicyInsurableObject'
GO
