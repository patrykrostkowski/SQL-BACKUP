USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[PersonalProperty]    Script Date: 31.10.2022 12:25:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
ALTER TABLE [Policy].[PersonalProperty]  WITH CHECK ADD  CONSTRAINT [FK_BaseCurrencySK_PersonalProperty] FOREIGN KEY([BaseCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[PersonalProperty] CHECK CONSTRAINT [FK_BaseCurrencySK_PersonalProperty]
GO
ALTER TABLE [Policy].[PersonalProperty]  WITH CHECK ADD  CONSTRAINT [FK_PolicyInsurableObjectSK_PersonalProperty] FOREIGN KEY([PolicyInsurableObjectSK])
REFERENCES [Policy].[PolicyInsurableObject] ([PolicyInsurableObjectSK])
GO
ALTER TABLE [Policy].[PersonalProperty] CHECK CONSTRAINT [FK_PolicyInsurableObjectSK_PersonalProperty]
GO
ALTER TABLE [Policy].[PersonalProperty]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PersonalProperty] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[PersonalProperty] CHECK CONSTRAINT [FK_SourceSystemSK_PersonalProperty]
GO
