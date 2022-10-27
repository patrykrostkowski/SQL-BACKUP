USE [sqldb-ods-dev]
GO
/****** Object:  Table [Policy].[IMTransportationClass]    Script Date: 27.10.2022 12:27:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[IMTransportationClass](
	[IMTransportationClassSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](255) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PolicyInsurableObjectSK] [int] NOT NULL,
 CONSTRAINT [PK_IMTransportationClass] PRIMARY KEY CLUSTERED 
(
	[IMTransportationClassSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_IMTransportationClass]    Script Date: 27.10.2022 12:28:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_IMTransportationClass] ON [Policy].[IMTransportationClass]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Policy].[IMTransportationClass]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyInsurableObjectSK_IMTransportationClass] FOREIGN KEY([PolicyInsurableObjectSK])
REFERENCES [Policy].[PolicyInsurableObject] ([PolicyInsurableObjectSK])
GO
ALTER TABLE [Policy].[IMTransportationClass] NOCHECK CONSTRAINT [FK_PolicyInsurableObjectSK_IMTransportationClass]
GO
ALTER TABLE [Policy].[IMTransportationClass]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_IMTransportationClass] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[IMTransportationClass] NOCHECK CONSTRAINT [FK_SourceSystemSK_IMTransportationClass]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Transportation Class is a subtype of Insurable Object that describes the kinds of Transportation being insured.  
Transportation is a type of  Inland Marine  insurance.' , @level0type=N'SCHEMA',@level0name=N'Policy', @level1type=N'TABLE',@level1name=N'IMTransportationClass'
GO
