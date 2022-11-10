USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[Country]    Script Date: 10.11.2022 14:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TypeList].[Country]') AND type in (N'U'))
BEGIN
CREATE TABLE [TypeList].[Country](
	[CountrySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[CountryCode] [varchar](20) NOT NULL,
	[CountryName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountrySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_Country]') AND parent_object_id = OBJECT_ID(N'[TypeList].[Country]'))
ALTER TABLE [TypeList].[Country]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_Country] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_Country]') AND parent_object_id = OBJECT_ID(N'[TypeList].[Country]'))
ALTER TABLE [TypeList].[Country] CHECK CONSTRAINT [FK_SourceSystemSK_Country]
GO
