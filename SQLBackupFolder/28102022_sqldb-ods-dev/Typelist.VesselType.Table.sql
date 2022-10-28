USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[VesselType]    Script Date: 28.10.2022 15:06:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[VesselType](
	[VesselTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[VesselTypeCode] [varchar](20) NOT NULL,
	[VesselTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_VesselType] PRIMARY KEY CLUSTERED 
(
	[VesselTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[VesselType]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_VesselType] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[VesselType] NOCHECK CONSTRAINT [FK_SourceSystemSK_VesselType]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'examples, assigned, unassigned, pending' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'VesselType'
GO
