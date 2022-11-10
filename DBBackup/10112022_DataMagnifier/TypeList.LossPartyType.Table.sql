USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[LossPartyType]    Script Date: 10.11.2022 14:36:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TypeList].[LossPartyType]') AND type in (N'U'))
BEGIN
CREATE TABLE [TypeList].[LossPartyType](
	[LossPartyTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[LossPartyTypeCode] [varchar](20) NOT NULL,
	[LossPartyTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LossPartyType] PRIMARY KEY CLUSTERED 
(
	[LossPartyTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_LossPartyType]') AND parent_object_id = OBJECT_ID(N'[TypeList].[LossPartyType]'))
ALTER TABLE [TypeList].[LossPartyType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_LossPartyType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_LossPartyType]') AND parent_object_id = OBJECT_ID(N'[TypeList].[LossPartyType]'))
ALTER TABLE [TypeList].[LossPartyType] CHECK CONSTRAINT [FK_SourceSystemSK_LossPartyType]
GO
