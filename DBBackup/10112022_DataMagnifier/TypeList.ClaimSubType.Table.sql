USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[ClaimSubType]    Script Date: 10.11.2022 14:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TypeList].[ClaimSubType]') AND type in (N'U'))
BEGIN
CREATE TABLE [TypeList].[ClaimSubType](
	[ClaimSubTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[ClaimSubTypeCode] [varchar](20) NOT NULL,
	[ClaimSubTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ClaimSubType] PRIMARY KEY CLUSTERED 
(
	[ClaimSubTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_ClaimSubType]') AND parent_object_id = OBJECT_ID(N'[TypeList].[ClaimSubType]'))
ALTER TABLE [TypeList].[ClaimSubType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClaimSubType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_ClaimSubType]') AND parent_object_id = OBJECT_ID(N'[TypeList].[ClaimSubType]'))
ALTER TABLE [TypeList].[ClaimSubType] CHECK CONSTRAINT [FK_SourceSystemSK_ClaimSubType]
GO
