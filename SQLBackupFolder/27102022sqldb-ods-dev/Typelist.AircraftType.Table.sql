USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[AircraftType]    Script Date: 27.10.2022 12:27:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[AircraftType](
	[AircraftTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[AircraftTypeCode] [varchar](20) NOT NULL,
	[AircraftTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AircraftType] PRIMARY KEY CLUSTERED 
(
	[AircraftTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_AircraftType]    Script Date: 27.10.2022 12:28:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_AircraftType] ON [Typelist].[AircraftType]
(
	[AircraftTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[AircraftType]  WITH NOCHECK ADD  CONSTRAINT [RefSourceSystem1069] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[AircraftType] NOCHECK CONSTRAINT [RefSourceSystem1069]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Examples include Turboprop Aircraft.
Piston Aircraft.
Jets. Light Jets. Mid-Size Jets. Jumbo Jets. Regional Jets.
Narrow Body Aircraft.
Wide Body Airliners.
Regional, Short-Haul, Federline Aircraft.
Commuter liners.' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'AircraftType'
GO
