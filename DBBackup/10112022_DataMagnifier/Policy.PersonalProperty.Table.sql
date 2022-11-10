USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[PersonalProperty]    Script Date: 10.11.2022 14:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Policy].[PersonalProperty]') AND type in (N'U'))
BEGIN
CREATE TABLE [Policy].[PersonalProperty](
	[PersonalPropertySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PolicyInsurableObjectSK] [int] NOT NULL,
	[AddressLine1] [varchar](50) NULL,
	[AddressLine2] [varchar](50) NULL,
	[AddressLine3] [varchar](50) NULL,
	[CityName] [varchar](50) NULL,
	[StateCode] [varchar](10) NULL,
	[ZipCode] [varchar](20) NULL,
	[ItemNum] [varchar](10) NULL,
	[ItemName] [varchar](50) NULL,
	[ItemDesc] [varchar](100) NULL,
	[BaseCurrencySK] [int] NOT NULL,
	[ItemValueBaseAmt] [decimal](19, 4) NULL,
 CONSTRAINT [PK_PersonalProperty] PRIMARY KEY NONCLUSTERED 
(
	[PersonalPropertySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_BaseCurrencySK_PersonalProperty]') AND parent_object_id = OBJECT_ID(N'[Policy].[PersonalProperty]'))
ALTER TABLE [Policy].[PersonalProperty]  WITH CHECK ADD  CONSTRAINT [FK_BaseCurrencySK_PersonalProperty] FOREIGN KEY([BaseCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_BaseCurrencySK_PersonalProperty]') AND parent_object_id = OBJECT_ID(N'[Policy].[PersonalProperty]'))
ALTER TABLE [Policy].[PersonalProperty] CHECK CONSTRAINT [FK_BaseCurrencySK_PersonalProperty]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyInsurableObjectSK_PersonalProperty]') AND parent_object_id = OBJECT_ID(N'[Policy].[PersonalProperty]'))
ALTER TABLE [Policy].[PersonalProperty]  WITH CHECK ADD  CONSTRAINT [FK_PolicyInsurableObjectSK_PersonalProperty] FOREIGN KEY([PolicyInsurableObjectSK])
REFERENCES [Policy].[PolicyInsurableObject] ([PolicyInsurableObjectSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyInsurableObjectSK_PersonalProperty]') AND parent_object_id = OBJECT_ID(N'[Policy].[PersonalProperty]'))
ALTER TABLE [Policy].[PersonalProperty] CHECK CONSTRAINT [FK_PolicyInsurableObjectSK_PersonalProperty]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_PersonalProperty]') AND parent_object_id = OBJECT_ID(N'[Policy].[PersonalProperty]'))
ALTER TABLE [Policy].[PersonalProperty]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PersonalProperty] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_PersonalProperty]') AND parent_object_id = OBJECT_ID(N'[Policy].[PersonalProperty]'))
ALTER TABLE [Policy].[PersonalProperty] CHECK CONSTRAINT [FK_SourceSystemSK_PersonalProperty]
GO
