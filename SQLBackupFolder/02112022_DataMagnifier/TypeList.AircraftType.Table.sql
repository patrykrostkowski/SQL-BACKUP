USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[AircraftType]    Script Date: 02.11.2022 09:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[AircraftType](
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
