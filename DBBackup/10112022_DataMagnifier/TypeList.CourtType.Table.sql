USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[CourtType]    Script Date: 10.11.2022 14:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TypeList].[CourtType]') AND type in (N'U'))
BEGIN
CREATE TABLE [TypeList].[CourtType](
	[CourtTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[CourtTypeCode] [varchar](20) NOT NULL,
	[CourtTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CourtType] PRIMARY KEY CLUSTERED 
(
	[CourtTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_CourtType]') AND parent_object_id = OBJECT_ID(N'[TypeList].[CourtType]'))
ALTER TABLE [TypeList].[CourtType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_CourtType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_CourtType]') AND parent_object_id = OBJECT_ID(N'[TypeList].[CourtType]'))
ALTER TABLE [TypeList].[CourtType] CHECK CONSTRAINT [FK_SourceSystemSK_CourtType]
GO
