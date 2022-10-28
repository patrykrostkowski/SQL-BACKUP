USE [sqldb-ods-dev]
GO
/****** Object:  Table [PreBind].[QuoteAntiTheftDevice]    Script Date: 28.10.2022 13:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteAntiTheftDevice](
	[QuoteAntiTheftDeviceSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](255) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteVehicleSK] [int] NOT NULL,
	[SequenceNum] [int] NULL,
	[AntiTheftDeviceCode] [varchar](255) NULL,
	[AntiTheftProductCode] [varchar](255) NULL,
	[AntiTheftEngravingDevMfrCode] [varchar](255) NULL,
	[AntiTheftDeviceDesc] [varchar](255) NULL,
	[AntiTheftEngravingDevMfrDesc] [varchar](255) NULL,
	[AntiTheftProductDesc] [varchar](255) NULL,
 CONSTRAINT [PK_QuoteAntiTheftDevice] PRIMARY KEY CLUSTERED 
(
	[QuoteAntiTheftDeviceSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_QuoteAntiTheftDevice]    Script Date: 28.10.2022 13:37:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_QuoteAntiTheftDevice] ON [PreBind].[QuoteAntiTheftDevice]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteAntiTheftDevice]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteVehicleSK_QuoteAntiTheftDevice] FOREIGN KEY([QuoteVehicleSK])
REFERENCES [PreBind].[QuoteVehicle] ([QuoteVehicleSK])
GO
ALTER TABLE [PreBind].[QuoteAntiTheftDevice] NOCHECK CONSTRAINT [FK_QuoteVehicleSK_QuoteAntiTheftDevice]
GO
ALTER TABLE [PreBind].[QuoteAntiTheftDevice]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteAntiTheftDevice] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteAntiTheftDevice] NOCHECK CONSTRAINT [FK_SourceSystemSK_QuoteAntiTheftDevice]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This concept gives details on anti-theft equipments for a Vehicle.' , @level0type=N'SCHEMA',@level0name=N'PreBind', @level1type=N'TABLE',@level1name=N'QuoteAntiTheftDevice'
GO
