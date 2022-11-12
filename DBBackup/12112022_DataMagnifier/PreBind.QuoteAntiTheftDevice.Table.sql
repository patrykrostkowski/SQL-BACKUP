USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteAntiTheftDevice]    Script Date: 12.11.2022 09:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PreBind].[QuoteAntiTheftDevice]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteVehicleSK_QuoteAntiTheftDevice]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteAntiTheftDevice]'))
ALTER TABLE [PreBind].[QuoteAntiTheftDevice]  WITH CHECK ADD  CONSTRAINT [FK_QuoteVehicleSK_QuoteAntiTheftDevice] FOREIGN KEY([QuoteVehicleSK])
REFERENCES [PreBind].[QuoteVehicle] ([QuoteVehicleSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteVehicleSK_QuoteAntiTheftDevice]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteAntiTheftDevice]'))
ALTER TABLE [PreBind].[QuoteAntiTheftDevice] CHECK CONSTRAINT [FK_QuoteVehicleSK_QuoteAntiTheftDevice]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SourceSystemSK_QuoteAntiTheftDevice]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteAntiTheftDevice]'))
ALTER TABLE [PreBind].[QuoteAntiTheftDevice]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteAntiTheftDevice] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SourceSystemSK_QuoteAntiTheftDevice]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteAntiTheftDevice]'))
ALTER TABLE [PreBind].[QuoteAntiTheftDevice] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteAntiTheftDevice]
GO
