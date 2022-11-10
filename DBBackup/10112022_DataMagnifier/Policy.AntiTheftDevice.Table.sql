USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[AntiTheftDevice]    Script Date: 10.11.2022 14:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Policy].[AntiTheftDevice]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_AntiTheftDevice]') AND parent_object_id = OBJECT_ID(N'[Policy].[AntiTheftDevice]'))
ALTER TABLE [Policy].[AntiTheftDevice]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_AntiTheftDevice] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_AntiTheftDevice]') AND parent_object_id = OBJECT_ID(N'[Policy].[AntiTheftDevice]'))
ALTER TABLE [Policy].[AntiTheftDevice] CHECK CONSTRAINT [FK_SourceSystemSK_AntiTheftDevice]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_VehicleSK_AntiTheftDevice]') AND parent_object_id = OBJECT_ID(N'[Policy].[AntiTheftDevice]'))
ALTER TABLE [Policy].[AntiTheftDevice]  WITH CHECK ADD  CONSTRAINT [FK_VehicleSK_AntiTheftDevice] FOREIGN KEY([VehicleSK])
REFERENCES [Policy].[Vehicle] ([VehicleSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_VehicleSK_AntiTheftDevice]') AND parent_object_id = OBJECT_ID(N'[Policy].[AntiTheftDevice]'))
ALTER TABLE [Policy].[AntiTheftDevice] CHECK CONSTRAINT [FK_VehicleSK_AntiTheftDevice]
GO
