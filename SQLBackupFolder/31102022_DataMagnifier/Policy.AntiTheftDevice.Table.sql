USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[AntiTheftDevice]    Script Date: 31.10.2022 12:31:14 ******/
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
ALTER TABLE [Policy].[AntiTheftDevice]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_AntiTheftDevice] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[AntiTheftDevice] CHECK CONSTRAINT [FK_SourceSystemSK_AntiTheftDevice]
GO
ALTER TABLE [Policy].[AntiTheftDevice]  WITH CHECK ADD  CONSTRAINT [FK_VehicleSK_AntiTheftDevice] FOREIGN KEY([VehicleSK])
REFERENCES [Policy].[Vehicle] ([VehicleSK])
GO
ALTER TABLE [Policy].[AntiTheftDevice] CHECK CONSTRAINT [FK_VehicleSK_AntiTheftDevice]
GO
