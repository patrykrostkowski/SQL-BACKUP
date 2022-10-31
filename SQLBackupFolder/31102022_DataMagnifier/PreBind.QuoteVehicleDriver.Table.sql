USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteVehicleDriver]    Script Date: 31.10.2022 12:09:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteVehicleDriver](
	[QuoteVehicleDriverSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](255) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteVehicleSK] [int] NOT NULL,
	[QuoteDriverSK] [int] NOT NULL,
	[IsPrimaryDriverInd] [tinyint] NULL,
	[IsExcludedDriverInd] [tinyint] NULL,
 CONSTRAINT [PK_QuoteVehicleDriver] PRIMARY KEY NONCLUSTERED 
(
	[QuoteVehicleDriverSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteVehicleDriver]  WITH CHECK ADD  CONSTRAINT [FK_QuoteDriverSK_QuoteVehicleDriver] FOREIGN KEY([QuoteDriverSK])
REFERENCES [PreBind].[QuoteDriver] ([QuoteDriverSK])
GO
ALTER TABLE [PreBind].[QuoteVehicleDriver] CHECK CONSTRAINT [FK_QuoteDriverSK_QuoteVehicleDriver]
GO
ALTER TABLE [PreBind].[QuoteVehicleDriver]  WITH CHECK ADD  CONSTRAINT [FK_QuoteVehicleSK_QuoteVehicleDriver] FOREIGN KEY([QuoteVehicleSK])
REFERENCES [PreBind].[QuoteVehicle] ([QuoteVehicleSK])
GO
ALTER TABLE [PreBind].[QuoteVehicleDriver] CHECK CONSTRAINT [FK_QuoteVehicleSK_QuoteVehicleDriver]
GO
ALTER TABLE [PreBind].[QuoteVehicleDriver]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteVehicleDriver] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteVehicleDriver] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteVehicleDriver]
GO
