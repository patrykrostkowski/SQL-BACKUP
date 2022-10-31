USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteAntiTheftDevice]    Script Date: 31.10.2022 12:06:58 ******/
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
ALTER TABLE [PreBind].[QuoteAntiTheftDevice]  WITH CHECK ADD  CONSTRAINT [FK_QuoteVehicleSK_QuoteAntiTheftDevice] FOREIGN KEY([QuoteVehicleSK])
REFERENCES [PreBind].[QuoteVehicle] ([QuoteVehicleSK])
GO
ALTER TABLE [PreBind].[QuoteAntiTheftDevice] CHECK CONSTRAINT [FK_QuoteVehicleSK_QuoteAntiTheftDevice]
GO
ALTER TABLE [PreBind].[QuoteAntiTheftDevice]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteAntiTheftDevice] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteAntiTheftDevice] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteAntiTheftDevice]
GO
