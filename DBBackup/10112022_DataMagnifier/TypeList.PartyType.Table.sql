USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[PartyType]    Script Date: 10.11.2022 14:36:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TypeList].[PartyType]') AND type in (N'U'))
BEGIN
CREATE TABLE [TypeList].[PartyType](
	[PartyTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NULL,
	[ETLUpdateDateTime] [datetime] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[PartyTypeCode] [varchar](20) NOT NULL,
	[PartyTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PartyType] PRIMARY KEY CLUSTERED 
(
	[PartyTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_PartyType]') AND parent_object_id = OBJECT_ID(N'[TypeList].[PartyType]'))
ALTER TABLE [TypeList].[PartyType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PartyType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_PartyType]') AND parent_object_id = OBJECT_ID(N'[TypeList].[PartyType]'))
ALTER TABLE [TypeList].[PartyType] CHECK CONSTRAINT [FK_SourceSystemSK_PartyType]
GO
