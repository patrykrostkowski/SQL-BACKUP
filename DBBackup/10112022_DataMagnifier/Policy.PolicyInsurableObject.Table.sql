USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[PolicyInsurableObject]    Script Date: 10.11.2022 14:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Policy].[PolicyInsurableObject]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_InsurableObjectTypeSK_PolicyInsurableObject]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyInsurableObject]'))
ALTER TABLE [Policy].[PolicyInsurableObject]  WITH CHECK ADD  CONSTRAINT [FK_InsurableObjectTypeSK_PolicyInsurableObject] FOREIGN KEY([InsurableObjectTypeSK])
REFERENCES [TypeList].[InsurableObjectType] ([InsurableObjectTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_InsurableObjectTypeSK_PolicyInsurableObject]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyInsurableObject]'))
ALTER TABLE [Policy].[PolicyInsurableObject] CHECK CONSTRAINT [FK_InsurableObjectTypeSK_PolicyInsurableObject]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_InsuredSK_PolicyInsurableObject]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyInsurableObject]'))
ALTER TABLE [Policy].[PolicyInsurableObject]  WITH CHECK ADD  CONSTRAINT [FK_InsuredSK_PolicyInsurableObject] FOREIGN KEY([InsuredSK])
REFERENCES [Party].[Insured] ([InsuredSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_InsuredSK_PolicyInsurableObject]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyInsurableObject]'))
ALTER TABLE [Policy].[PolicyInsurableObject] CHECK CONSTRAINT [FK_InsuredSK_PolicyInsurableObject]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyGeographySK_PolicyInsurableObject]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyInsurableObject]'))
ALTER TABLE [Policy].[PolicyInsurableObject]  WITH CHECK ADD  CONSTRAINT [FK_PolicyGeographySK_PolicyInsurableObject] FOREIGN KEY([PolicyGeographySK])
REFERENCES [Policy].[PolicyGeography] ([PolicyGeographySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyGeographySK_PolicyInsurableObject]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyInsurableObject]'))
ALTER TABLE [Policy].[PolicyInsurableObject] CHECK CONSTRAINT [FK_PolicyGeographySK_PolicyInsurableObject]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicySubLineSK_PolicyInsurableObject]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyInsurableObject]'))
ALTER TABLE [Policy].[PolicyInsurableObject]  WITH CHECK ADD  CONSTRAINT [FK_PolicySubLineSK_PolicyInsurableObject] FOREIGN KEY([PolicySubLineSK])
REFERENCES [Policy].[PolicySubLine] ([PolicySubLineSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicySubLineSK_PolicyInsurableObject]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyInsurableObject]'))
ALTER TABLE [Policy].[PolicyInsurableObject] CHECK CONSTRAINT [FK_PolicySubLineSK_PolicyInsurableObject]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyTransSK_PolicyInsurableObject]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyInsurableObject]'))
ALTER TABLE [Policy].[PolicyInsurableObject]  WITH CHECK ADD  CONSTRAINT [FK_PolicyTransSK_PolicyInsurableObject] FOREIGN KEY([PolicyTransSK])
REFERENCES [Policy].[PolicyTrans] ([PolicyTransSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyTransSK_PolicyInsurableObject]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyInsurableObject]'))
ALTER TABLE [Policy].[PolicyInsurableObject] CHECK CONSTRAINT [FK_PolicyTransSK_PolicyInsurableObject]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_PolicyInsurableObject]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyInsurableObject]'))
ALTER TABLE [Policy].[PolicyInsurableObject]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyInsurableObject] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_PolicyInsurableObject]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyInsurableObject]'))
ALTER TABLE [Policy].[PolicyInsurableObject] CHECK CONSTRAINT [FK_SourceSystemSK_PolicyInsurableObject]
GO
