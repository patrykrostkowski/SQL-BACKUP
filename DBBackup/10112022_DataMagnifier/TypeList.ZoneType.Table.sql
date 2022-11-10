USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[ZoneType]    Script Date: 10.11.2022 14:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TypeList].[ZoneType]') AND type in (N'U'))
BEGIN
CREATE TABLE [TypeList].[ZoneType](
	[ZoneTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[ZoneTypeCode] [varchar](20) NOT NULL,
	[ZoneTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ZoneType] PRIMARY KEY CLUSTERED 
(
	[ZoneTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_ZoneType]') AND parent_object_id = OBJECT_ID(N'[TypeList].[ZoneType]'))
ALTER TABLE [TypeList].[ZoneType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ZoneType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_ZoneType]') AND parent_object_id = OBJECT_ID(N'[TypeList].[ZoneType]'))
ALTER TABLE [TypeList].[ZoneType] CHECK CONSTRAINT [FK_SourceSystemSK_ZoneType]
GO
