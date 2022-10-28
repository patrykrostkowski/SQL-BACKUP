USE [sqldb-ods-dev]
GO
/****** Object:  Table [PreBind].[QuoteVehicleDriver]    Script Date: 28.10.2022 12:27:00 ******/
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
 CONSTRAINT [PK_QuoteVehicleDriver] PRIMARY KEY CLUSTERED 
(
	[QuoteVehicleDriverSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_QuoteVehicleDriver]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_QuoteVehicleDriver] ON [PreBind].[QuoteVehicleDriver]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteVehicleDriver]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteDriverSK_QuoteVehicleDriver] FOREIGN KEY([QuoteDriverSK])
REFERENCES [PreBind].[QuoteDriver] ([QuoteDriverSK])
GO
ALTER TABLE [PreBind].[QuoteVehicleDriver] NOCHECK CONSTRAINT [FK_QuoteDriverSK_QuoteVehicleDriver]
GO
ALTER TABLE [PreBind].[QuoteVehicleDriver]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteVehicleSK_QuoteVehicleDriver] FOREIGN KEY([QuoteVehicleSK])
REFERENCES [PreBind].[QuoteVehicle] ([QuoteVehicleSK])
GO
ALTER TABLE [PreBind].[QuoteVehicleDriver] NOCHECK CONSTRAINT [FK_QuoteVehicleSK_QuoteVehicleDriver]
GO
ALTER TABLE [PreBind].[QuoteVehicleDriver]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteVehicleDriver] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteVehicleDriver] NOCHECK CONSTRAINT [FK_SourceSystemSK_QuoteVehicleDriver]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Vehicle Driver' , @level0type=N'SCHEMA',@level0name=N'PreBind', @level1type=N'TABLE',@level1name=N'QuoteVehicleDriver'
GO
