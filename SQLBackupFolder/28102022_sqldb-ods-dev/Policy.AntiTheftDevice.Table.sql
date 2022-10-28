USE [sqldb-ods-dev]
GO
/****** Object:  Table [Policy].[AntiTheftDevice]    Script Date: 28.10.2022 11:09:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[AntiTheftDevice](
	[AntiTheftDeviceSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](255) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[SequenceNum] [int] NULL,
	[AntiTheftDeviceCode] [varchar](255) NULL,
	[AntiTheftProductCode] [varchar](255) NULL,
	[AntiTheftEngravingDevMfrCode] [varchar](255) NULL,
	[VehicleSK] [int] NULL,
	[AntiTheftDeviceDesc] [varchar](255) NULL,
	[AntiTheftEngravingDevMfrDesc] [varchar](255) NULL,
	[AntiTheftProductDesc] [varchar](255) NULL,
 CONSTRAINT [PK_AntiTheftDevice] PRIMARY KEY CLUSTERED 
(
	[AntiTheftDeviceSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_AntiTheftDevice]    Script Date: 28.10.2022 11:11:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_AntiTheftDevice] ON [Policy].[AntiTheftDevice]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Policy].[AntiTheftDevice]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_AntiTheftDevice] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[AntiTheftDevice] NOCHECK CONSTRAINT [FK_SourceSystemSK_AntiTheftDevice]
GO
ALTER TABLE [Policy].[AntiTheftDevice]  WITH NOCHECK ADD  CONSTRAINT [FK_VehicleSK_AntiTheftDevice] FOREIGN KEY([VehicleSK])
REFERENCES [Policy].[Vehicle] ([VehicleSK])
GO
ALTER TABLE [Policy].[AntiTheftDevice] NOCHECK CONSTRAINT [FK_VehicleSK_AntiTheftDevice]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This concept gives details on anti-theft equipments for a Vehicle.' , @level0type=N'SCHEMA',@level0name=N'Policy', @level1type=N'TABLE',@level1name=N'AntiTheftDevice'
GO
